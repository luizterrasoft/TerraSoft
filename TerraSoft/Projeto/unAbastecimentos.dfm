object frmAbastecimentos: TfrmAbastecimentos
  Left = 204
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ABASTECIMENTOS'
  ClientHeight = 431
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
    Width = 855
    Height = 105
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 86
      Height = 13
      Caption = 'Tipo Combust'#237'vel:'
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 65
      Height = 13
      Caption = 'Equipamento:'
    end
    object lblTipoCombustivel: TLabel
      Left = 200
      Top = 8
      Width = 290
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEquipamento: TLabel
      Left = 200
      Top = 32
      Width = 290
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
      Left = 8
      Top = 60
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object lblFornecedor: TLabel
      Left = 200
      Top = 56
      Width = 290
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 83
      Width = 58
      Height = 13
      Caption = 'Funcion'#225'rio:'
    end
    object lblFuncionario: TLabel
      Left = 200
      Top = 80
      Width = 290
      Height = 20
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 504
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
    end
    object Label6: TLabel
      Left = 624
      Top = 16
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object edtCodTipoCombustivel: TEdit
      Left = 105
      Top = 9
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnEnter = edtCodTipoCombustivelEnter
      OnExit = edtCodTipoCombustivelExit
    end
    object BtnBuscaTipoCombustivel: TBitBtn
      Left = 160
      Top = 8
      Width = 33
      Height = 21
      TabOrder = 1
      OnClick = BtnBuscaTipoCombustivelClick
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
    end
    object edtCodEquipamento: TEdit
      Left = 104
      Top = 34
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      OnEnter = edtCodEquipamentoEnter
      OnExit = edtCodEquipamentoExit
    end
    object BtnBuscaEquipamento: TBitBtn
      Left = 160
      Top = 32
      Width = 33
      Height = 21
      TabOrder = 3
      OnClick = BtnBuscaEquipamentoClick
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
    end
    object edtCodFornecedor: TEdit
      Left = 104
      Top = 58
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      OnEnter = edtCodFornecedorEnter
      OnExit = edtCodFornecedorExit
    end
    object BtnBuscaFornecedor: TBitBtn
      Left = 160
      Top = 56
      Width = 33
      Height = 21
      TabOrder = 5
      OnClick = BtnBuscaFornecedorClick
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
    end
    object edtCodFuncionario: TEdit
      Left = 104
      Top = 80
      Width = 49
      Height = 19
      CharCase = ecUpperCase
      Color = 13565951
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      OnEnter = edtCodFuncionarioEnter
      OnExit = edtCodFuncionarioExit
    end
    object BtnBuscaFuncionario: TBitBtn
      Left = 160
      Top = 80
      Width = 33
      Height = 21
      TabOrder = 7
      OnClick = BtnBuscaFuncionarioClick
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
    end
    object mskInicial: TMaskEdit
      Left = 548
      Top = 10
      Width = 68
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 8
      Text = '01/01/2000'
    end
    object mskFinal: TMaskEdit
      Left = 640
      Top = 10
      Width = 67
      Height = 19
      Color = 13565951
      Ctl3D = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 9
      Text = '01/01/2020'
    end
    object BtnConsultar: TBitBtn
      Left = 736
      Top = 8
      Width = 105
      Height = 41
      Caption = 'CONSULTAR'
      TabOrder = 10
      OnClick = BtnConsultarClick
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
    end
    object BtnRelatorio: TBitBtn
      Left = 736
      Top = 56
      Width = 105
      Height = 41
      Caption = 'RELAT'#211'RIO'
      TabOrder = 11
      Glyph.Data = {
        6A060000424D6A060000000000002A0400002800000018000000180000000100
        08000000000040020000120B0000120B0000FD000000FD00000000000000FFFF
        FF00FF00FF00A46769006544410093655E0092635D0093655F00986963009E6E
        6400A3726600724F4600811E0000801E00007D1D00006E190000581400009F6F
        60006C4C4200A0726400B17E6B006C4C4100FFFCFB00B47F6A00B5806B00805B
        4900A0735D00CE8C6700CF8E6800D4987500A5A19D00F0E3D300D5CCC100D4CB
        C000A49E9700A79A8900FAEBD700AAA19500BFB6AA00FBEFE000FBF0E100FAEF
        E000FAF0E300D1C9BF00FBF2E600F2EBE200A5A19C00E0DCD700F6F2ED00FEFB
        F700EBC08200EBC18400EBC28600EDC48800EBC28700EDC58A00EDC58B00EDC6
        8C00EDC68E00EDC78F00EEC99200EECA9500A1896500EFCB9700EECA9600EFCB
        9800EFCC9900A38B6800EECC9900A38C6A00F0CF9E00EFCE9D00F0D0A000EFCF
        9F00F0D0A100F0D1A400A48F7000F0D1A500A5907200A5917300F2D4AA00F2D5
        AA00F2D5AB00F2D5AC00A5917500A5927600F3D8B000F2D7AF00A5937800F3D9
        B200F2D8B100A5937900F3D9B400F3DAB500F3DAB600F4DCB800F6E0C000F4DE
        BF00F6E1C200F6E1C400F6E2C400F6E2C500F6E3C700F7E5CA00A99D8B00F7E6
        CE00F7E7D000A99E8E00F6E7D100A99F9000F8EAD500AAA09200F8EBD800F8EB
        D900F2E6D400FAEEDC00FAEEDD00F0E6D700FAF0E200FBF2E500ABA59C00FBF3
        E700FCF4E900FAF3E900FCF6ED00D3CFC900EBC48800EBC48900EBC58B00A188
        6000EEC99100EDC99000A1886200EDC99200EDCA9300EECB9600A18A6600EECC
        9800EFCE9A00EFCE9C00A48E6C00EFCF9E00EFD09F00A48F6D00F0D1A100A48F
        6E00EFD1A100F2D3A400F0D3A400EFD1A300F0D3A500F0D3A600F0D4A700F2D7
        AB00F0D4A900F0D5AA00F2D7AD00F3D8AF00A5937700F3D9B100F2D8B000F2D9
        B000F4DCB600A5957B00F3DCB600F3DCB800F4DDBA00A6977F00A5967E00F4DE
        BC00A7988100F6E1C100F4E0BF00A7998300A6988200F6E2C200F4E0C000A79A
        8600F6E3C600F7E5C900F7E6CA00F6E5C900F7E6CB00F6E5CA00F7E6CC00F7E7
        CE00F8E9D100F6E7D000F8EAD300F8EAD400F7EAD500FAEDD800F8EBD700FAEF
        DD00EFE5D500FAF0E000FBF4E900D1CCC400FBF6EE00EFEAE200A6967B00F3DC
        B500F3DDB800F3DEBB00F4E0BD00F4E1C100F4E2C400F8E9D000F7E9D100F8EB
        D500F6E9D300F0E5D100FAEEDA00F8EDD900F8EDDA00DDD4C400AAA49900FBF2
        E300D1CBC000F0EAE000BFBBB400FAF6EF00F7E9CF00EBE1CE00DDD4C200FAF2
        E200A4A09800FEFCF800F3EDE000DEDAD000D1CEC700A5A39E00008100000080
        0000007B00002B58FF00305DFF00315EFF001E4AFF002450FF00103AFF001641
        FF00042BFF000931FF00001FFF000123FF000019F7000016EF000012E000000F
        D400010CC40000008200FEFEFE00020202060303030303030303030303030303
        03030303020202020205A1999A4D92468B413D853B3A387E3433321102020202
        02075DA09C5196958E47423F86823A807F363411020202020207A65EE8E85198
        0C0C0C0C0C0C0C0C0C373511020202020207CCCBE8E856539A9390498B89403C
        83393811020202020204B1AEA7A8A358554F4E918C4543883E848115020202FB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFB02FB0208B8B365AB61A6
        A45957529A944A8D8A41871102FB02FB0209CF69FBFBAFACFBFBFBFBFBFBFBFB
        FB8B441102FB02FB020A24BCFBFB6664B0A9A5C95A9C50974B48471102FB02FB
        020B256F6D6B6823B1ADAAA7C85B9E544E4C8F1202FB02FBFBFBFBFBFBFBFBFB
        FBFBFBFBFBFBFBFBFBFBFBFBFBFB02020214D9C373D5D1D0DEB466CEB0A95FC9
        9F9C9B13020202020218792AE9E971BE0C0C0C0C0C0C0C0C0C599D1302020202
        02172DDBEAEAC21FD36CBB6967B262ACCBA25C1302020202021A7DE6C5DA2B21
        E0DFD2BCB9B6B26360A9CA13020202020219E71E2EE222D826D772C0BCCFB8B5
        65CDCC130202FBFBFBFBFBFBFBFBFBFB782075D5BF6EBAB8B7B2AB130202FBEC
        EFF1F3F5F6F8FAFB100F0E0D0C0C0C0C0CB4B2130202FBEDEBEEF0F2F4F7F9FB
        DCE5E4D928C1D6C0BCDEB6130202FBFBFBFBFBFBFBFBFBFB2FC77BC477E127D4
        70BD6A1302020202021D0101FC16E33130DDC67C7A2C762974BFBD1302020202
        021B1B1B1B1B1B1B1C1C1C1C1C1C1C1C1C1C1C1C020202020202020202020202
        0202020202020202020202020202}
    end
    object RdGrpSituacao: TRadioGroup
      Left = 504
      Top = 36
      Width = 89
      Height = 65
      Caption = 'Situa'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'ABERTAS'
        'FECHADAS'
        'TODAS')
      TabOrder = 12
    end
  end
  object PnAbastecimentos: TPanel
    Left = 0
    Top = 105
    Width = 855
    Height = 279
    Align = alClient
    TabOrder = 1
    object GrdAbastecimentos: TDBGrid
      Left = 1
      Top = 1
      Width = 853
      Height = 277
      Align = alClient
      DataSource = dsAbastecimentos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = GrdAbastecimentosDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Combust'#237'vel'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Equipamento'
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAZAOSOCIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Width = 179
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAABASTECIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Funcion'#225'rio'
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'KMHR'
          Title.Alignment = taCenter
          Title.Caption = 'KM/HR'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total'
          Width = 53
          Visible = True
        end>
    end
  end
  object PnBotoes: TPanel
    Left = 0
    Top = 384
    Width = 855
    Height = 47
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BtnIncluir: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = BtnIncluirClick
    end
    object BtnVisualizar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 1
      OnClick = BtnVisualizarClick
    end
    object BtnExcluir: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
    object BtnMarcar: TBitBtn
      Left = 528
      Top = 8
      Width = 65
      Height = 17
      Caption = 'Marcar'
      TabOrder = 3
      OnClick = BtnMarcarClick
    end
    object BtnSair: TBitBtn
      Left = 768
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair - ESC'
      TabOrder = 4
      OnClick = BtnSairClick
    end
    object BtnDesmarcar: TBitBtn
      Left = 528
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Desmarcar'
      TabOrder = 5
      OnClick = BtnDesmarcarClick
    end
    object BtnMarcarTodos: TBitBtn
      Left = 600
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Marcar Todos'
      TabOrder = 6
      OnClick = BtnMarcarTodosClick
    end
    object BtnDesmarcarTodos: TBitBtn
      Left = 600
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Desmarcar Todos'
      TabOrder = 7
      OnClick = BtnDesmarcarTodosClick
    end
    object BtnFechar: TBitBtn
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Faturar'
      TabOrder = 8
      OnClick = BtnFecharClick
    end
    object BtnFaturarMarcadas: TBitBtn
      Left = 352
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Faturar Marcadas'
      TabOrder = 9
    end
  end
  object dsAbastecimentos: TDataSource
    DataSet = cdsAbastecimentos
    Left = 616
    Top = 152
  end
  object cdsAbastecimentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAbastecimentos'
    Left = 648
    Top = 152
  end
  object dspAbastecimentos: TDataSetProvider
    DataSet = qryAbastecimentos
    Left = 680
    Top = 152
  end
  object qryAbastecimentos: TSQLQuery
    DataSource = dsAbastecimentos
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 712
    Top = 152
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 616
    Top = 201
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 648
    Top = 201
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Left = 680
    Top = 201
  end
  object qryAux: TSQLQuery
    DataSource = dsAux
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Con
    Left = 712
    Top = 201
  end
end