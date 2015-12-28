inherited frmTelas: TfrmTelas
  Left = 296
  Top = 189
  Caption = 'TELAS DO SISTEMA'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 208
      Caption = 'TELAS DO SISTEMA'
    end
  end
  inherited PnConsulta: TPanel
    object Bevel1: TBevel [2]
      Left = 160
      Top = 8
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 57
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 16
      Top = 40
      Width = 73
      Height = 17
      Caption = 'Descri'#231#227'o'
      TabOrder = 2
    end
    object RdBtnCaption: TRadioButton
      Left = 88
      Top = 24
      Width = 57
      Height = 17
      Caption = 'Caption'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdTelas: TDBGrid
      Left = 1
      Top = 1
      Width = 577
      Height = 226
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdTelasDrawColumnCell
      OnDblClick = GrdTelasDblClick
      OnKeyPress = GrdTelasKeyPress
      OnTitleClick = GrdTelasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Caption'
          Width = 247
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    inherited BtnIncluir: TBitBtn
      Visible = False
    end
    inherited BtnAlterar: TBitBtn
      Visible = False
    end
    inherited BtnExcluir: TBitBtn
      Visible = False
    end
  end
  inherited qryDados: TSQLQuery
    Left = 16
    Top = 193
  end
  inherited dsDados: TDataSource
    Left = 48
    Top = 193
  end
  inherited cdsDados: TClientDataSet
    Left = 80
    Top = 193
  end
  inherited dspDados: TDataSetProvider
    Left = 112
    Top = 193
  end
end
