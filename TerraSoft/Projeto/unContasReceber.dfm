object frmContasReceber: TfrmContasReceber
  Left = 244
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CONTAS A RECEBER'
  ClientHeight = 485
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 874
    Height = 89
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Busca por:'
    end
    object Label2: TLabel
      Left = 160
      Top = 8
      Width = 57
      Height = 13
      Caption = 'C'#243'd. Cliente'
    end
    object lblCliente: TLabel
      Left = 256
      Top = 24
      Width = 241
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 504
      Top = 8
      Width = 97
      Height = 13
      Caption = 'Per'#237'odo Vencimento'
    end
    object Label4: TLabel
      Left = 581
      Top = 27
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label6: TLabel
      Left = 672
      Top = 8
      Width = 67
      Height = 13
      Caption = 'C'#243'd OS Bloco'
    end
    object Label7: TLabel
      Left = 160
      Top = 48
      Width = 95
      Height = 13
      Caption = 'C'#243'd. Tipo Cobran'#231'a'
    end
    object lblTipoCobranca: TLabel
      Left = 256
      Top = 64
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RdBtnNaoQuitadas: TRadioButton
      Left = 64
      Top = 8
      Width = 89
      Height = 17
      Caption = 'N'#227'o Quitadas'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RdBtnVencidas: TRadioButton
      Left = 64
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Vencidas'
      TabOrder = 1
    end
    object RdBtnQuitadas: TRadioButton
      Left = 64
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Quitadas'
      TabOrder = 2
    end
    object RdBtnTodas: TRadioButton
      Left = 64
      Top = 56
      Width = 49
      Height = 17
      Caption = 'Todas'
      TabOrder = 3
    end
    object edtCodCLiente: TEdit
      Left = 160
      Top = 24
      Width = 57
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnEnter = edtCodCLienteEnter
      OnExit = edtCodCLienteExit
    end
    object BtnBuscaCliente: TBitBtn
      Left = 224
      Top = 24
      Width = 25
      Height = 19
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070
        705050508F888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7070705F5850A0808F6F7080A0A8A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070705F5850AF88
        8F6F70A03F80DF80A8C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7070705F5850AF888F7070A03F80D04FB0FFBFE0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090905F5850AF888F7070A03F80
        D04FB0FFA0D0FFFFFFFFFFFFFFFFFFFF8F888F5F605F5050505050506F686F9F
        989F7F787F90787F7070A04080D04FB0FF8FC8FFFFFFFFFFFFFFFFFFFF8F888F
        505050807070CFB0A0DFC0AFCFA890BF98808070708F888F5088CF4FB0FF8FC8
        FFFFFFFFFFFFFFFFFFFF8F888F5050509F807FF0E8DFFFF8D0FFF8D0FFF8D0FF
        F0BFEFC8A0AF888FC0C8D0A0D0FFFFFFFFFFFFFFFFFFFFFFFFFF6F686F70585F
        EFE8D0FFF8FFFFF8FFFFF8E0FFF8D0FFF0BFFFF0BFEFC0A0DFC8CFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF505050B0988FFFF8D0FFF8F0FFF8FFFFF8E0FFF8D0FF
        F0C0FFE0AFFFF0BFDFB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF505050CFB090
        FFF8D0FFF8E0FFF8E0FFF8E0FFF8D0FFF0BFFFD8A0FFF0C0E0B8A0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF6F686FCFA88FFFF8D0FFF8D0FFF8D0FFF8D0FFF8CFFF
        E8BFFFE0B0FFF0C0E0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FB0907F
        FFF0BFFFF0BFFFF0C0FFF0BFFFE8BFFFE0B0FFF0D0FFF0C0DFB8B0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8F7070EFD0A0FFE8BFFFE0AFFFD8A0FFE8BFFF
        F0E0FFF8FFEFD8BFDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B09080F0C8A0FFF0BFFFE8BFFFF8CFFFF8E0EFE0DFD0B8B0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FDFB09FDFB09FCFA08FCF
        A89FDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 5
      OnClick = BtnBuscaClienteClick
    end
    object mskInicial: TMaskEdit
      Left = 504
      Top = 24
      Width = 72
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 6
      Text = '01/01/2000'
    end
    object mskFInal: TMaskEdit
      Left = 592
      Top = 24
      Width = 72
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 7
      Text = '01/01/2050'
    end
    object BtnConsultar: TBitBtn
      Left = 760
      Top = 8
      Width = 105
      Height = 33
      Caption = 'CONSULTAR'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070
        705050508F888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7070705F5850A0808F6F7080A0A8A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070705F5850AF88
        8F6F70A03F80DF80A8C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7070705F5850AF888F7070A03F80D04FB0FFBFE0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090905F5850AF888F7070A03F80
        D04FB0FFA0D0FFFFFFFFFFFFFFFFFFFF8F888F5F605F5050505050506F686F9F
        989F7F787F90787F7070A04080D04FB0FF8FC8FFFFFFFFFFFFFFFFFFFF8F888F
        505050807070CFB0A0DFC0AFCFA890BF98808070708F888F5088CF4FB0FF8FC8
        FFFFFFFFFFFFFFFFFFFF8F888F5050509F807FF0E8DFFFF8D0FFF8D0FFF8D0FF
        F0BFEFC8A0AF888FC0C8D0A0D0FFFFFFFFFFFFFFFFFFFFFFFFFF6F686F70585F
        EFE8D0FFF8FFFFF8FFFFF8E0FFF8D0FFF0BFFFF0BFEFC0A0DFC8CFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF505050B0988FFFF8D0FFF8F0FFF8FFFFF8E0FFF8D0FF
        F0C0FFE0AFFFF0BFDFB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF505050CFB090
        FFF8D0FFF8E0FFF8E0FFF8E0FFF8D0FFF0BFFFD8A0FFF0C0E0B8A0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF6F686FCFA88FFFF8D0FFF8D0FFF8D0FFF8D0FFF8CFFF
        E8BFFFE0B0FFF0C0E0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FB0907F
        FFF0BFFFF0BFFFF0C0FFF0BFFFE8BFFFE0B0FFF0D0FFF0C0DFB8B0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8F7070EFD0A0FFE8BFFFE0AFFFD8A0FFE8BFFF
        F0E0FFF8FFEFD8BFDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B09080F0C8A0FFF0BFFFE8BFFFF8CFFFF8E0EFE0DFD0B8B0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FDFB09FDFB09FCFA08FCF
        A89FDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 8
      OnClick = BtnConsultarClick
    end
    object BtnRelatorio: TBitBtn
      Left = 760
      Top = 48
      Width = 105
      Height = 33
      Caption = 'RELATORIO'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFF936645
        9366459366459367459367459367459367449367449366459366459367459367
        45936745936644936644936744936644936644936745936745936644936745FF
        FFFFFFFFFF946745E3CAADE3CAADE4CAADE3CBADE3CBADE3CBADE3CBADE3CBAD
        E4CAAEE4CAAEE3CAAEE3CAAEE4CAAEE4CBADE4CBADE4CAAEE4CAADE4CAADE4CB
        ADE4CBAD936745FFFFFFFFFFFF956945E4CBAEE4CBAEA0734898693FB89168E4
        CBAEE4CBAED7B899D6B697D6B697D5B697D5B698D6B698D6B697D6B697D5B596
        D6B697D6B697E4CCAEE4CCAE956845FFFFFFFFFFFF976946E5CDB1E5CDB1E6C3
        96D6AA709C6F45E5CCB1E5CCB1AF7D57A9754EA9754EA9754EA9754EA9754EA9
        754EA9754EA9754EA9754EA9754EE4CDB1E4CDB1966946FFFFFFFFFFFF986A46
        E5CFB3E5CFB3FDE8CFF4D9B8A87D52E5CEB3E5CEB3E5CEB3E5CFB3E5CFB3E5CE
        B3E5CEB3E5CEB3E5CFB3E5CFB3E5CEB4E5CEB3E5CEB3E5CEB3E5CEB3976A46FF
        FFFFFFFFFF9A6B47E6D1B6E6D1B6E6D0B5E6D0B6E6D0B6E6CFB6E6CFB6E6CFB6
        E6D1B6E6D1B6E6CFB6E6CFB6E6CFB6E6D0B5E6D0B5E6CFB6E6CFB6E6CFB6E6CF
        B6E6CFB6996B47FFFFFFFFFFFF9A6C48E7D2B9E7D2B9A0734898693FB9926BE7
        D2B9E7D2B9DABEA2D8BB9FD8BB9FD8BB9ED8BC9FD8BC9FD8BC9FD8BB9FD7BA9E
        D8BC9FD8BC9FE7D2B9E7D2B99B6C48FFFFFFFFFFFF9C6E48E7D4BDE7D4BDE6C3
        96D6AA709C6F46E7D4BDE7D4BDAF7E58A9754EA9754EA9754EA9754EA9754EA9
        754EA9754EA9754EA9754EA9754EE7D4BDE7D4BD9D6D48FFFFFFFFFFFF9F6E49
        E8D7C0E8D7C0FDE8CFF4D9B8A87D53E8D6C0E8D6C1E8D7C1E8D7C0E8D7C0E8D6
        C1E8D6C1E8D6C0E8D6C0E8D6C0E8D6C0E8D7C0E8D7C0E8D6C0E8D6C09F6F48FF
        FFFFFFFFFFA06F4AE9D9C4E9D9C4E9D9C3E9D9C4E9D9C4E9D9C4E9D9C4E9D9C4
        E9D9C4E9D9C4EAD9C4EAD8C4E9D8C4E9D8C3E9D8C3E9D8C4E9D9C3E9D9C3E9D8
        C3E9D8C3A0704AFFFFFFFFFFFFA2714BEBDAC7EBDAC7A0734898693FBA946EEA
        DBC7EADBC7DCC4ADDAC2AADAC2AADAC1AADAC2AADAC2AADAC3A9DAC2A9D9C1A8
        DAC2A9DAC2A9EADBC6EADBC6A1704AFFFFFFFFFFFFA3724BEBDCCAEBDCCAE6C3
        96D6AA709D7046EBDECAECDDCAAF7F5AA9754EA9754EA9754EA9754EA9754EA9
        754EA9754EA9754EA9754EA9754EEBDECBEBDECBA4724BFFFFFFFFFFFFA5744B
        EBDFCFEBDFCFFDE8CFF4D9B8A87D53ECE0CFECE0CFECDFCEECE0CEECE0CEECE0
        CEECE0CEECE0CEECDFCEECDFCEECE0CEECDFCEECDFCEECE0CFECE0CFA6734CFF
        FFFFFFFFFFA8744CEDE1D2EDE1D2EDE1D1ECE1D1ECE1D1EDE1D2EDE1D2EDE1D1
        EDE2D1EDE2D1EDE1D1ECE2D2ECE2D2ECE1D1ECE1D1ECE1D1EDE1D1EDE1D1EDE2
        D2EDE2D2A7744CFFFFFFFFFFFFA9754DEEE4D5EEE4D5A0734898693FBB9772EE
        E3D5EEE3D5DFCBB8DDCAB4DDCAB4DDC9B4DDC9B5DDC9B5DDC9B5DDC9B4DCC7B3
        DDC9B5DDC9B5EEE4D5EEE4D5A9754DFFFFFFFFFFFFAA774EEFE6D8EFE6D8E6C3
        96D6AA709D7047EFE6D8EFE6D8B0805BA9754EA9754EA9754EA9754EA9754EA9
        754EA9754EA9754EA9754EA9754EEFE6D8EFE6D8AA774EFFFFFFFFFFFFAD784F
        EFE8DCEFE8DCFDE8CFF4D9B8A87D53EFE8DCEFE8DCEFE8DCEFE8DCEFE8DCEFE8
        DCF0E8DCF0E8DCEFE8DCEFE8DCEFE8DCEFE8DCEFE8DCEFE8DCEFE8DCAD784FFF
        FFFFFFFFFFAF794FF0EBDFF0EBDFF0EBDFF0EADFF0EADFF0EADFF0EADFF0EADF
        F0EBE0F0EBE0F0EBDFF0EADFF0EADFF0EBE0F0EBE0F0EADFF0EBDFF0EBDFF0EA
        DFF0EADFAF784FFFFFFFFFFFFFAF7A50F1ECE1F1ECE1A0734898693FBB9975F1
        ECE2F1ECE2E1D2C2DFCFBEDFCFBEDFCFBEDFCFBFDFCFBFE0D0BFDFCFBEDFCEBC
        E0D0BFE0D0BFF1ECE1F1ECE1AF7950FFFFFFFFFFFFB17B51F1EEE5F1EEE5E6C3
        96D6AA709D7047F1EDE4F2EDE5B0805CA9754EA9754EA9754EA9754EA9754EA9
        754EA9754EA9754EA9754EA9754EF1EDE4F1EDE4B17A50FFFFFFFFFFFFB27C51
        F2EFE7F2EFE7FDE8CFF4D9B8A87E54F1EFE7F2EFE7F3EFE7F2EFE7F1EFE7F2EF
        E6F2EFE6F2EFE7F3EFE7F3EFE7F2EFE7F2EFE7F2EFE7F1EFE6F1EFE6B27C51FF
        FFFFFFFFFFB37D52F3F0E8F3F0E8F3F1E9F2F0E9F2F0E9F2F1E9F3F1E9F3F0E9
        F2F1E9F2F1E9F2F0E8F3F0E8F3F0E9F3F1E9F3F1E9F2F1E9F2F0E9F2F0E9F2F1
        E8F2F1E8B47C51FFFFFFFFFFFFB57D52F3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3
        F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EA
        F3F1EAF3F1EAF3F1EAF3F1EAB47C51FFFFFFFFFFFFB57D52B57D52B57D52B57D
        52B57D52B57D52B57D52B57D52B57E52B57E52B57D52B57D52B57D52B57D52B5
        7D52B57D52B57D52B57D52B57D52B57D52B57D52B57D52FFFFFF}
      TabOrder = 9
      OnClick = BtnRelatorioClick
    end
    object edtCodOSBloco: TEdit
      Left = 672
      Top = 24
      Width = 81
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 10
    end
    object edtCodTipoCobranca: TEdit
      Left = 160
      Top = 64
      Width = 57
      Height = 19
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
      OnExit = edtCodTipoCobrancaExit
    end
    object BtnBuscaTipoCobranca: TBitBtn
      Left = 224
      Top = 64
      Width = 25
      Height = 19
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070
        705050508F888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7070705F5850A0808F6F7080A0A8A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070705F5850AF88
        8F6F70A03F80DF80A8C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF7070705F5850AF888F7070A03F80D04FB0FFBFE0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9090905F5850AF888F7070A03F80
        D04FB0FFA0D0FFFFFFFFFFFFFFFFFFFF8F888F5F605F5050505050506F686F9F
        989F7F787F90787F7070A04080D04FB0FF8FC8FFFFFFFFFFFFFFFFFFFF8F888F
        505050807070CFB0A0DFC0AFCFA890BF98808070708F888F5088CF4FB0FF8FC8
        FFFFFFFFFFFFFFFFFFFF8F888F5050509F807FF0E8DFFFF8D0FFF8D0FFF8D0FF
        F0BFEFC8A0AF888FC0C8D0A0D0FFFFFFFFFFFFFFFFFFFFFFFFFF6F686F70585F
        EFE8D0FFF8FFFFF8FFFFF8E0FFF8D0FFF0BFFFF0BFEFC0A0DFC8CFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF505050B0988FFFF8D0FFF8F0FFF8FFFFF8E0FFF8D0FF
        F0C0FFE0AFFFF0BFDFB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF505050CFB090
        FFF8D0FFF8E0FFF8E0FFF8E0FFF8D0FFF0BFFFD8A0FFF0C0E0B8A0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF6F686FCFA88FFFF8D0FFF8D0FFF8D0FFF8D0FFF8CFFF
        E8BFFFE0B0FFF0C0E0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FB0907F
        FFF0BFFFF0BFFFF0C0FFF0BFFFE8BFFFE0B0FFF0D0FFF0C0DFB8B0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8F7070EFD0A0FFE8BFFFE0AFFFD8A0FFE8BFFF
        F0E0FFF8FFEFD8BFDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B09080F0C8A0FFF0BFFFE8BFFFF8CFFFF8E0EFE0DFD0B8B0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F888FDFB09FDFB09FCFA08FCF
        A89FDFC0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 12
      OnClick = BtnBuscaTipoCobrancaClick
    end
  end
  object PnRodape: TPanel
    Left = 0
    Top = 429
    Width = 874
    Height = 56
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object Label5: TLabel
      Left = 728
      Top = 36
      Width = 41
      Height = 16
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotal: TLabel
      Left = 775
      Top = 36
      Width = 90
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnIncluir: TBitBtn
      Left = 8
      Top = 16
      Width = 57
      Height = 28
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnAlterar: TBitBtn
      Left = 67
      Top = 16
      Width = 54
      Height = 28
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BtnAlterarClick
    end
    object BtnQuitar: TBitBtn
      Left = 196
      Top = 16
      Width = 69
      Height = 28
      Caption = 'Quitar '#218'nica'
      TabOrder = 2
      OnClick = BtnQuitarClick
    end
    object BtnHistorico: TBitBtn
      Left = 376
      Top = 16
      Width = 65
      Height = 28
      Caption = 'Hist'#243'rico'
      TabOrder = 3
      OnClick = BtnHistoricoClick
    end
    object BtnRecibo: TBitBtn
      Left = 448
      Top = 16
      Width = 57
      Height = 28
      Caption = 'Recibo'
      TabOrder = 4
      OnClick = BtnReciboClick
    end
    object BtnSair: TBitBtn
      Left = 752
      Top = 8
      Width = 69
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 5
      OnClick = BtnSairClick
    end
    object BtnRenegociar: TBitBtn
      Left = 592
      Top = 16
      Width = 65
      Height = 25
      Caption = 'Renegociar'
      TabOrder = 6
      OnClick = BtnRenegociarClick
    end
    object BtnMarcar: TBitBtn
      Left = 664
      Top = 8
      Width = 65
      Height = 17
      Caption = 'Marcar'
      TabOrder = 7
      OnClick = BtnMarcarClick
    end
    object BtnDesmarcar: TBitBtn
      Left = 664
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Desmarcar'
      TabOrder = 8
      OnClick = BtnDesmarcarClick
    end
    object BtnQuitarMarcadas: TBitBtn
      Left = 272
      Top = 16
      Width = 97
      Height = 28
      Caption = 'Quitar Marcadas'
      TabOrder = 9
      OnClick = BtnQuitarMarcadasClick
    end
    object BtnOrigem: TBitBtn
      Left = 512
      Top = 16
      Width = 65
      Height = 28
      Caption = 'Origem'
      TabOrder = 10
      OnClick = BtnOrigemClick
    end
    object BtnExcluir: TBitBtn
      Left = 126
      Top = 16
      Width = 65
      Height = 28
      Caption = 'Excluir'
      TabOrder = 11
      OnClick = BtnExcluirClick
    end
  end
  object PnContas: TPanel
    Left = 0
    Top = 89
    Width = 874
    Height = 340
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 2
    object GrdContasReceber: TDBGrid
      Left = 1
      Top = 1
      Width = 868
      Height = 334
      Align = alClient
      Color = 13565951
      DataSource = dsContasReceber
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdContasReceberDrawColumnCell
      OnTitleClick = GrdContasReceberTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EMISSAO'
          Title.Alignment = taCenter
          Title.Caption = 'Emiss'#227'o'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Width = 286
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATARECEBIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Recebimento'
          Width = 92
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VALORRECEBIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Recebido'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPOCOBRANCA'
          Title.Caption = 'Tp. Cobran'#231'a'
          Width = 83
          Visible = True
        end>
    end
  end
  object dsContasReceber: TDataSource
    DataSet = cdsContasReceber
    Left = 24
    Top = 144
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasReceber'
    Left = 56
    Top = 144
  end
  object dspContasReceber: TDataSetProvider
    DataSet = qryContasReceber
    Left = 88
    Top = 144
  end
  object qryContasReceber: TSQLQuery
    DataSource = dsContasReceber
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 120
    Top = 144
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 24
    Top = 176
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 56
    Top = 176
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 88
    Top = 176
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 120
    Top = 176
  end
end
