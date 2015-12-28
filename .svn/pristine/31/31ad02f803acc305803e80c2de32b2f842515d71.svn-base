inherited frmSubPlanosdeContas: TfrmSubPlanosdeContas
  Left = 525
  Top = 219
  Caption = 'SUB-PLANOS DE CONTAS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Left = 77
      Top = 8
      Width = 425
      Caption = 'CONSULTA DE SUB-PLANOS DE CONTAS'
      ExplicitLeft = 77
      ExplicitTop = 8
      ExplicitWidth = 425
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 523
      Top = 31
      ExplicitLeft = 523
      ExplicitTop = 31
    end
    object Bevel1: TBevel [2]
      Left = 150
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 159
      Top = 29
      OnKeyPress = edtConsultaKeyPress
      ExplicitLeft = 159
      ExplicitTop = 29
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 16
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
    object GrdSubPlanos: TDBGrid
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
      OnDrawColumnCell = GrdSubPlanosDrawColumnCell
      OnDblClick = GrdSubPlanosDblClick
      OnKeyPress = GrdSubPlanosKeyPress
      OnTitleClick = GrdSubPlanosTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODPLANOCONTA'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Plano'
          Width = 58
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SEQUENCIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Sequencial'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLANOCONTAS'
          Title.Alignment = taCenter
          Title.Caption = 'Plano de Contas'
          Width = 211
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Left = 16
    Top = 201
  end
  inherited dsDados: TDataSource
    Left = 48
    Top = 201
  end
  inherited cdsDados: TClientDataSet
    Left = 80
    Top = 201
  end
  inherited dspDados: TDataSetProvider
    Left = 112
    Top = 201
  end
end
