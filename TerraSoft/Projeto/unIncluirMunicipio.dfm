inherited frmIncluirMunicipio: TfrmIncluirMunicipio
  Left = 495
  Top = 315
  Caption = 'MANUTEN'#199#195'O DE MUNIC'#205'PIOS'
  ClientHeight = 175
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnDados: TPanel
    Height = 81
    object Label1: TLabel
      Left = 13
      Top = 7
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 91
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 358
      Top = 7
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label4: TLabel
      Left = 90
      Top = 39
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label5: TLabel
      Left = 168
      Top = 39
      Width = 72
      Height = 13
      Caption = 'C'#243'd. Munic'#237'pio'
    end
    object Label6: TLabel
      Left = 272
      Top = 39
      Width = 50
      Height = 13
      Caption = 'C'#243'd. IBGE'
    end
    object edtCodigo: TEdit
      Left = 13
      Top = 20
      Width = 72
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
    object edtNome: TEdit
      Left = 91
      Top = 20
      Width = 261
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'EDTNOME'
    end
    object edtCodMunicipio: TEdit
      Left = 168
      Top = 52
      Width = 98
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
      Text = 'EDTCODMUNICIPIO'
    end
    object edtCodIBGE: TEdit
      Left = 272
      Top = 52
      Width = 79
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Text = 'EDTCODIBGE'
    end
    object mskCEP: TMaskEdit
      Left = 90
      Top = 52
      Width = 72
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99.999-999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Text = '  .   -   '
    end
    object ChBxCEPUnico: TCheckBox
      Left = 13
      Top = 55
      Width = 76
      Height = 14
      Caption = 'CEP '#218'nico'
      TabOrder = 3
    end
    object CbxUF: TComboBox
      Left = 358
      Top = 20
      Width = 46
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
  end
  inherited PnAcoes: TPanel
    Top = 121
    inherited BtnGravar: TBitBtn
      Top = 12
    end
    inherited BtnCancelar: TBitBtn
      Top = 12
    end
  end
  inherited cdsAux: TClientDataSet
    Left = 56
    Top = 9
  end
  inherited cdsPadrao: TClientDataSet
    Left = 56
    Top = 41
  end
  inherited dspAux: TDataSetProvider
    Left = 88
    Top = 9
  end
  inherited dspPadrao: TDataSetProvider
    Left = 88
    Top = 41
  end
  inherited dsAux: TDataSource
    Left = 120
    Top = 9
  end
  inherited dsPadrao: TDataSource
    Left = 120
    Top = 41
  end
  inherited qryAux: TSQLQuery
    Left = 24
    Top = 9
  end
  inherited qryPadrao: TSQLQuery
    Left = 24
    Top = 41
  end
end
