program project;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unConsulta in 'padroes\unConsulta.pas' {frmConsulta},
  unFuncoes in 'unFuncoes.pas',
  unMetodos in 'unMetodos.pas',
  unDM in 'unDM.pas' {DM: TDataModule},
  unConPessoas in 'cadastros\unConPessoas.pas' {frmConPessoas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
