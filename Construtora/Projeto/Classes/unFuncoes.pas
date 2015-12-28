unit unFuncoes;

interface

uses
  unVariaveis, unConstantes, Forms;

type
  TFuncoes = class

    private

    public
      { ALIMENTA TODAS AS VARIAVEIS DE CONFIGURACAO DO SISTEMA }
      function AlimentaVariaveisConfig: Boolean;

  end;

implementation

uses SysUtils;

{ TFuncoes }

function TFuncoes.AlimentaVariaveisConfig: Boolean;
begin
  { PEGA CAMINHO EXECUTAVEL }
  sCaminhoExe := ExtractFilePath(Application.ExeName);

end;

end.
