inherited frmMunicipios: TfrmMunicipios
  Left = 652
  Top = 259
  Caption = 'MUNIC'#205'PIOS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 288
      Caption = 'CONSULTA DE MUNIC'#205'PIOS'
    end
  end
  inherited PnConsulta: TPanel
    inherited Label2: TLabel
      Left = 514
      Top = 34
    end
    object Bevel1: TBevel [2]
      Left = 136
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      Left = 150
      Top = 33
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 20
      Top = 26
      Width = 59
      Height = 14
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnNome: TRadioButton
      Left = 78
      Top = 26
      Width = 53
      Height = 14
      Caption = 'Nome'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RdBtnCEP: TRadioButton
      Left = 20
      Top = 42
      Width = 91
      Height = 14
      Caption = 'CEP'
      TabOrder = 3
    end
  end
  inherited PnDados: TPanel
    object GrdMunicipios: TDBGrid
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
      OnDrawColumnCell = GrdMunicipiosDrawColumnCell
      OnDblClick = GrdMunicipiosDblClick
      OnKeyPress = GrdMunicipiosKeyPress
      OnTitleClick = GrdMunicipiosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Title.Alignment = taCenter
          Width = 104
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    Left = 96
    Top = 169
  end
  inherited dsDados: TDataSource
    Left = 128
    Top = 169
  end
  inherited cdsDados: TClientDataSet
    Left = 160
    Top = 169
  end
  inherited dspDados: TDataSetProvider
    Left = 192
    Top = 169
  end
end
