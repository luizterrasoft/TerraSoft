object frmConsultaEmprestimos: TfrmConsultaEmprestimos
  Left = 275
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONSULTA DE EMPR'#201'STIMOS'
  ClientHeight = 396
  ClientWidth = 741
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
  object PnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Consulta por:'
    end
    object Bevel1: TBevel
      Left = 96
      Top = 8
      Width = 2
      Height = 73
    end
    object Label2: TLabel
      Left = 312
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Digite'
    end
    object Label3: TLabel
      Left = 112
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Filtro'
    end
    object Label4: TLabel
      Left = 120
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label5: TLabel
      Left = 200
      Top = 24
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object RdBtnID: TRadioButton
      Left = 32
      Top = 24
      Width = 49
      Height = 17
      Caption = 'ID'
      TabOrder = 0
    end
    object RdBtnLeitor: TRadioButton
      Left = 32
      Top = 40
      Width = 49
      Height = 17
      Caption = 'Leitor'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object edtConsulta: TEdit
      Left = 312
      Top = 40
      Width = 297
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
    end
    object BtnConsultar: TBitBtn
      Left = 648
      Top = 24
      Width = 75
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 3
      OnClick = BtnConsultarClick
    end
    object RdBtnLivro: TRadioButton
      Left = 32
      Top = 56
      Width = 49
      Height = 17
      Caption = 'Livro'
      TabOrder = 4
    end
    object mskInicial: TMaskEdit
      Left = 120
      Top = 40
      Width = 73
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 5
      Text = '  /  /    '
    end
    object mskFinal: TMaskEdit
      Left = 200
      Top = 40
      Width = 72
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '  /  /    '
    end
  end
  object PnOpcoes: TPanel
    Left = 0
    Top = 352
    Width = 741
    Height = 44
    Align = alBottom
    TabOrder = 1
    object BtnEmprestar: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Emprestar'
      TabOrder = 0
      OnClick = BtnEmprestarClick
    end
    object BtnDevolver: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Devolver'
      TabOrder = 1
      OnClick = BtnDevolverClick
    end
    object BtnExcluir: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnSair: TBitBtn
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair - Esc'
      TabOrder = 3
      OnClick = BtnSairClick
    end
  end
  object PnDados: TPanel
    Left = 0
    Top = 89
    Width = 741
    Height = 263
    Align = alClient
    TabOrder = 2
    object GrdEmprestimos: TDBGrid
      Left = 1
      Top = 1
      Width = 739
      Height = 261
      Align = alClient
      DataSource = dsEmprestimo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_EMPRESTIMO'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Leitor'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Alignment = taCenter
          Title.Caption = 'T'#237'tulo'
          Width = 174
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATENDENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Atendente'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_EMPRESTIMO'
          Title.Alignment = taCenter
          Title.Caption = 'Empr'#233'stimo'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_DEVOLUCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Devolu'#231#227'o'
          Width = 67
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_DEVOLVIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Devolvido em'
          Width = 73
          Visible = True
        end>
    end
  end
  object qryEmprestimo: TSQLQuery
    DataSource = dsEmprestimo
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 544
    Top = 16
  end
  object dsEmprestimo: TDataSource
    DataSet = cdsEmprestimo
    Left = 576
    Top = 16
  end
  object cdsEmprestimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmprestimo'
    Left = 608
    Top = 16
  end
  object dspEmprestimo: TDataSetProvider
    DataSet = qryEmprestimo
    Left = 640
    Top = 16
  end
end
