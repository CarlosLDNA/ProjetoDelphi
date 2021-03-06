unit uPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  ZAbstractConnection, ZConnection, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, udmPrincipal;

type
  TfrmPessoa = class(TForm)
    dsPessoa: TDataSource;
    pgPessoa: TPageControl;
    tbConsulta: TTabSheet;
    tbCadastro: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btIncluir: TButton;
    btnEditar: TButton;
    btnExluir: TButton;
    btnFechar: TButton;
    dbPessoa: TDBGrid;
    lbProcurar: TLabel;
    edtProcurar: TEdit;
    tbPessoa: TFDQuery;
    Panel4: TPanel;
    Panel5: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dbeNome: TDBEdit;
    lbNome: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExluirClick(Sender: TObject);
    procedure edtProcurarChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    function Sequencial: Integer;
    procedure DeletePessoa(CodPessoa: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoa: TfrmPessoa;
  mensagem  : word;

const

  SQL_PROCURA_PESSOA = 'SELECT IDDONO, NOME FROM PESSOA WHERE UPPER(NOME) LIKE %S';

  SQL_SEQUENCIA_NOVA = 'SELECT GEN_ID(GEN_PESSOA_ID, 1) as sequencia from RDB$DATABASE;';

  SQL_DELETE_PESSOA = 'DELETE FROM PESSOA WHERE IDDONO = %S';

  SQL_DELETE_CAO_PESSOA = 'DELETE FROM CAO_PESSOA WHERE IDDONO = %S AND IDCAO = %S';

  SQL_DELETE_CAO = 'DELETE FROM CAO WHERE IDCAO = %S';

  SQL_RETORNA_CAO = 'SELECT IDCAO FROM CAO_PESSOA WHERE IDDONO = %S';

implementation

{$R *.dfm}

procedure TfrmPessoa.btIncluirClick(Sender: TObject);
begin
  tbPessoa.CachedUpdates := True;
  tbPessoa.Open;
  tbPessoa.Insert;
  tbCadastro.TabVisible := True;
  pgPessoa.ActivePage := tbCadastro;
end;

procedure TfrmPessoa.btnCancelarClick(Sender: TObject);
begin
  if tbPessoa.State in [dsInsert, dsEdit] then
  begin
    tbPessoa.Cancel;
    pgPessoa.ActivePage :=  tbConsulta;
    tbCadastro.TabVisible := false;
  end;
end;

procedure TfrmPessoa.btnEditarClick(Sender: TObject);
begin
  tbPessoa.Edit;
  tbCadastro.TabVisible := True;
  pgPessoa.ActivePage := tbCadastro;
end;

procedure TfrmPessoa.btnExluirClick(Sender: TObject);
begin
  mensagem:= Messagebox(Handle, 'Deseja Realmente Excluir este Registro?', 'Informa??o', Mb_yesno or mb_iconinformation);
  If mensagem = IDYes then
  begin
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
    try
      DeletePessoa(dbPessoa.Columns.Items[0].Field.AsString);
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

procedure TfrmPessoa.btnFecharClick(Sender: TObject);
begin
  if tbPessoa.State in [dsInsert,dsEdit] then
  begin
    Application.MessageBox('Atualiza??o/Inser??o deve ser conclu?da, antes de Fechar!', 'Alerta - Aviso do Sistema', mb_iconwarning+mb_ok);
    abort;
  end
  else
    Close;
end;

procedure TfrmPessoa.btnSalvarClick(Sender: TObject);
begin
  tbPessoa.FieldByName('IDDONO').AsInteger := Sequencial;
  tbPessoa.Post;
  tbPessoa.ApplyUpdates(0);
  tbPessoa.Close;
  tbPessoa.Open;
  tbPessoa.Refresh;
  pgPessoa.ActivePage := tbConsulta;
  tbCadastro.TabVisible := True;
end;

procedure TfrmPessoa.edtProcurarChange(Sender: TObject);
var
  sTexto : String;
begin
  tbPessoa.Close;
  tbPessoa.SQL.Clear;
  sTexto := '%' + edtProcurar.Text + '%';
  tbPessoa.Open(Format(SQL_PROCURA_PESSOA,[QuotedStr(sTexto)]));
end;

procedure TfrmPessoa.FormShow(Sender: TObject);
begin
  dmPrincipal.Connection.Connected := True;
  tbCadastro.TabVisible := False;
  pgPessoa.ActivePage := tbConsulta;
  tbPessoa.Active := True;
  edtProcurar.SetFocus;
end;

function TfrmPessoa.Sequencial: Integer;
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

procedure TfrmPessoa.DeletePessoa(CodPessoa: string);
var
  QryCaoPessoa: TFDQuery;
  QryPessoa : TFDQuery;
  QryCao : TFDQuery;
  QryEncontraCao : TFDQuery;
  iIdCao : Integer;
begin
  QryCaoPessoa := TFDQuery.Create(nil);
  QryPessoa := TFDQuery.Create(nil);
  QryCao := TFDQuery.Create(nil);
  QryEncontraCao := TFDQuery.Create(nil);
  try
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
    try
      QryEncontraCao.Connection := dmPrincipal.Connection;
      QryEncontraCao.SQL.Add(Format(SQL_RETORNA_CAO, [CodPessoa]));
      QryEncontraCao.Open();
      iIdCao := QryEncontraCao.FieldByName('idCao').AsInteger;

      QryCaoPessoa.Connection := dmPrincipal.Connection;
      QryCaoPessoa.ExecSQL(Format(SQL_DELETE_CAO_PESSOA, [CodPessoa, IntToStr(iIdCao)]));

      QryCao.Connection := dmPrincipal.Connection;
      QryCao.ExecSQL(Format(SQL_DELETE_CAO, [IntToStr(iIdCao)]));

      QryCao.Connection := dmPrincipal.Connection;
      QryCao.ExecSQL(Format(SQL_DELETE_PESSOA, [CodPessoa]));
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
    FreeAndNil(QryCaoPessoa);
    FreeAndNil(QryPessoa);
    FreeAndNil(QryCao);
    FreeAndNil(QryEncontraCao);
    tbPessoa.ApplyUpdates(0);
    tbPessoa.Close;
    tbPessoa.Open;
    tbPessoa.Refresh;
  end;
end;

end.
