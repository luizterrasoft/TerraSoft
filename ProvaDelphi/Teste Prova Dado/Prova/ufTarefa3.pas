unit ufTarefa3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, uspQuery, StdCtrls;

type
  TfrmTarefa3 = class(TForm)
    mmColunas: TMemo;
    mmTabela: TMemo;
    mmCondicao: TMemo;
    mmSqlGerado: TMemo;
    btnGerarSql: TButton;
    btnLimpar: TButton;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSQLGerado: TLabel;
    spQuery: TspQuery;
    procedure btnGerarSqlClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Limpar;
  public
    { Public declarations }
  end;

var
  frmTarefa3: TfrmTarefa3;

implementation

{$R *.dfm}

procedure TfrmTarefa3.btnGerarSqlClick(Sender: TObject);
begin
  spQuery.spColunas.Text := mmColunas.Text;
  spQuery.spTabelas.Text := mmTabela.Text;
  spQuery.spCondicoes.Text := mmCondicao.Text;
  spQuery.GeraSQL;
  mmSqlGerado.Lines.Text := spQuery.SQL.Text;
end;

procedure TfrmTarefa3.btnLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TfrmTarefa3.Limpar;
begin
  mmColunas.Clear;
  mmTabela.Clear;
  mmCondicao.Clear;
  mmSqlGerado.Clear;
end;

procedure TfrmTarefa3.FormCreate(Sender: TObject);
begin
  Limpar;
end;

end.
