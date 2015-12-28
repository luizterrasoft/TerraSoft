inherited frmProdutos: TfrmProdutos
  Left = 351
  Top = 183
  Caption = 'PRODUTOS'
  ClientHeight = 460
  ClientWidth = 705
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 705
    inherited lblTitulo: TLabel
      Width = 274
      Caption = 'CONSULTA DE PRODUTOS'
    end
  end
  inherited PnConsulta: TPanel
    Width = 705
    inherited Label2: TLabel
      Left = 564
      Top = 28
    end
    object Bevel1: TBevel [2]
      Left = 186
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 200
      Top = 26
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 13
      Top = 26
      Width = 59
      Height = 14
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 13
      Top = 40
      Width = 92
      Height = 14
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RdBtnReferencia: TRadioButton
      Left = 85
      Top = 26
      Width = 84
      Height = 14
      Caption = 'Refer'#234'ncia'
      TabOrder = 3
    end
  end
  inherited PnDados: TPanel
    Width = 705
    Height = 319
    object GrdProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 703
      Height = 317
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
      OnDrawColumnCell = GrdProdutosDrawColumnCell
      OnDblClick = GrdProdutosDblClick
      OnKeyPress = GrdProdutosKeyPress
      OnTitleClick = GrdProdutosTitleClick
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 295
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unidade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRECOCUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Custo'
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Alignment = taCenter
          Title.Caption = 'Estoque'
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    Top = 425
    Width = 705
  end
  inherited qryDados: TSQLQuery
    Top = 9
  end
  inherited dsDados: TDataSource
    Top = 9
  end
  inherited cdsDados: TClientDataSet
    Top = 9
  end
  inherited dspDados: TDataSetProvider
    Top = 9
  end
end
