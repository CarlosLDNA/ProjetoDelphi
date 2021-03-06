unit uRelCaoDono;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, udmPrincipal;

type
  TfrmRelCaodono = class(TForm)
    relCaoDono: TfrxReport;
    rel_CaoDono: TfrxDBDataset;
    tbCaoDono: TFDQuery;
    procedure relCaoDonoAfterPrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
    sFiltro: String;
  end;

var
  frmRelCaodono: TfrmRelCaodono;

const

  SQL_FILTRO_RACA = 'SELECT P.NOME, C.NOME, C.RACA  ' + #13 +
                    '  FROM PESSOA P,               ' + #13 +
                    '       CAO C,                  ' + #13 +
                    '       CAO_PESSOA CP           ' + #13 +
                    ' WHERE CP.IDDONO = P.IDDONO    ' + #13 +
                    '   AND CP.IDCAO = C.IDCAO      ' + #13 +
                    '   AND C.RACA = %S             ';
implementation

{$R *.dfm}

procedure TfrmRelCaodono.relCaoDonoAfterPrint(Sender: TfrxReportComponent);
begin
  tbCaoDono.Connection := dmPrincipal.Connection;
  tbCaoDono.SQL.Clear;
  tbCaoDono.SQL.Add(Format(SQL_FILTRO_RACA, [QuotedStr(sFiltro)]));
  tbCaoDono.Open();
end;

end.
