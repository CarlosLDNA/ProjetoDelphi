unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    CadastrarPessoa1: TMenuItem;
    Pessoa: TMenuItem;
    Caes: TMenuItem;
    N41: TMenuItem;
    Sair1: TMenuItem;
    CaesDonos: TMenuItem;
    StatusBar1: TStatusBar;
    tStatus: TTimer;
    tStatusDataHora: TTimer;
    Relatrio1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure tStatusTimer(Sender: TObject);
    procedure tStatusDataHoraTimer(Sender: TObject);
    procedure PessoaClick(Sender: TObject);
    procedure CaesClick(Sender: TObject);
    procedure CaesDonosClick(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CheckCapsLock;
    procedure CheckInsert;
    procedure CheckNumLock;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

  const
  ScreenWidth: LongInt = 800;
  ScreenHeight: LongInt = 600;

implementation

{$R *.dfm}

Uses
  uPessoa, uCao, uCaoDono, uFiltroRaca;

procedure TfrmPrincipal.CaesClick(Sender: TObject);
begin
  frmCao.ShowModal;
end;

procedure TfrmPrincipal.CaesDonosClick(Sender: TObject);
begin
  frmCaoDono.ShowModal;
end;

procedure TfrmPrincipal.CheckCapsLock;
begin
If odd (GetKeyState (VK_CAPITAL)) THEN
   StatusBar1.Panels[2].Text := 'Caps'
else
   StatusBar1.Panels[2].Text := ''
end;

procedure TfrmPrincipal.CheckInsert;
begin
If odd (GetKeyState (VK_INSERT)) THEN
   StatusBar1.Panels[3].Text := 'Insert'
else
   StatusBar1.Panels[3].Text := ''
end;

procedure TfrmPrincipal.CheckNumLock;
begin
  If odd (GetKeyState (VK_NUMLOCK)) THEN
     StatusBar1.Panels[4].Text := 'Num Lock'
  else
     StatusBar1.Panels[4].Text := ''
end;

procedure TfrmPrincipal.PessoaClick(Sender: TObject);
begin
  frmPessoa.ShowModal;
end;

procedure TfrmPrincipal.Relatrio1Click(Sender: TObject);
begin
  frmFiltroRaca.ShowModal;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;
procedure TfrmPrincipal.tStatusDataHoraTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].text := 'Data: '+DateToStr(date);
  StatusBar1.Panels[1].text := 'Hora: '+TimeToStr(time);
end;

procedure TfrmPrincipal.tStatusTimer(Sender: TObject);
begin
  CheckCapsLock;
  CheckInsert;
  CheckNumLock;
end;

end.
