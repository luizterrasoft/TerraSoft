inherited frmRegioes: TfrmRegioes
  Left = 640
  Top = 236
  Caption = 'REGI'#213'ES'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 253
      Caption = 'CONSULTA DE REGI'#213'ES'
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 523
      Top = 31
    end
    object Bevel1: TBevel [2]
      Left = 136
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 159
      Top = 29
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 8
      Top = 27
      Width = 65
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 8
      Top = 43
      Width = 113
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdRegioes: TDBGrid
      Left = 1
      Top = 1
      Width = 577
      Height = 226
      Align = alClient
      Color = 13565951
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdRegioesDrawColumnCell
      OnDblClick = GrdRegioesDblClick
      OnKeyPress = GrdRegioesKeyPress
      OnTitleClick = GrdRegioesTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 459
          Visible = True
        end>
    end
  end
end
