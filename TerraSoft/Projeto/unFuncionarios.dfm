inherited frmFuncionarios: TfrmFuncionarios
  Left = 385
  Top = 202
  Caption = 'FUNCION'#193'RIOS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 321
      Caption = 'CONSULTA DE FUNCION'#193'RIOS'
      ExplicitWidth = 321
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
      Left = 8
      Top = 24
      Width = 57
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnNome: TRadioButton
      Left = 8
      Top = 40
      Width = 57
      Height = 17
      Caption = 'Nome'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  inherited PnDados: TPanel
    object GrdFuncionarios: TDBGrid
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
      OnDrawColumnCell = GrdFuncionariosDrawColumnCell
      OnDblClick = GrdFuncionariosDblClick
      OnKeyPress = GrdFuncionariosKeyPress
      OnTitleClick = GrdFuncionariosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE1'
          Title.Alignment = taCenter
          Title.Caption = 'Fone 1'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Title.Alignment = taCenter
          Title.Caption = 'Celular'
          Width = 90
          Visible = True
        end>
    end
  end
  inherited qryDados: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM funcionarios')
    Left = 448
    Top = 281
  end
  inherited dsDados: TDataSource
    Left = 480
    Top = 281
  end
  inherited cdsDados: TClientDataSet
    Left = 512
    Top = 281
  end
  inherited dspDados: TDataSetProvider
    Left = 544
    Top = 281
  end
end
