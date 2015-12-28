unit uspComponentesRegistro;

interface

procedure Register;

implementation

uses
  Classes, uspQuery;

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.
