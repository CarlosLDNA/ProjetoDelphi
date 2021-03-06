object frmRelCaodono: TfrmRelCaodono
  Left = 0
  Top = 0
  Caption = 'frmRelCaodono'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object relCaoDono: TfrxReport
    Version = '2021.2.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44405.701015185200000000
    ReportOptions.LastChange = 44405.709353437500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnAfterPrint = relCaoDonoAfterPrint
    Left = 80
    Top = 40
    Datasets = <
      item
        DataSet = rel_CaoDono
        DataSetName = 'DSCaoDono'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de C'#227'es Relacionados aos seus Donos')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = rel_CaoDono
        DataSetName = 'DSCaoDono'
        RowCount = 0
        object DSCaoDonoNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 7.559060000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = rel_CaoDono
          DataSetName = 'DSCaoDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSCaoDono."NOME"]')
        end
        object DSCaoDonoNOME_1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 30.236240000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_1'
          DataSet = rel_CaoDono
          DataSetName = 'DSCaoDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSCaoDono."NOME_1"]')
        end
        object DSCaoDonoRACA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 30.236240000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = 'RACA'
          DataSet = rel_CaoDono
          DataSetName = 'DSCaoDono'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSCaoDono."RACA"]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Dono:')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome/Ra'#231'a:')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 30.236240000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '/')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[TIME]')
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[PAGE#]')
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[TOTALPAGES#]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data/Hora:')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 3.779530000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '/')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 536.693260000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 3.779530000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '/')
        end
      end
    end
  end
  object rel_CaoDono: TfrxDBDataset
    UserName = 'DSCaoDono'
    CloseDataSource = False
    DataSet = tbCaoDono
    BCDToCurrency = False
    Left = 184
    Top = 48
  end
  object tbCaoDono: TFDQuery
    Active = True
    IndexesActive = False
    Connection = dmPrincipal.Connection
    SQL.Strings = (
      'SELECT P.NOME, C.NOME, C.RACA'
      '  FROM PESSOA P,'
      '       CAO C,'
      '       CAO_PESSOA CP'
      ' WHERE CP.IDDONO = P.IDDONO'
      '   AND CP.IDCAO = C.IDCAO')
    Left = 280
    Top = 40
  end
end
