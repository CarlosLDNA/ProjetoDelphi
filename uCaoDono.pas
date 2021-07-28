unit uCaoDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmPrincipal, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCaoDono = class(TForm)
    tbPessoa: TFDQuery;
    tbCao: TFDQuery;
    tbCaoDono: TFDQuery;
    dsPessoa: TDataSource;
    dsCao: TDataSource;
    dsCaoDono: TDataSource;
    dbgPessoa: TDBGrid;
    dbgCao: TDBGrid;
    Panel1: TPanel;
    dbgCaoDono: TDBGrid;
    btnIncluir: TButton;
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    function Encontrou: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaoDono: TfrmCaoDono;

const

  SQL_INSERE_CAO_DONO = 'INSERT INTO CAO_PESSOA (IDDONO, IDCAO) VALUES (%S, %S)';

  SQL_EXISTE_CADASTRO ='SELECT IDCAO FROM CAO_PESSOA WHERE IDDONO = %S AND IDCAO = %S';

implementation

{$R *.dfm}

procedure TfrmCaoDono.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCaoDono.btnIncluirClick(Sender: TObject);
var
  QryCaoDono: TFDQuery;
begin
  QryCaoDono := TFDQuery.Create(nil);
  try
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
      if not Encontrou then
      begin
        try
          QryCaoDono.Connection := dmPrincipal.Connection;
          QryCaoDono.ExecSQL(Format(SQL_INSERE_CAO_DONO, [dbgPessoa.Columns.Items[0].Field.AsString, dbgCao.Columns.Items[0].Field.AsString]));
          dmPrincipal.Connection.Commit;
        except
          on E:Exception do
          begin
            Showmessage('Ocorreu um erro de banco de dados! '+'Erro ao inserir registro '+#13+
            'Detalhe: '+E.Message);
            dmPrincipal.Connection.Rollback;
            Exit;
          end;
        end;
      end
      else
      showmessage('Cão e dono já cadastrados!');
  finally
    FreeAndNil(QryCaoDono);
    tbCaoDono.Close;
    tbCaoDono.Open;
    tbCaoDono.Refresh;
  end;
end;

function TfrmCaoDono.Encontrou: boolean;
var
  QryCaoDono: TFDQuery;
  bResult : boolean;
begin
  QryCaoDono := TFDQuery.Create(nil);
  try
    if not(dmPrincipal.Connection.InTransaction) then
      dmPrincipal.Connection.StartTransaction;
    try
      QryCaoDono.Connection := dmPrincipal.Connection;
      QryCaoDono.SQL.Clear;
      QryCaoDono.SQL.Add(Format(SQL_EXISTE_CADASTRO, [dbgPessoa.Columns.Items[0].Field.AsString, dbgCao.Columns.Items[0].Field.AsString]));
      QryCaoDono.Open();
      bResult := QryCaoDono.FieldByName('IDCAO').AsInteger > 0;
      dmPrincipal.Connection.Commit;
    except
      on E:Exception do
      begin
        Showmessage('Ocorreu um erro de banco de dados! '+'Erro ao consultar registro '+#13+
        'Detalhe: '+E.Message);
        dmPrincipal.Connection.Rollback;
        Exit;
      end;
    end;
  finally
    result := bResult;
  end;

end;


end.



