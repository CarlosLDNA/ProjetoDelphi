unit uFiltroRaca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, udmPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TfrmFiltroRaca = class(TForm)
    btnImprimir: TButton;
    tbFiltro: TFDQuery;
    dsFiltro: TDataSource;
    dbcFiltro: TDBComboBox;
    lbRaca: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltroRaca: TfrmFiltroRaca;

implementation

{$R *.dfm}

uses
  uRelCaoDono;

procedure TfrmFiltroRaca.btnImprimirClick(Sender: TObject);
begin
  frmRelCaodono.sFiltro := dbcFiltro.Text;
  frmRelCaodono.relCaoDono.ShowReport();
end;

procedure TfrmFiltroRaca.FormShow(Sender: TObject);
begin
 tbFiltro.Active := True;
 while tbFiltro.Eof = False do
  begin
    dbcFiltro.Items.Add(tbFiltro.FieldByName('raca').AsString);
    tbFiltro.Next;
  end;

  dbcFiltro.itemindex:=0;
end;

end.
