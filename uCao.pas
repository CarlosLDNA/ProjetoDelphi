unit uCao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, udmPrincipal, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCao = class(TForm)
    pgCao: TPageControl;
    tbConsulta: TTabSheet;
    tbCadastro: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgCao: TDBGrid;
    edtProcurar: TEdit;
    lbProcurar: TLabel;
    btIncluir: TButton;
    btnEditar: TButton;
    btnExluir: TButton;
    btnFechar: TButton;
    tbCao: TFDQuery;
    dsCao: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    lbNome: TLabel;
    lbRaca: TLabel;
    dbeNome: TDBEdit;
    dbeRaca: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
  private
    procedure DeleteCao(CodCao: string);
    function Sequencial: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCao: TfrmCao;
  mensagem  : word;

const

  SQL_DELETE_CAO = 'DELETE FROM CAO WHERE IDCAO = %S';

  SQL_SEQUENCIA_NOVA = 'SELECT GEN_ID(GEN_CAO_ID, 1) as sequencia from RDB$DATABASE;';

  SQL_PROCURA_CAO = 'SELECT IDCAO, NOME, RACA FROM CAO WHERE UPPER(NOME) LIKE %S';

implementation

{$R *.dfm}

procedure TfrmCao.btIncluirClick(Sender: TObject);
begin
  tbCao.CachedUpdates := True;
  tbCao.Open;
  tbCao.Insert;
  tbCadastro.TabVisible := True;
  pgCao.ActivePage := tbCadastro;
end;

procedure TfrmCao.btnCancelarClick(Sender: TObject);
begin
  if tbCao.State in [dsInsert, dsEdit] then
  begin
    tbCao.Cancel;
    pgCao.ActivePage :=  tbConsulta;
    tbCadastro.TabVisible := false;
  end;
end;

procedure TfrmCao.btnEditarClick(Sender: TObject);
begin
  tbCao.Edit;
  tbCadastro.TabVisible := True;
  pgCao.ActivePage := tbCadastro;
end;

procedure TfrmCao.btnExluirClick(Sender: TObject);
begin
  mensagem:= Messagebox(Handle, 'Deseja Realmente Excluir este Registro?', 'Informa??o', Mb_yesno or mb_iconinformation);
  If mensagem = IDYes then
  begin
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
    try
      DeleteCao(dbgCao.Columns.Items[0].Field.AsString);
      dmPrincipal.Connection.Commit;
    except
      on E:Exception do
      begin
        Showmessage('Ocorreu um erro de banco de dados! '+'Erro ao excluir registro '+#13+
        'Detalhe: '+E.Message);
        dmPrincipal.Connection.Rollback;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmCao.btnFecharClick(Sender: TObject);
begin
  if tbCao.State in [dsInsert,dsEdit] then
  begin
    Application.MessageBox('Atualiza??o/Inser??o deve ser conclu?da, antes de Fechar!', 'Alerta - Aviso do Sistema', mb_iconwarning+mb_ok);
    abort;
  end
  else
    Close;
end;

procedure TfrmCao.btnSalvarClick(Sender: TObject);
begin
  tbCao.FieldByName('IDCAO').AsInteger := Sequencial;
  tbCao.Post;
  tbCao.ApplyUpdates(0);
  tbCao.Close;
  tbCao.Open;
  tbCao.Refresh;
  pgCao.ActivePage := tbConsulta;
  tbCadastro.TabVisible := True;
end;

procedure TfrmCao.DeleteCao(CodCao: string);
var
  QryCao : TFDQuery;
begin
  QryCao := TFDQuery.Create(nil);
  try
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
    try
      QryCao.Connection := dmPrincipal.Connection;
      QryCao.ExecSQL(Format(SQL_DELETE_CAO, [CodCao]));
      dmPrincipal.Connection.Commit;
    except
      on E:Exception do
      begin
        Showmessage('Ocorreu um erro de banco de dados! '+'Erro ao excluir registro '+#13+
        'Detalhe: '+E.Message);
        dmPrincipal.Connection.Rollback;
        Exit;
      end;
    end;
  finally
    FreeAndNil(QryCao);
    tbCao.ApplyUpdates(0);
    tbCao.Close;
    tbCao.Open;
    tbCao.Refresh;
  end;
end;

procedure TfrmCao.edtProcurarChange(Sender: TObject);
var
  sTexto : String;
begin
  tbCao.Close;
  tbCao.SQL.Clear;
  sTexto := '%' + edtProcurar.Text + '%';
  tbCao.Open(Format(SQL_PROCURA_CAO,[QuotedStr(sTexto)]));
end;

procedure TfrmCao.FormShow(Sender: TObject);
begin
  dmPrincipal.Connection.Connected := True;
  tbCadastro.TabVisible := False;
  pgCao.ActivePage := tbConsulta;
  tbCao.Active := True;
  edtProcurar.SetFocus;
end;

function TfrmCao.Sequencial: Integer;
var
  iSeq : Integer;
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dmPrincipal.Connection;
    Qry.SQL.Add(SQL_SEQUENCIA_NOVA);
    Qry.Open;
    Result := Qry.Fields[0].AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;



end.
