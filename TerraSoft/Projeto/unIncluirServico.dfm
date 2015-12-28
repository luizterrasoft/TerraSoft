inherited frmIncluirServico: TfrmIncluirServico
  Caption = 'MANUTEN'#199#195'O DE SERVI'#199'OS'
  ClientHeight = 171
  ClientWidth = 400
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 400
    inherited lblTitulo: TLabel
      Left = 82
    end
  end
  inherited PnDados: TPanel
    Width = 400
    Height = 77
    object Label1: TLabel
      Left = 16
      Top = 3
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 88
      Top = 3
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 16
      Top = 41
      Width = 17
      Height = 13
      Caption = 'Un.'
    end
    object Label4: TLabel
      Left = 88
      Top = 40
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 19
      Width = 65
      Height = 22
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
      Left = 88
      Top = 19
      Width = 249
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'EDTDESCRICAO'
    end
    object edtUnidade: TEdit
      Left = 16
      Top = 53
      Width = 65
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'EDTUNIDADE'
    end
    object edtValor: TEdit
      Left = 88
      Top = 53
      Width = 65
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'EDTVALOR'
      OnExit = edtValorExit
    end
  end
  inherited PnAcoes: TPanel
    Top = 117
    Width = 400
    inherited BtnGravar: TBitBtn
      Left = 98
      Top = 8
    end
    inherited BtnCancelar: TBitBtn
      Left = 202
      Top = 8
    end
  end
  inherited cdsAux: TClientDataSet
    Left = 384
    Top = 57
  end
  inherited cdsPadrao: TClientDataSet
    Left = 384
    Top = 89
  end
  inherited dspAux: TDataSetProvider
    Left = 416
    Top = 57
  end
  inherited dspPadrao: TDataSetProvider
    Left = 416
    Top = 89
  end
  inherited dsAux: TDataSource
    Left = 448
    Top = 57
  end
  inherited dsPadrao: TDataSource
    Left = 448
    Top = 89
  end
  inherited qryAux: TSQLQuery
    Left = 352
    Top = 57
  end
  inherited qryPadrao: TSQLQuery
    Left = 352
    Top = 89
  end
end
