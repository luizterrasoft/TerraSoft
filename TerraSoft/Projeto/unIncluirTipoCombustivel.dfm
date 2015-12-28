inherited frmIncluirTipoCombustivel: TfrmIncluirTipoCombustivel
  Caption = 'MANUTEN'#199#195'O TIPOS DE COMBUST'#205'VEIS'
  ClientHeight = 181
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnDados: TPanel
    Height = 89
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 16
      Top = 46
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 22
      Width = 73
      Height = 19
      Ctl3D = False
      Enabled = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 16
      Top = 62
      Width = 393
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  inherited PnAcoes: TPanel
    Top = 129
    inherited BtnGravar: TBitBtn
      Top = 12
    end
    inherited BtnCancelar: TBitBtn
      Top = 12
    end
  end
end
