unit RestaurarBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBServices, StdCtrls;

type
  TFRestaurarBackup = class(TForm)
    BTRestaurarBackup: TButton;
    Button2: TButton;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    CBDesativarIndices: TCheckBox;
    CBSemValidar: TCheckBox;
    CBSemShadow: TCheckBox;
    IBConfigService1: TIBConfigService;
    IBRestoreService1: TIBRestoreService;
    CBDetalhes: TCheckBox;
    OpenDialog1: TOpenDialog;
    CBUmaTabela: TCheckBox;
    CBSubstituir: TCheckBox;
    procedure BTRestaurarBackupClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRestaurarBackup: TFRestaurarBackup;

implementation

uses Principal, unDM;

{$R *.dfm}

procedure TFRestaurarBackup.BTRestaurarBackupClick(Sender: TObject);
begin
  try	
    if not OpenDialog1.Execute then//se n�o selecionar o arquivo de backup
      Exit;                        //cancela o procedimento
    Memo1.Clear;
    BTRestaurarBackup.Enabled:=False;
    Memo1.Lines.Add('Preparando para restaurar o backup...');
    Memo1.Lines.Add('');

    with IBRestoreService1 do
    begin
      DM.Con.Connected:=False;//desconecta da base
      DatabaseName.Clear;
      DatabaseName.Add(frmBackup.EBase.Text);//caminho da base
      ServerName:=frmBackup.EServ.Text;//nome do servidor
      BackupFile.Clear;
      BackupFile.Add(OpenDialog1.FileName);//caminho do arquivo de backup
      Protocol:=TCP;//protocolo de conex�o
      Params.Clear;
      Params.Add('user_name=SYSDBA');//nome de usu�rio
      Params.Add('password=masterkey');//senha do usu�rio

      Options:=[];
      Options:=[CreateNewDB];
      {o bloco de if abaixo esta adicionando as op��es de restaura��o de acordo com o que o usu�rio escolheu.
      Ap�s esta listagem voc� encontra um link para um outro artigo onde voc� encontra mais informa��es
      sobre essas e outras op��es de restaura��o}
      if CBDesativarIndices.Checked then
        Options:=Options+[DeactivateIndexes];
      if CBSemShadow.Checked then
        Options:=Options+[NoShadow];
      if CBSemValidar.Checked then
        Options:=Options+[NoValidityCheck];
      if CBUmaTabela.Checked then
        Options:=Options+[OneRelationAtATime];
      if CBSubstituir.Checked then
        Options:=Options+[Replace];

      {a propriedade verbose do TIBRestoreService especifica
      se durante o processo de restaura��o ser� retornado para a
      aplica��o o detalhamento da execu��o}
      Verbose:=CBDetalhes.Checked;

      Memo1.Lines.Add('  Desativar indices: '+BoolToStr(CBDesativarIndices.Checked));
      Memo1.Lines.Add('  Restaurar arquivo espelho: '+BoolToStr(not CBSemShadow.Checked));
      Memo1.Lines.Add('  Validar regras de integridade: '+BoolToStr(not CBSemValidar.Checked));
      Memo1.Lines.Add('  Restaurar uma tabela por vez: '+BoolToStr(CBUmaTabela.Checked));
      Memo1.Lines.Add('  Nome do servidor: '+ServerName);
      Memo1.Lines.Add('');
      Active:=True;//ativa o servico de restaura��o, mais ainda nao inicia.
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/***INICIO***\');
      Application.ProcessMessages;
      Memo1.Lines.Add('');
      try
        ServiceStart;//inicia o restore
        while not Eof do
        begin
          {assim como no backup, conforme a restaura��o vai sendo executada
          os detalhes da execu��o podem ser lidos atrav�s da fun��o GetNextLine}
          Memo1.Lines.Add(GetNextLine);
        end;
      finally
      end;
      Active:=False;//desativa o servi�o de restore
      Memo1.Lines.Add('');
      Memo1.Lines.Add('/****FIM****\');
    end;
    Memo1.Lines.Add(''); Memo1.Lines.Add('');
    Memo1.Lines.Add('Backup restaurado com sucesso.');
    DM.Con.Connected:=True;//conecta o sistema na base de dados
    BTRestaurarBackup.Enabled:=True;
  except
    on E: Exception do
    begin
      Memo1.Lines.Add('Ocorreu um erro inesperado. O restore n�o foi conclu�do.');
      Memo1.Lines.Add('Informa��es da exce��o:');
      Memo1.Lines.Add('  '+E.Message);
      DM.Con.Connected :=True;//conecta o sistema na base de dados
      BTRestaurarBackup.Enabled:=True;
    end;
  end;
end;

procedure TFRestaurarBackup.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
