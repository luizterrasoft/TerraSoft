object frmCadastroBasico: TfrmCadastroBasico
  Left = 425
  Top = 256
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CADASTRO'
  ClientHeight = 248
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 229
    Width = 390
    Height = 19
    Panels = <
      item
        Width = 250
      end>
  end
  object grpBxDados: TGroupBox
    Left = 0
    Top = 40
    Width = 390
    Height = 189
    Align = alClient
    TabOrder = 1
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 390
    Height = 40
    ButtonHeight = 36
    ButtonWidth = 49
    Caption = 'ToolBar'
    Images = listaImagens
    ShowCaptions = True
    TabOrder = 2
    object tlBtnNovo: TToolButton
      Left = 0
      Top = 2
      Hint = 'Inserir um novo registro.'
      Caption = 'Novo'
      ImageIndex = 0
      OnClick = tlBtnNovoClick
    end
    object tlBtnEditar: TToolButton
      Left = 49
      Top = 2
      Hint = 'Editar registro atual.'
      Caption = 'Editar'
      ImageIndex = 1
      OnClick = tlBtnEditarClick
    end
    object tlBtnSalvar: TToolButton
      Left = 98
      Top = 2
      Hint = 'Salvar registro.'
      Caption = 'Salvar'
      ImageIndex = 2
      OnClick = tlBtnSalvarClick
    end
    object tlBtnExcluir: TToolButton
      Left = 147
      Top = 2
      Hint = 'Excluir registro.'
      Caption = 'Excluir'
      ImageIndex = 3
      OnClick = tlBtnExcluirClick
    end
    object tlBtnCancelar: TToolButton
      Left = 196
      Top = 2
      Hint = 'Cancelar a'#231#227'o.'
      Caption = 'Cancelar'
      ImageIndex = 4
      OnClick = tlBtnCancelarClick
    end
    object tlBtnSeparador: TToolButton
      Left = 245
      Top = 2
      Width = 8
      ImageIndex = 5
      Style = tbsSeparator
    end
    object pnlDicas: TPanel
      Left = 253
      Top = 2
      Width = 134
      Height = 36
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        134
        36)
      object lblDicas: TLabel
        Left = 100
        Top = 1
        Width = 33
        Height = 13
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = 'Dicas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
    end
  end
  object listaImagens: TImageList
    Left = 163
    Top = 50
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000319400003194000031940000319400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      FF00005AF700106BE7004A94E7008CBDEF008CBDEF004284D600085ABD000029
      7B00002163000000000000000000000000000000000000000000000000000894
      CE005AC6EF004ABDE70039B5E70029ADE70029ADE7000894CE000894CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      FF00187BFF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFFF00105A
      BD000031940000000000000000000000000000000000000000000894CE006BD6
      F70073CEEF004AADCE0042B5E70029ADE70021ADE70021A5DE0029ADE7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006BFF00006BFF00FFFF
      FF00FFFFFF009CC6FF00085AE7000052E700004AE700085AE700B5D6FF00FFFF
      FF00FFFFFF0000319400002163000000000000000000000000000894CE008CDE
      F7006B7373008C6B6B006B52520039B5DE0031B5E70029ADE70029ADE7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063FF0063ADFF00FFFF
      FF00DEEFFF00005AE7000052E700085AE7000052E700004AE700004ADE00D6E7
      FF00FFFFFF001863BD0000318C000000000000000000000000000894CE008CD6
      E7006B5A5A007B6B63008C6B6B003994AD0039BDEF0031B5E70031B5E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005AADFF00FFFFFF0073B5
      FF000863EF00FFFFFF0073ADF700005AE700085AE70084B5F700E7EFFF00004A
      E7008CBDF700FFFFFF00296BC6000000000000000000000000000894CE00A5EF
      FF00BDE7EF00BDADAD00BDB5B5005A524A004ABDDE0042C6EF0039BDEF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000873FF00B5DEFF00FFFFFF00106B
      F700086BF700BDDEFF00FFFFFF00085AEF00005AE700FFFFFF008CBDF7000052
      E7001063E700FFFFFF007BADE7000039940000000000000000000894CE00A5EF
      FF00C6EFFF007B6B6B00DED6D6006B5A52004AA5BD004ACEF70042C6EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000873FF00FFFFFF00FFFFFF001073
      F700187BF700106BF700217BF700F7FFFF00E7F7FF000863EF00005AE7000052
      E7000052E700FFFFFF00E7EFFF00005AE70000000000000000000894CE00A5EF
      FF00CEF7FF00B5DEEF0073848400E7E7DE0073635A006B736B0052D6F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000107BFF00FFFFFF00FFFFFF00187B
      FF001073FF001073F700106BF700FFFFFF00FFFFFF000863EF00085AEF00005A
      E700005AE700FFFFFF00EFF7FF00005AEF0000000000000000000894CE00A5EF
      FF00CEF7FF00C6EFFF00A5D6E700D6C6C600CEC6C600C6ADAD00634A42000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000187BFF00FFFFFF00FFFFFF00187B
      FF00187BFF009CCEFF00FFFFFF001073F700187BF700FFFFFF007BB5FF000863
      EF000863EF00FFFFFF00B5DEFF00005AF70000000000000000000894CE00A5EF
      FF00CEF7FF00C6EFFF00ADEFFF005A949C00948C84008C7B7B009C8C8400AD9C
      9400A58C8C00B5A59C00735A5200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003994FF00EFF7FF00FFFFFF00298C
      FF00187BFF00FFFFFF00A5CEFF001073FF001073F700C6DEFF00FFFFFF000863
      EF00297BF700FFFFFF0073B5FF00005AF70000000000000000000894CE00A5EF
      FF00CEF7FF00C6EFFF00ADEFFF0063CEE7005A848400EFE7E700736B5A00EFDE
      DE00DECECE00EFE7E7009C8C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094CEFF00FFFFFF00FFFF
      FF0073B5FF001884FF00187BFF00187BFF00187BFF001073FF001073F700BDDE
      FF00FFFFFF0094CEFF000063FF000000000000000000000000000894CE00A5EF
      FF00CEF7FF00C6EFFF00B5EFFF006BE7FF0063BDD600DECECE00E7DEDE00E7DE
      DE00E7DEDE00EFE7E700F7F7F7005A4239000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052A5FF00E7F7FF00FFFF
      FF00FFFFFF001884FF001884FF00187BFF00187BFF00187BFF00187BFF00FFFF
      FF00FFFFFF00107BFF000063FF000000000000000000000000000894CE00ADEF
      FF00D6F7FF00C6F7FF00B5EFFF006BD6EF00526B6300F7EFF700EFE7E700EFE7
      E700F7EFEF00E7E7E700E7E7E700312110000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005AA5FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6E7
      FF00429CFF00006BFF00000000000000000000000000000000000894CE0039AD
      DE005ABDE7007BD6EF007BD6F70063CEEF006394A500F7F7F700F7F7F700E7E7
      DE00CEC6C60039291800DED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007BBD
      FF00D6E7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF001884
      FF00006BFF0000000000000000000000000000000000000000000894CE00C6F7
      FF00C6F7FF00A5EFFF0094EFFF007BEFFF0073EFFF00BDB5AD00F7F7F700C6BD
      BD005239310073635A00E7DEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005AA5FF005AA5FF0063ADFF0052A5FF00298CFF00187BFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000088CCE001094CE001094CE001094CE001094CE0000000000524239005A4A
      4200948C7B007B7363005A4A3900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000003900000039000000390000003900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000003900000039000000390000003900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000319400003194000031940000319400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000003900000039000000390000003900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9C0000009C0000008400182194004A52A5004A52A50010106B00000042000000
      4200000039000000000000000000000000000000000000000000000000000000
      9C0000009C0000008400182194004A52A5004A52A50010106B00000042000000
      4200000039000000000000000000000000000000000000000000000000000063
      FF00005AF700106BE7004A94E7008CBDEF008CBDEF004284D600085ABD000029
      7B00002163000000000000000000000000000000000000000000000000000000
      9C0000009C0000008400182194004A52A5004A52A50010106B00000042000000
      4200000039000000000000000000000000000000000000000000000000000000
      A5000008AD00BDBDEF00FFFFFF00FFFFFF00FFFFFF00F7F7FF009CA5CE000000
      4200000031000000000000000000000000000000000000000000000000000000
      A5000008AD00BDBDEF00FFFFFF00FFFFFF00FFFFFF00F7F7FF009CA5CE000000
      420000003100000000000000000000000000000000000000000000000000005A
      FF00187BFF00F7F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7EFFF00105A
      BD00003194000000000000000000000000000000000000000000000000000000
      A5000008AD00BDBDEF00FFFFFF00FFFFFF00FFFFFF00F7F7FF009CA5CE000000
      420000003100000000000000000000000000000000000008C6000000BD00FFFF
      FF00FFFFFF00FFFFFF008C94DE0029299C0029299C00ADB5E700FFFFFF00FFFF
      FF00D6D6EF000000310000004A0000000000000000000008C6000000BD00FFFF
      FF00FFFFFF00ADADE7002931A50000006B0000006B0031319C00ADADDE00FFFF
      FF00D6D6EF000000310000004A000000000000000000006BFF00006BFF00FFFF
      FF00FFFFFF00DEEFFF0073B5FF002984EF00217BEF0084B5F700EFF7FF00FFFF
      FF00FFFFFF00003194000021630000000000000000000008C6000000BD00FFFF
      FF00FFFFFF00FFFFFF008C94DE0029299C0029299C00ADB5E700FFFFFF00FFFF
      FF00D6D6EF000000310000004A0000000000000000000000C6001829D600FFFF
      FF00FFFFFF001821AD000000840000006B000000630000006B0031319C00FFFF
      FF00FFFFFF0000004A000000420000000000000000000000C6001829D600FFFF
      FF00FFFFFF0000008C0000007B000000730000006B000000630000006B00FFFF
      FF00FFFFFF0000004A000000420000000000000000000063FF0063ADFF00FFFF
      FF00FFFFFF00086BFF000052F700B5D6FF001073EF000052E700106BE700FFFF
      FF00FFFFFF001863BD0000318C0000000000000000000000C6001829D600FFFF
      FF00FFFFFF001821AD0000008C0000008C0000007B0000007B0031319C00FFFF
      FF00FFFFFF0000004A000000420000000000000000002131DE00FFFFFF00E7E7
      F7000818C6000000AD0000009400FFFFFF00FFFFFF0000006B0000006B001818
      9400F7F7FF00CECEE7000000520000000000000000002131DE00FFFFFF009CA5
      EF000008B5000000A500000094000000840000007B000000730000006B000000
      6B00ADADDE00CECEE7000000520000000000000000005AADFF00FFFFFF00B5DE
      FF00006BFF003994FF00EFF7FF00FFFFFF00BDDEFF00005AE700005AE7000863
      E700D6E7FF00FFFFFF00296BC60000000000000000002131DE00FFFFFF00E7E7
      F7000818C6000000AD000000A50000089C0008088C0000007B00000073001818
      9400F7F7FF00CECEE70000005200000000000008EF00637BF700FFFFFF004A63
      E7000000C6000000B5000000A500FFFFFF00FFFFFF0000007300000073000000
      6B007B7BC600FFFFFF0031318400000052000008EF00637BF700FFFFFF001829
      DE000008C6000000AD000000A5000000940000008C0000007B00000073000000
      6B0021219400FFFFFF0031318400000052000873FF00B5DEFF00FFFFFF004294
      FF000063FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00005AEF00005AE700004A
      DE00529CF700FFFFFF007BADE700003994000008EF00637BF700FFFFFF004A63
      E7000000C6000000B5000000AD0000089C0008088C0000007300000073000000
      6B007B7BC600FFFFFF0031318400000052000008FF00E7EFFF00FFFFFF000010
      EF000008E700EFEFFF00E7E7FF00FFFFFF00FFFFFF00E7E7F700E7E7F7000000
      730000007B00FFFFFF00A5A5DE00000042000008FF00E7EFFF00FFFFFF000008
      EF000008E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CA5DE000000
      7B0000007300FFFFFF00A5A5DE00000042000873FF00FFFFFF00FFFFFF00107B
      FF00C6DEFF00F7FFFF0063ADFF00006BFF00D6E7FF00006BFF00005AFF00005A
      EF00005AE700FFFFFF00E7EFFF00005AE7000008FF00E7EFFF00FFFFFF000010
      EF000008E700E7EFFF00D6D6FF00CECEEF00C6C6EF00DEDEF700E7E7F7000000
      730000007B00FFFFFF00A5A5DE00000042000010FF00F7F7FF00FFFFFF000010
      FF000008EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      7B0000008400FFFFFF00ADB5E70000007B000010FF00F7F7FF00FFFFFF000010
      F7000008EF009CADF700FFFFFF00FFFFFF00FFFFFF00BDC6EF000008A5000000
      840000007B00FFFFFF00ADB5E70000007B00107BFF00FFFFFF00FFFFFF00107B
      FF00318CFF004A9CFF00006BFF00006BFF004294FF003994FF00005AFF00005A
      F700005AEF00FFFFFF00EFF7FF00005AEF000010FF00F7F7FF00FFFFFF000010
      FF000008EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      7B0000008400FFFFFF00ADB5E70000007B001839FF00E7EFFF00FFFFFF000821
      FF000008FF000010F7000008E700FFFFFF00FFFFFF000000B5000000AD000000
      94002129B500FFFFFF00737BD600000084001839FF00E7EFFF00FFFFFF000018
      FF000010FF000010F7001839F700FFFFFF00FFFFFF000008BD000000B5000000
      A5000810A500FFFFFF00737BD60000008400187BFF00FFFFFF00FFFFFF002184
      FF00187BFF00187BFF00107BFF001073FF00086BFF00D6EFFF002184FF000063
      FF00107BFF00FFFFFF00B5DEFF00005AF7001839FF00E7EFFF00FFFFFF000821
      FF000008FF000010F7000008E7000810C6000810C6000000B5000000AD000000
      94002129B500FFFFFF00737BD600000084000010FF00CEDEFF00FFFFFF00637B
      FF000008FF000010FF000008F700FFFFFF00FFFFFF000000C6000000BD000000
      A5008C94DE00FFFFFF002931C600000000000010FF00CEDEFF00FFFFFF004263
      FF000010FF000010FF000010F700F7F7FF00425AEF000008CE000008C6000000
      AD00636BCE00FFFFFF002931C600000000003994FF00EFF7FF00FFFFFF005AAD
      FF00107BFF001884FF00187BFF00107BFF001073FF0052A5FF0084BDFF00005A
      FF006BADFF00FFFFFF0073B5FF00005AF7000010FF00CEDEFF00FFFFFF00637B
      FF000008FF000010FF000008F7000018E7000000CE000000BD000000BD000000
      A5008C94DE00FFFFFF002931C60000000000000000006B84FF00FFFFFF00FFFF
      FF00CED6FF000008FF000008FF000018FF000010F7000008DE000000CE00EFEF
      FF00FFFFFF004252CE0000009C0000000000000000006B84FF00FFFFFF00FFFF
      FF00CED6FF000010FF000010FF000010FF000010F7000008EF000008DE00EFEF
      FF00FFFFFF004252CE0000009C00000000000000000094CEFF00FFFFFF00FFFF
      FF00ADD6FF00107BFF00187BFF00187BFF00187BFF000873FF000873FF00BDDE
      FF00FFFFFF0094CEFF000063FF0000000000000000006B84FF00FFFFFF00FFFF
      FF00CED6FF000008FF000010FF000018FF000010E7000008DE000000CE00EFEF
      FF00FFFFFF004252CE0000009C0000000000000000003152FF00CEDEFF00FFFF
      FF00FFFFFF003952FF000010FF000008FF000008FF000018EF00526BEF00FFFF
      FF00FFFFFF000008AD000000A50000000000000000003152FF00CEDEFF00FFFF
      FF00FFFFFF002942FF000010FF000010FF000010FF000010F7003952EF00FFFF
      FF00FFFFFF000008AD000000A500000000000000000052A5FF00E7F7FF00FFFF
      FF00FFFFFF004294FF00187BFF00107BFF00107BFF00107BFF00429CFF00FFFF
      FF00FFFFFF00107BFF000063FF0000000000000000003152FF00CEDEFF00FFFF
      FF00FFFFFF00395AFF000018FF000008FF000008FF000018EF00526BEF00FFFF
      FF00FFFFFF000008AD000000A5000000000000000000000000004263FF00EFF7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094A5
      F7000810CE0000000000000000000000000000000000000000004263FF00EFF7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094A5
      F7000810CE0000000000000000000000000000000000000000005AA5FF00F7FF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6E7
      FF00429CFF00006BFF00000000000000000000000000000000004263FF00EFF7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094A5
      F7000810CE000000000000000000000000000000000000000000000000005273
      FF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5FF000008
      D6000000C6000000000000000000000000000000000000000000000000005273
      FF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5FF000008
      D6000000C6000000000000000000000000000000000000000000000000007BBD
      FF00D6E7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F7FF001884
      FF00006BFF000000000000000000000000000000000000000000000000005273
      FF00B5C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5FF000008
      D6000000C6000000000000000000000000000000000000000000000000000000
      000000000000526BFF003152FF00395AFF00294AFF001029F7001029EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000526BFF003152FF00395AFF00294AFF001029F7001029EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005AA5FF005AA5FF0063ADFF0052A5FF00298CFF00187BFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000526BFF003152FF00395AFF00294AFF001029F7001029EF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC3FFFFF00000000E007E01F00000000
      E007C01F000000008001C01F000000008001C01F000000008001C01F00000000
      0000C01F000000000000C01F000000000000C01F000000000000C00100000000
      0000C001000000008001C000000000008001C00000000000C003C00100000000
      E007C00100000000F81FF04100000000FC3FFC3FFC3FFC3FE007E007E007E007
      E007E007E007E007800180018001800180018001800180018001800180018001
      0000000000000000000000000000000000000000000000000000000000000000
      000100010000000180018001800180018001800180018001C007C007C003C007
      E007E007E007E007F81FF81FF81FF81F00000000000000000000000000000000
      000000000000}
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 191
    Top = 50
  end
  object zQryDados: TZQuery
    Connection = DM.ZConnection
    SQL.Strings = (
      'SELECT * '
      'FROM estado '
      'WHERE 1=2'
      'ORDER BY sigla')
    Params = <>
    Left = 228
    Top = 46
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 315
    Top = 46
  end
  object dspDados: TDataSetProvider
    DataSet = zQryDados
    Left = 257
    Top = 46
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDados'
    Left = 287
    Top = 46
  end
end
