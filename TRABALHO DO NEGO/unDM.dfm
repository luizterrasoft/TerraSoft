object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 561
  Top = 248
  Height = 203
  Width = 292
  object Conexao: TSQLConnection
    ConnectionName = 'Biblioteca'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=D:\TRABALHO DO NEGO\DADOS\BIBLIOTECA.FDB'
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
    Left = 32
    Top = 8
  end
end