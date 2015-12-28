inherited frmIncluirFormaPgto: TfrmIncluirFormaPgto
  Caption = 'MANUTEN'#199#195'O DE FORMAS DE PAGAMENTO'
  ClientHeight = 163
  ClientWidth = 381
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTitulo: TPanel
    Width = 381
    inherited lblTitulo: TLabel
      Left = 72
    end
  end
  inherited PnDados: TPanel
    Width = 381
    Height = 73
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 80
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 32
      Width = 65
      Height = 19
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'EDTCODIGO'
    end
    object edtDescricao: TEdit
      Left = 80
      Top = 32
      Width = 281
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'EDTDESCRICAO'
    end
  end
  inherited PnAcoes: TPanel
    Top = 113
    Width = 381
    inherited BtnGravar: TBitBtn
      Left = 88
      Top = 5
    end
    inherited BtnCancelar: TBitBtn
      Left = 192
      Top = 5
    end
  end
  inherited cdsAux: TClientDataSet
    Left = 40
    Top = 65529
  end
  inherited cdsPadrao: TClientDataSet
    Left = 40
    Top = 25
  end
  inherited dspAux: TDataSetProvider
    Left = 72
    Top = 65529
  end
  inherited dspPadrao: TDataSetProvider
    Left = 72
    Top = 25
  end
  inherited dsAux: TDataSource
    Left = 104
    Top = 65529
  end
  inherited dsPadrao: TDataSource
    Left = 104
    Top = 25
  end
  inherited qryAux: TSQLQuery
    Left = 8
    Top = 65529
  end
  inherited qryPadrao: TSQLQuery
    Left = 8
    Top = 25
  end
end
