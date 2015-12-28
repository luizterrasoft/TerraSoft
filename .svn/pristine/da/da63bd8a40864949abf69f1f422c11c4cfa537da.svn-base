inherited frmServicos: TfrmServicos
  Top = 250
  Caption = 'SERVI'#199'OS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 266
      Caption = 'CONSULTA DE SERVI'#199'OS'
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 534
      Top = 34
    end
    object Bevel1: TBevel [2]
      Left = 162
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 170
      Top = 33
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 20
      Top = 26
      Width = 91
      Height = 14
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 20
      Top = 39
      Width = 91
      Height = 14
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdServicos: TDBGrid
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
      OnDrawColumnCell = GrdServicosDrawColumnCell
      OnDblClick = GrdServicosDblClick
      OnKeyPress = GrdServicosKeyPress
      OnTitleClick = GrdServicosTitleClick
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
          Width = 342
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unidade'
          Width = 53
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 75
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Left = 544
    Top = 9
  end
  inherited dsDados: TDataSource
    Left = 576
    Top = 9
  end
  inherited cdsDados: TClientDataSet
    Left = 608
    Top = 9
  end
  inherited dspDados: TDataSetProvider
    Left = 640
    Top = 9
  end
end
