inherited frmContas: TfrmContas
  Left = 353
  Top = 253
  Caption = 'CONTAS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 244
      Caption = 'CONSULTA DE CONTAS'
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 515
    end
    object Bevel1: TBevel [2]
      Left = 142
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 151
      Height = 22
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdContas: TDBGrid
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
      OnDblClick = GrdContasDblClick
      OnKeyPress = GrdContasKeyPress
      OnTitleClick = GrdContasTitleClick
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
          Width = 463
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Top = 153
  end
  inherited dsDados: TDataSource
    Top = 153
  end
  inherited cdsDados: TClientDataSet
    Top = 153
  end
  inherited dspDados: TDataSetProvider
    Top = 153
  end
end
