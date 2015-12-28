inherited frmUsuarios: TfrmUsuarios
  Left = 365
  Top = 317
  Caption = 'USU'#193'RIOS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 269
      Caption = 'CONSULTA DE USU'#193'RIOS'
    end
  end
  inherited PnConsulta: TPanel
    object Bevel1: TBevel [2]
      Left = 168
      Top = 7
      Width = 2
      Height = 50
    end
    inherited edtConsulta: TEdit
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnCodigo: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 1
    end
    object RdBtnNome: TRadioButton
      Left = 16
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Nome'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RdBtnUsuario: TRadioButton
      Left = 96
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Usu'#225'rio'
      TabOrder = 3
    end
  end
  inherited PnDados: TPanel
    object GrdUsuarios: TDBGrid
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
      OnDrawColumnCell = GrdUsuariosDrawColumnCell
      OnDblClick = GrdUsuariosDblClick
      OnKeyPress = GrdUsuariosKeyPress
      OnTitleClick = GrdUsuariosTitleClick
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
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 215
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'USUARIO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Width = 191
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    inherited BtnIncluir: TBitBtn
      Left = 16
    end
    inherited BtnAlterar: TBitBtn
      Left = 112
    end
    inherited BtnExcluir: TBitBtn
      Left = 207
    end
    inherited BtnRelatorios: TBitBtn
      Left = 400
    end
    object BtnPermissoes: TBitBtn
      Left = 312
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Permiss'#245'es'
      TabOrder = 5
      OnClick = BtnPermissoesClick
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
