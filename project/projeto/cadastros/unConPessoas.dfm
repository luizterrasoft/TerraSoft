inherited frmConPessoas: TfrmConPessoas
  Left = 622
  Top = 335
  Caption = 'CONSULTA DE PESSOAS'
  ClientWidth = 932
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnOpcoes: TPanel
    Left = 795
  end
  inherited StBarConsulta: TStatusBar
    Width = 932
  end
  inherited PnConsulta: TPanel
    Width = 932
  end
  object GrdClientes: TDBGrid
    Left = 0
    Top = 81
    Width = 795
    Height = 429
    Align = alClient
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 53
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APELIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Apelido'
        Width = 188
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONE1'
        Title.Alignment = taCenter
        Title.Caption = 'Fone 1'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONE2'
        Title.Alignment = taCenter
        Title.Caption = 'Fone 2'
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CELULAR'
        Title.Alignment = taCenter
        Title.Caption = 'Celular'
        Width = 87
        Visible = True
      end>
  end
end
