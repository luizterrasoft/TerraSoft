object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 440
  Top = 225
  Height = 345
  Width = 546
  object Con: TSQLConnection
    ConnectionName = 'TerraplenSoft'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=database.gdb'
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
    Left = 24
    Top = 24
  end
  object dsGeral: TDataSource
    DataSet = cdsGeral
    Left = 72
    Top = 88
  end
  object cdsGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeral'
    Left = 120
    Top = 88
  end
  object dspGeral: TDataSetProvider
    DataSet = qryGeral
    Left = 168
    Top = 88
  end
  object qryGeral: TSQLQuery
    DataSource = dsGeral
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Con
    Left = 24
    Top = 88
  end
  object ConLicenca: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver220.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=22.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver220.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=22.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'MaxBlobSize=-1'
      'DriverName=MySQL'
      'HostName=terrasoft.mysql.uhserver.com'
      'Database=terrasoft'
      'User_Name=dado1019'
      'Password=terra@soft2015'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Left = 32
    Top = 216
  end
  object qryLicenca: TSQLQuery
    DataSource = dsLicenca
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConLicenca
    Left = 32
    Top = 272
    object qryLicencacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryLicencanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 150
    end
    object qryLicencacnpj: TStringField
      FieldName = 'cnpj'
      Required = True
    end
    object qryLicencaqtdmaquinas: TIntegerField
      FieldName = 'qtdmaquinas'
      Required = True
    end
    object qryLicencavencimento: TDateField
      FieldName = 'vencimento'
      Required = True
    end
  end
  object dsLicenca: TDataSource
    DataSet = cdsLicenca
    Left = 88
    Top = 272
  end
  object cdsLicenca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLicenca'
    Left = 144
    Top = 272
  end
  object dspLicenca: TDataSetProvider
    DataSet = qryLicenca
    Left = 200
    Top = 272
  end
end
