object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 561
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 542
    Width = 1008
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 80
      end
      item
        Width = 35
      end
      item
        Width = 35
      end
      item
        Width = 35
      end
      item
        Width = 50
      end>
  end
  object mmPrincipal: TMainMenu
    Left = 24
    Top = 24
    object CadastrarPessoa1: TMenuItem
      Caption = 'Cadastro'
      object Pessoa: TMenuItem
        Caption = 'Pessoa'
        Hint = 'Cadastrar dono do C'#227'o'
        ShortCut = 16464
        OnClick = PessoaClick
      end
      object Caes: TMenuItem
        Caption = 'C'#227'es'
        Hint = 'Cadatrar C'#227'es'
        ShortCut = 16451
        OnClick = CaesClick
      end
      object CaesDonos: TMenuItem
        Caption = 'C'#227'es e seus Donos'
        Hint = 'Cadastrar C'#227'es e seus Donos'
        OnClick = CaesDonosClick
      end
      object Relatrio1: TMenuItem
        Caption = 'Relat'#243'rio'
        OnClick = Relatrio1Click
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = '&Sair'
        ShortCut = 16467
        OnClick = Sair1Click
      end
    end
  end
  object tStatus: TTimer
    OnTimer = tStatusTimer
    Left = 104
    Top = 32
  end
  object tStatusDataHora: TTimer
    OnTimer = tStatusDataHoraTimer
    Left = 184
    Top = 32
  end
end
