object frmPrincipal: TfrmPrincipal
  Left = 398
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CADASTRO DE CLIENTES - LUVI J'#211'IAS'
  ClientHeight = 503
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnConsultar: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object lblPesquisaPor: TLabel
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Pesquisa por:'
    end
    object lblConsulta: TLabel
      Left = 120
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Consulta'
    end
    object RdBtnCodigo: TRadioButton
      Left = 24
      Top = 24
      Width = 57
      Height = 17
      Caption = 'C'#243'digo'
      TabOrder = 0
    end
    object RdBtnNome: TRadioButton
      Left = 24
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Nome'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RdBtnCPF: TRadioButton
      Left = 24
      Top = 56
      Width = 73
      Height = 17
      Caption = 'CPF'
      TabOrder = 2
    end
    object edtConsulta: TEdit
      Left = 120
      Top = 24
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object BtnConsultar: TBitBtn
      Left = 552
      Top = 8
      Width = 107
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 4
      OnClick = BtnConsultarClick
    end
    object BtnMostrartodos: TBitBtn
      Left = 552
      Top = 56
      Width = 105
      Height = 25
      Caption = 'MOSTRAR TODOS'
      TabOrder = 5
      OnClick = BtnMostrartodosClick
    end
  end
  object PnBotoes: TPanel
    Left = 0
    Top = 458
    Width = 675
    Height = 45
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object BtnIncluir: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Incluir - F2'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar - F3'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnExcluir: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir - F4'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnImprimir: TBitBtn
      Left = 336
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = BtnImprimirClick
    end
    object BtnSair: TBitBtn
      Left = 568
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object BtnRelatorio: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 5
      OnClick = BtnRelatorioClick
    end
  end
  object PnClientes: TPanel
    Left = 0
    Top = 89
    Width = 675
    Height = 369
    Align = alClient
    TabOrder = 2
    object GrdClientes: TDBGrid
      Left = 1
      Top = 1
      Width = 673
      Height = 367
      Align = alClient
      DataSource = dsClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GrdClientesCellClick
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
          Width = 235
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CPF'
          Title.Alignment = taCenter
          Width = 115
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FONE'
          Title.Alignment = taCenter
          Title.Caption = 'Fone'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Title.Alignment = taCenter
          Title.Caption = 'Celular'
          Width = 102
          Visible = True
        end>
    end
    object mskLicenca: TMaskEdit
      Left = 136
      Top = 216
      Width = 117
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '10/03/2015'
      Visible = False
    end
  end
  object qryClientes: TSQLQuery
    DataSource = dsClientes
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM clientes')
    SQLConnection = Connection
    Left = 456
    Top = 153
  end
  object dsClientes: TDataSource
    DataSet = cdsClientes
    Left = 488
    Top = 153
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 520
    Top = 153
  end
  object dspClientes: TDataSetProvider
    DataSet = qryClientes
    Left = 552
    Top = 153
  end
  object Connection: TSQLConnection
    ConnectionName = 'ClientesFB'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Clientes\Dados\DADOS.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 448
    Top = 201
  end
end
