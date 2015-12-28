inherited frmIncluirProduto: TfrmIncluirProduto
  Left = 400
  Top = 202
  Caption = 'MANUTEN'#199#195'O DE PRODUTOS'
  ClientHeight = 185
  ClientWidth = 490
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 490
  end
  inherited PnDados: TPanel
    Width = 490
    Height = 89
    object Label1: TLabel
      Left = 7
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 59
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 345
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object Label4: TLabel
      Left = 403
      Top = 13
      Width = 68
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Label5: TLabel
      Left = 98
      Top = 46
      Width = 58
      Height = 13
      Caption = 'Pre'#231'o Custo'
    end
    object Label6: TLabel
      Left = 254
      Top = 46
      Width = 39
      Height = 13
      Caption = 'Estoque'
    end
    object Label7: TLabel
      Left = 169
      Top = 46
      Width = 69
      Height = 13
      Caption = 'Estoque Inicial'
    end
    object Label8: TLabel
      Left = 7
      Top = 46
      Width = 20
      Height = 13
      Caption = 'Ref.'
    end
    object Label9: TLabel
      Left = 345
      Top = 46
      Width = 68
      Height = 13
      Caption = #218'ltima Compra'
    end
    object edtCodigo: TEdit
      Left = 7
      Top = 27
      Width = 46
      Height = 19
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'EDTCODIGO'
    end
    object edtDescricao: TEdit
      Left = 59
      Top = 26
      Width = 273
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'EDTDESCRICAO'
    end
    object edtUnidade: TEdit
      Left = 345
      Top = 26
      Width = 52
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'EDTUNIDADE'
    end
    object edtEstoque: TEdit
      Left = 254
      Top = 59
      Width = 78
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
      Text = 'EDTESTOQUE'
    end
    object edtEstoqueInicial: TEdit
      Left = 169
      Top = 59
      Width = 79
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Text = 'EDTESTOQUEINICIAL'
      OnExit = edtEstoqueInicialExit
    end
    object edtPrecoCusto: TEdit
      Left = 98
      Top = 59
      Width = 65
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = 'EDTPRECOCUSTO'
      OnExit = edtPrecoCustoExit
    end
    object edtReferencia: TEdit
      Left = 7
      Top = 59
      Width = 85
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = 'EDTREFERENCIA'
    end
    object mskDataCadastro: TMaskEdit
      Left = 403
      Top = 26
      Width = 71
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 3
      Text = '  /  /    '
    end
    object mskUltimaCompra: TMaskEdit
      Left = 345
      Top = 59
      Width = 70
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      Enabled = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 8
      Text = '  /  /    '
    end
  end
  inherited PnAcoes: TPanel
    Top = 136
    Width = 490
    Align = alBottom
    inherited BtnGravar: TBitBtn
      Left = 143
      Top = 8
    end
    inherited BtnCancelar: TBitBtn
      Left = 247
      Top = 8
    end
  end
  inherited cdsAux: TClientDataSet
    ProviderName = 'dspAux'
    Left = 248
    Top = 49
  end
  inherited cdsPadrao: TClientDataSet
    Left = 248
    Top = 81
  end
  inherited dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 280
    Top = 49
  end
  inherited dspPadrao: TDataSetProvider
    Left = 280
    Top = 81
  end
  inherited dsAux: TDataSource
    DataSet = cdsPadrao
    Left = 312
    Top = 49
  end
  inherited dsPadrao: TDataSource
    Left = 312
    Top = 81
  end
  inherited qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    SQLConnection = DM.Con
    Left = 216
    Top = 49
  end
  inherited qryPadrao: TSQLQuery
    Left = 216
    Top = 81
  end
end
