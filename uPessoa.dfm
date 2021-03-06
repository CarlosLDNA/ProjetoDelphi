object frmPessoa: TfrmPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro Pessoa'
  ClientHeight = 424
  ClientWidth = 653
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
  object pgPessoa: TPageControl
    Left = 0
    Top = 0
    Width = 653
    Height = 424
    ActivePage = tbConsulta
    Align = alClient
    TabOrder = 0
    object tbConsulta: TTabSheet
      Caption = 'Consulta'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 645
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 264
        ExplicitTop = 32
        ExplicitWidth = 185
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
        Width = 645
        Height = 314
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 256
        ExplicitTop = 96
        ExplicitWidth = 185
        ExplicitHeight = 41
        object dbPessoa: TDBGrid
          Left = 1
          Top = 1
          Width = 643
          Height = 312
          Align = alClient
          DataSource = dsPessoa
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
              FieldName = 'IDDONO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 500
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 355
        Width = 645
        Height = 41
        Align = alBottom
        TabOrder = 2
        ExplicitLeft = 216
        ExplicitTop = 184
        ExplicitWidth = 185
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
        Width = 645
        Height = 355
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 1
        object lbNome: TLabel
          Left = 8
          Top = 8
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object dbeNome: TDBEdit
          Left = 8
          Top = 27
          Width = 609
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = dsPessoa
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 355
        Width = 645
        Height = 41
        Align = alBottom
        TabOrder = 1
        ExplicitLeft = 168
        ExplicitTop = 216
        ExplicitWidth = 185
        object btnCancelar: TButton
          Left = 1
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Canelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnSalvar: TButton
          Left = 82
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
  object dsPessoa: TDataSource
    DataSet = tbPessoa
    Left = 560
    Top = 24
  end
  object tbPessoa: TFDQuery
    Indexes = <
      item
        Fields = 'IDDONO;NOME'
      end>
    DetailFields = 'IDDONO;NOME'
    Connection = dmPrincipal.Connection
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    SQL.Strings = (
      'SELECT IDDONO, NOME FROM PESSOA')
    Left = 524
    Top = 25
  end
end
