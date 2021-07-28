object frmCao: TfrmCao
  Left = 0
  Top = 0
  Caption = 'Cadastro de C'#227'o'
  ClientHeight = 374
  ClientWidth = 823
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
  object pgCao: TPageControl
    Left = 0
    Top = 0
    Width = 823
    Height = 374
    ActivePage = tbConsulta
    Align = alClient
    TabOrder = 0
    object tbConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 815
        Height = 41
        Align = alTop
        TabOrder = 0
        object lbProcurar: TLabel
          Left = 8
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Procurar:'
        end
        object edtProcurar: TEdit
          Left = 59
          Top = 9
          Width = 494
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = edtProcurarChange
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 41
        Width = 815
        Height = 264
        Align = alClient
        TabOrder = 1
        object dbgCao: TDBGrid
          Left = 1
          Top = 1
          Width = 813
          Height = 262
          Align = alClient
          DataSource = dsCao
          ReadOnly = True
          TabOrder = 0
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
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RACA'
              Title.Caption = 'Ra'#231'a'
              Width = 300
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 305
        Width = 815
        Height = 41
        Align = alBottom
        TabOrder = 2
        object btIncluir: TButton
          Left = 1
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Incluir'
          TabOrder = 0
          OnClick = btIncluirClick
        end
        object btnEditar: TButton
          Left = 82
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnExluir: TButton
          Left = 163
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExluirClick
        end
        object btnFechar: TButton
          Left = 244
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Fechar'
          TabOrder = 3
          OnClick = btnFecharClick
        end
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 815
        Height = 305
        Align = alClient
        TabOrder = 0
        object lbNome: TLabel
          Left = 8
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lbRaca: TLabel
          Left = 8
          Top = 62
          Width = 28
          Height = 13
          Caption = 'Ra'#231'a:'
        end
        object dbeNome: TDBEdit
          Left = 8
          Top = 27
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dsCao
          TabOrder = 0
        end
        object dbeRaca: TDBEdit
          Left = 8
          Top = 81
          Width = 441
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RACA'
          DataSource = dsCao
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 305
        Width = 815
        Height = 41
        Align = alBottom
        TabOrder = 1
        object btnCancelar: TButton
          Left = 2
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Canelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnSalvar: TButton
          Left = 83
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = btnSalvarClick
        end
      end
    end
  end
  object tbCao: TFDQuery
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT IDCAO, NOME, RACA FROM CAO')
    Left = 588
    Top = 24
  end
  object dsCao: TDataSource
    DataSet = tbCao
    Left = 668
    Top = 25
  end
end
