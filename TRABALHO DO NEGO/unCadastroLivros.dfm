object frmCadastroLivros: TfrmCadastroLivros
  Left = 586
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CADASTRO DO LIVRO'
  ClientHeight = 231
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnDados: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 183
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'ID Livro'
    end
    object Label2: TLabel
      Left = 72
      Top = 8
      Width = 28
      Height = 13
      Caption = 'T'#237'tulo'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 43
      Height = 13
      Caption = 'Exemplar'
    end
    object Label4: TLabel
      Left = 216
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Autor'
    end
    object Label5: TLabel
      Left = 8
      Top = 96
      Width = 33
      Height = 13
      Caption = 'Editora'
    end
    object Label6: TLabel
      Left = 8
      Top = 136
      Width = 108
      Height = 13
      Caption = #193'rea de Conhecimento'
    end
    object Label7: TLabel
      Left = 152
      Top = 136
      Width = 57
      Height = 13
      Caption = 'Localiza'#231#227'o'
    end
    object Label8: TLabel
      Left = 216
      Top = 96
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object edtIDLivro: TEdit
      Left = 8
      Top = 24
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      Text = 'EDTIDLIVRO'
    end
    object edtTitulo: TEdit
      Left = 72
      Top = 24
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDTTITULO'
    end
    object edtExemplar: TEdit
      Left = 8
      Top = 72
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Text = 'EDTEXEMPLAR'
    end
    object edtAutor: TEdit
      Left = 216
      Top = 72
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      Text = 'EDTAUTOR'
    end
    object edtEditora: TEdit
      Left = 8
      Top = 112
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = 'EDTANO'
    end
    object edtAreaConhecimento: TEdit
      Left = 8
      Top = 152
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
      Text = 'EDTAREACONHECIMENTO'
    end
    object edtLocalizacao: TEdit
      Left = 152
      Top = 152
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
      Text = 'EDTLOCALIZACAO'
    end
    object edtAno: TEdit
      Left = 216
      Top = 112
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
      Text = 'EDTANO'
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 183
    Width = 411
    Height = 48
    Align = alBottom
    TabOrder = 1
    object BtnGravar: TBitBtn
      Left = 120
      Top = 12
      Width = 83
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 0
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TBitBtn
      Left = 208
      Top = 12
      Width = 97
      Height = 25
      Caption = 'CANCELAR - Esc'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object qryCadLivro: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 312
    Top = 104
  end
end