inherited frmEquipamentos: TfrmEquipamentos
  Left = 263
  Top = 144
  Caption = 'EQUIPAMENTOS'
  ClientHeight = 462
  ClientWidth = 790
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 790
    inherited lblTitulo: TLabel
      Width = 325
      Caption = 'CONSULTA DE EQUIPAMENTOS'
    end
  end
  inherited PnConsulta: TPanel
    Width = 790
    inherited Label2: TLabel
      Top = 31
    end
    object Bevel1: TBevel [2]
      Left = 166
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Top = 29
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 81
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnDescricao: TRadioButton
      Left = 16
      Top = 40
      Width = 81
      Height = 17
      Caption = 'Descri'#231#227'o'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    Width = 790
    Height = 319
    object GrdEquipamentos: TDBGrid
      Left = 1
      Top = 1
      Width = 788
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
      OnDrawColumnCell = GrdEquipamentosDrawColumnCell
      OnDblClick = GrdEquipamentosDblClick
      OnKeyPress = GrdEquipamentosKeyPress
      OnTitleClick = GrdEquipamentosTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCA'
          Title.Alignment = taCenter
          Title.Caption = 'Marca'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MODELO'
          Title.Alignment = taCenter
          Title.Caption = 'Modelo'
          Width = 157
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDHORAS'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Horas'
          Width = 74
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PLACA'
          Title.Alignment = taCenter
          Title.Caption = 'Placa'
          Width = 75
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    Top = 425
    Width = 790
    inherited BtnRelatorios: TBitBtn
      TabOrder = 5
    end
    object BtnLancarManutencao: TBitBtn
      Left = 360
      Top = 8
      Width = 105
      Height = 24
      Caption = 'LAN'#199'AR MAN.'
      TabOrder = 4
      OnClick = BtnLancarManutencaoClick
    end
  end
  inherited qryDados: TSQLQuery
    Left = 440
    Top = 25
  end
  inherited dsDados: TDataSource
    Left = 472
    Top = 25
  end
  inherited cdsDados: TClientDataSet
    Left = 504
    Top = 25
  end
  inherited dspDados: TDataSetProvider
    Left = 536
    Top = 25
  end
end
