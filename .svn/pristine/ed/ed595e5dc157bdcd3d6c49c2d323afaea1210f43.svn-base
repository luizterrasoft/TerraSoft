inherited frmFormasPgto: TfrmFormasPgto
  Caption = 'FORMAS DE PAGAMENTO'
  ClientWidth = 506
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 506
    inherited lblTitulo: TLabel
      Left = 87
      Top = 8
      Width = 355
      Caption = 'CONSULTA DE FORMAS DE PGTO.'
    end
  end
  inherited PnConsulta: TPanel
    Width = 506
    inherited Label2: TLabel
      Left = 395
      Top = 31
    end
    object Bevel1: TBevel [2]
      Left = 126
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 135
      Top = 29
      Width = 242
      Height = 22
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 15
      Top = 24
      Width = 65
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 15
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
    Width = 506
    object GrdFormasPgto: TDBGrid
      Left = 1
      Top = 1
      Width = 504
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
      OnDrawColumnCell = GrdFormasPgtoDrawColumnCell
      OnDblClick = GrdFormasPgtoDblClick
      OnKeyPress = GrdFormasPgtoKeyPress
      OnTitleClick = GrdFormasPgtoTitleClick
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
          Width = 386
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    Width = 506
    inherited BtnIncluir: TBitBtn
      Left = 40
    end
    inherited BtnAlterar: TBitBtn
      Left = 136
    end
    inherited BtnExcluir: TBitBtn
      Left = 231
    end
    inherited BtnSair: TBitBtn
      Left = 376
    end
  end
  inherited qryDados: TSQLQuery
    Left = 16
    Top = 9
  end
  inherited dsDados: TDataSource
    Left = 48
    Top = 9
  end
  inherited cdsDados: TClientDataSet
    Left = 80
    Top = 9
  end
  inherited dspDados: TDataSetProvider
    Left = 112
    Top = 9
  end
end
