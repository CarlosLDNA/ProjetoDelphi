object frmFiltroRaca: TfrmFiltroRaca
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de C'#227'e versus Dono '
  ClientHeight = 110
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbRaca: TLabel
    Left = 8
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Selecione a ra'#231'a:'
  end
  object btnImprimir: TButton
    Left = 120
    Top = 77
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = btnImprimirClick
  end
  object dbcFiltro: TDBComboBox
    Left = 8
    Top = 27
    Width = 265
    Height = 21
    DataField = 'RACA'
    DataSource = dsFiltro
    TabOrder = 1
  end
  object tbFiltro: TFDQuery
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT IDCAO, RACA FROM CAO')
    Left = 280
    Top = 8
  end
  object dsFiltro: TDataSource
    DataSet = tbFiltro
    Left = 288
    Top = 64
  end
end
