program DogPeoples;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uPessoa in 'uPessoa.pas' {frmPessoa},
  uCao in 'uCao.pas' {frmCao},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uCaoDono in 'uCaoDono.pas' {frmCaoDono};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPessoa, frmPessoa);
  Application.CreateForm(TfrmCao, frmCao);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmCaoDono, frmCaoDono);
  Application.Run;
end.
