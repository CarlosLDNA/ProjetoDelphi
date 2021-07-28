program DogPeoples;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uPessoa in 'uPessoa.pas' {frmPessoa},
  uCao in 'uCao.pas' {frmCao},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uCaoDono in 'uCaoDono.pas' {frmCaoDono},
  uRelCaoDono in 'uRelCaoDono.pas' {frmRelCaodono},
  uFiltroRaca in 'uFiltroRaca.pas' {frmFiltroRaca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPessoa, frmPessoa);
  Application.CreateForm(TfrmCao, frmCao);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmCaoDono, frmCaoDono);
  Application.CreateForm(TfrmRelCaodono, frmRelCaodono);
  Application.CreateForm(TfrmFiltroRaca, frmFiltroRaca);
  Application.Run;
end.
