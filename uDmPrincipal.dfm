object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 454
  Width = 651
  object Connection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Database=D:\Projeto_Teste\DataBase\DOGPEOPLES.FDB'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=IB')
    FetchOptions.AssignedValues = [evCursorKind]
    FetchOptions.CursorKind = ckDefault
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftAutoInc
    LoginPrompt = False
    Left = 480
    Top = 32
  end
end
