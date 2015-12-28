object frmHistoricoContaReceber: TfrmHistoricoContaReceber
  Left = 411
  Top = 284
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'HIST'#211'RICO DA CONTA A RECEBER'
  ClientHeight = 259
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnConta: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 59
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lblCliente: TLabel
      Left = 67
      Top = 13
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOS: TLabel
      Left = 67
      Top = 34
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 345
      Top = 34
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCli: TLabel
      Left = 7
      Top = 13
      Width = 62
      Height = 20
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTitOS: TLabel
      Left = 7
      Top = 34
      Width = 41
      Height = 20
      Caption = 'O.S.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVlrTotal: TLabel
      Left = 241
      Top = 34
      Width = 93
      Height = 20
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 176
    Width = 453
    Height = 83
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object lblOBS: TLabel
      Left = 7
      Top = 7
      Width = 34
      Height = 13
      Caption = 'OBS.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnEstornar: TBitBtn
      Left = 14
      Top = 46
      Width = 74
      Height = 20
      Caption = 'Estorno Baixa'
      TabOrder = 0
      OnClick = BtnEstornarClick
    end
    object BtnSair: TBitBtn
      Left = 371
      Top = 46
      Width = 60
      Height = 20
      Caption = 'Sair - ESC'
      TabOrder = 1
      OnClick = BtnSairClick
    end
    object RchEdtObs: TRichEdit
      Left = 41
      Top = 7
      Width = 404
      Height = 33
      BorderStyle = bsNone
      Color = 13565951
      TabOrder = 2
    end
  end
  object PnHistorico: TPanel
    Left = 0
    Top = 59
    Width = 453
    Height = 117
    Align = alClient
    TabOrder = 2
    object GrdHistorico: TDBGrid
      Left = 1
      Top = 1
      Width = 451
      Height = 115
      Align = alClient
      Color = 13565951
      DataSource = dsHistorico
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GrdHistoricoCellClick
      OnKeyDown = GrdHistoricoKeyDown
      OnKeyPress = GrdHistoricoKeyPress
      OnKeyUp = GrdHistoricoKeyUp
      OnTitleClick = GrdHistoricoTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATARECBTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Recbto.'
          Width = 78
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Recebido'
          Width = 88
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALORATUAL'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Atual'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Title.Alignment = taCenter
          Title.Caption = 'Conta'
          Width = 178
          Visible = True
        end>
    end
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 400
    Top = 136
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistorico'
    Left = 432
    Top = 136
  end
  object dspHistorico: TDataSetProvider
    DataSet = qryHistorico
    Left = 464
    Top = 136
  end
  object qryHistorico: TSQLQuery
    DataSource = dsHistorico
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 496
    Top = 136
  end
end
