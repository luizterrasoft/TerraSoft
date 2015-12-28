program Clientes;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unManutencaoCliente in 'unManutencaoCliente.pas' {frmManutencaoCliente},
  unRelFichaCliente in 'unRelFichaCliente.pas' {frmRelFichaCliente},
  unRelClientes in 'unRelClientes.pas' {frmRelClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
