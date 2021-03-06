object frmCaoDono: TfrmCaoDono
  Left = 0
  Top = 0
  Caption = 'Cadastrar C'#227'o ao Dono'
  ClientHeight = 424
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPessoa: TDBGrid
    Left = 0
    Top = 0
    Width = 954
    Height = 120
    Align = alTop
    DataSource = dsPessoa
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDDONO'
        ReadOnly = True
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        ReadOnly = True
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  object dbgCao: TDBGrid
    Left = 0
    Top = 120
    Width = 954
    Height = 143
    Align = alClient
    DataSource = dsCao
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCAO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RACA'
        Title.Caption = 'Ra'#231'a'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 263
    Width = 954
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 257
    ExplicitWidth = 185
    object btnIncluir: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnFechar: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object dbgCaoDono: TDBGrid
    Left = 0
    Top = 304
    Width = 954
    Height = 120
    Align = alBottom
    DataSource = dsCaoDono
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome Dono'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_1'
        Title.Caption = 'Nome C'#227'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RACA'
        Title.Caption = 'Ra'#231'a'
        Visible = True
      end>
  end
  object tbPessoa: TFDQuery
    Active = True
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT IDDONO, NOME FROM PESSOA')
    Left = 600
    Top = 16
  end
  object tbCao: TFDQuery
    Active = True
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT IDCAO, NOME, RACA FROM CAO')
    Left = 680
    Top = 16
  end
  object tbCaoDono: TFDQuery
    Active = True
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT P.NOME, C.NOME, C.RACA'
      '  FROM PESSOA P,'
      '       CAO C,'
      '       CAO_PESSOA CP'
      ' WHERE CP.IDDONO = P.IDDONO'
      '   AND CP.IDCAO = C.IDCAO')
    Left = 760
    Top = 16
  end
  object dsPessoa: TDataSource
    DataSet = tbPessoa
    Left = 600
    Top = 72
  end
  object dsCao: TDataSource
    DataSet = tbCao
    Left = 680
    Top = 72
  end
  object dsCaoDono: TDataSource
    DataSet = tbCaoDono
    Left = 760
    Top = 72
  end
end
