inherited frmTiposCombustiveis: TfrmTiposCombustiveis
  Top = 191
  Caption = 'TIPOS DE COMBUST'#205'VEIS'
  ClientHeight = 372
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Left = 100
      Width = 429
      Caption = 'CONSULTA DE TIPOS DE COMBUST'#205'VEIS'
      ExplicitLeft = 100
      ExplicitWidth = 429
    end
  end
  inherited PnConsulta: TPanel
    object Bevel1: TBevel [2]
      Left = 152
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
      Width = 65
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
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdTiposCombustiveis: TDBGrid
      Left = 1
      Top = 1
      Width = 577
      Height = 226
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdTiposCombustiveisDrawColumnCell
      OnDblClick = GrdTiposCombustiveisDblClick
      OnKeyPress = GrdTiposCombustiveisKeyPress
      OnTitleClick = GrdTiposCombustiveisTitleClick
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
          Width = 436
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Top = 161
  end
  inherited dsDados: TDataSource
    Top = 161
  end
  inherited cdsDados: TClientDataSet
    Top = 161
  end
  inherited dspDados: TDataSetProvider
    Top = 161
  end
end
