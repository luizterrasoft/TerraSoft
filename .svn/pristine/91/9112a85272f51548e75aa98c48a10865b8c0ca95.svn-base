inherited frmEmpresa: TfrmEmpresa
  Caption = 'EMPRESAS'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    inherited lblTitulo: TLabel
      Width = 111
      Caption = 'EMPRESAS'
    end
  end
  inherited PnConsulta: TPanel
    inherited edtConsulta: TEdit
      OnKeyPress = edtConsultaKeyPress
    end
    object RdBtnRazao: TRadioButton
      Left = 24
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Raz'#227'o'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RdBtnFantasia: TRadioButton
      Left = 24
      Top = 40
      Width = 73
      Height = 17
      Caption = 'Fantasia'
      TabOrder = 2
    end
  end
  inherited PnDados: TPanel
    object GrdEmpresas: TDBGrid
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
      OnDrawColumnCell = GrdEmpresasDrawColumnCell
      OnTitleClick = GrdEmpresasTitleClick
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
          FieldName = 'RAZAOSOCIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Raz'#227'o Social'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Title.Alignment = taCenter
          Title.Caption = 'Fantasia'
          Width = 267
          Visible = True
        end>
    end
  end
  inherited PnAcoes: TPanel
    inherited BtnRelatorios: TBitBtn
      Left = 352
      Width = 121
      Caption = 'DADOS DA EMPRESA'
    end
  end
end
