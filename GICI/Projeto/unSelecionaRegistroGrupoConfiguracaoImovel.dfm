inherited frmSelecionaRegistroGrupoConfiguracaoImovel: TfrmSelecionaRegistroGrupoConfiguracaoImovel
  Caption = 'SELECIONAR GRUPO DE CONFIGURA'#199#195'O DE IM'#211'VEL'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGrdDados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 473
        Visible = True
      end>
  end
  inherited pnlTopo: TPanel
    inherited grpBxPesquisar: TGroupBox
      inherited plsEdValorPesquisar: TPlsEdit
        OnChange = plsEdValorPesquisarChange
      end
      inherited plsCbBxCampoPesquisar: TPlsComboBox
        Items.Strings = (
          'C'#243'digo'
          'Nome')
      end
    end
  end
  inherited zqrySelecionarRegistro: TZQuery
    SQL.Strings = (
      
        'SELECT g.codigo, g.nome, CAST(g.codigo AS VARCHAR(10)) AS cc_cod' +
        'igo'
      'FROM grupo_configuracao_imovel g'
      'WHERE 1=2')
    object zqrySelecionarRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object zqrySelecionarRegistroNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object zqrySelecionarRegistroCC_CODIGO: TStringField
      FieldName = 'CC_CODIGO'
      Size = 10
    end
  end
  inherited cdsSelecionarRegistro: TClientDataSet
    AfterScroll = cdsSelecionarRegistroAfterScroll
    object cdsSelecionarRegistroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsSelecionarRegistroNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object cdsSelecionarRegistroCC_CODIGO: TStringField
      FieldName = 'CC_CODIGO'
      Size = 10
    end
  end
end
