inherited frmBotoes: TfrmBotoes
  Caption = 'BOT'#213'ES/FUN'#199#213'ES DO SISTEMA'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Left = 113
      Top = 8
      Width = 353
      Caption = 'CONSULTA DE BOT'#213'ES/FUN'#199#213'ES'
    end
  end
  inherited PnConsulta: TPanel
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
    object RdBtnTela: TRadioButton
      Left = 104
      Top = 24
      Width = 57
      Height = 17
      Caption = 'Tela'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object RdBtnCaption: TRadioButton
      Left = 104
      Top = 40
      Width = 57
      Height = 17
      Caption = 'Caption'
      TabOrder = 4
    end
  end
  inherited PnDados: TPanel
    object GrdBotoes: TDBGrid
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
      OnDrawColumnCell = GrdBotoesDrawColumnCell
      OnDblClick = GrdBotoesDblClick
      OnKeyPress = GrdBotoesKeyPress
      OnTitleClick = GrdBotoesTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELA'
          Title.Alignment = taCenter
          Title.Caption = 'Tela'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Caption'
          Width = 153
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
    Left = 416
    Top = 41
  end
  inherited dsDados: TDataSource
    Left = 448
    Top = 41
  end
  inherited cdsDados: TClientDataSet
    Left = 480
    Top = 41
  end
  inherited dspDados: TDataSetProvider
    Left = 512
    Top = 41
  end
end
