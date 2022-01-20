inherited frmImpAniversariantes: TfrmImpAniversariantes
  BorderIcons = [biSystemMenu]
  Caption = 'Impress'#227'o - Aniversariantes'
  ClientHeight = 142
  ClientWidth = 346
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 352
  ExplicitHeight = 171
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 8
    Width = 302
    Height = 14
    Caption = 'Informe o m'#234's que deseja consultar os aniversariantes'
    Font.Charset = ANSI_CHARSET
    Font.Color = 16744448
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 102
    Width = 346
    Height = 40
    Align = alBottom
    TabOrder = 1
    object btnImprimir: TBitBtn
      Left = 120
      Top = 6
      Width = 106
      Height = 30
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000003F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF9F9F9F3F3F3F3F3F3F1F1F
        1F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000001F1F1F3F3F3F3F
        3F3F9F9F9FFFFFFF0000FFFFFF7F7F7F000000000000000000000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000007F7F7FFFFFFF
        0000FFFFFF7F7F7F0000000000000000000000007F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F0000000000000000000000007F7F7FFFFFFF0000FFFFFF7F7F7F
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000007F7F7FFFFFFF0000FFFFFF8080800000000000000000
        00000000000000000000000000000000000000000000000000616161DCDCDC00
        0000808080FFFFFF0000FFFFFFA7A7A700000000000000000000000000000000
        0000000000000000000000000000000000242424616161000000A8A8A8FFFFFF
        0000FFFFFFFDFDFD6A6A6A090909000000000000000000000000000000000000
        0000000000000000000000000808086A6A6AFDFDFDFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F
        7F0000000000000000000000000000000000000000000000007F7F7FFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000000000
        00000000000000000000000000000000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      ParentFont = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object gpbDataFim: TGroupBox
    Left = 89
    Top = 38
    Width = 168
    Height = 46
    Caption = 'M'#234's do anivers'#225'rio'
    TabOrder = 0
    object cbbMes: TComboBox
      Left = 12
      Top = 17
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
  end
  object qryConsAniversariantes: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IN_DT_MES'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNAANIVERSARIANTES.P_OU_CD_CLIENTE,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_NOME,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DT_NASCIMENTO,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_LOGRADOURO,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_NR_NUMERO,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_COMPLEMENTO,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_BAIRRO,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_NR_CEP,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_CD_UF,'
      
        '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_NR_TELEFONERESIDENCIA' +
        'L,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_NR_TELEFONECOMERCIAL,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_NR_CELULAR,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_EMAIL,'
      '       STRDPRC_RETORNAANIVERSARIANTES.P_OU_DS_MUNICIPIO'
      'FROM STRDPRC_RETORNAANIVERSARIANTES(:P_IN_DT_MES)')
    Left = 24
    Top = 109
  end
  object frxReport: TfrxReport
    Version = '5.5.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41033.583952754630000000
    ReportOptions.LastChange = 41093.580334884260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure PageRelatorioOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      ''
      '    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 54
    Top = 109
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'cdsDados'
      end>
    Variables = <
      item
        Name = ' Aon'
        Value = ''
      end
      item
        Name = 'MesAno'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object PageRelatorio: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPictureVisible = False
      OnBeforePrint = 'PageRelatorioOnBeforePrint'
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 9.118120000000000000
          Top = 7.559060000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Aniversariantes')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 44.795300000000000000
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 143.622140000000000000
          Top = 7.559060000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[MesAno]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 599.386210000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data:')
        end
        object Memo15: TfrxMemoView
          Left = 599.386210000000000000
          Top = 20.677180000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Hora:')
        end
        object Date: TfrxMemoView
          Left = 638.740570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Time: TfrxMemoView
          Left = 638.740570000000000000
          Top = 20.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'cdsDados'
        RowCount = 0
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Cliente:')
        end
        object cdsDadosP_OU_DS_NOME: TfrxMemoView
          Left = 78.063080000000000000
          Top = 7.559060000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_NOME'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_NOME"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 487.559370000000000000
          Top = 7.559060000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data de nascimento:')
        end
        object cdsDadosP_OU_DT_NASCIMENTO: TfrxMemoView
          Left = 623.622450000000000000
          Top = 7.559060000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[IIF(<cdsDados."P_OU_DT_NASCIMENTO"> <> 0, <cdsDados."P_OU_DT_NA' +
              'SCIMENTO">, '#39#39')]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.133890000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Endere'#231'o:')
        end
        object cdsDadosP_OU_DS_LOGRADOURO: TfrxMemoView
          Left = 75.590600000000000000
          Top = 30.133890000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_LOGRADOURO'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_LOGRADOURO"]')
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 443.984540000000000000
          Top = 30.133890000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'n'#186)
        end
        object cdsDadosP_OU_NR_NUMERO: TfrxMemoView
          Left = 468.441250000000000000
          Top = 30.133890000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_NR_NUMERO'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_NR_NUMERO"]')
          WordWrap = False
        end
        object cdsDadosP_OU_DS_COMPLEMENTO: TfrxMemoView
          Left = 535.590910000000000000
          Top = 30.133890000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_COMPLEMENTO'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_COMPLEMENTO"]')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 52.590600000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Bairro:')
        end
        object cdsDadosP_OU_DS_BAIRRO: TfrxMemoView
          Left = 56.913420000000000000
          Top = 52.590600000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_BAIRRO'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_BAIRRO"]')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 298.582870000000000000
          Top = 52.590600000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'CEP:')
        end
        object cdsDadosP_OU_NR_CEP: TfrxMemoView
          Left = 337.630180000000000000
          Top = 52.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_NR_CEP'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_NR_CEP"]')
          WordWrap = False
        end
        object cdsDadosP_OU_DS_MUNICIPIO: TfrxMemoView
          Left = 423.307360000000000000
          Top = 52.590600000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_MUNICIPIO'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          HAlign = haRight
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_MUNICIPIO"]')
          WordWrap = False
        end
        object cdsDadosP_OU_CD_UF: TfrxMemoView
          Left = 674.622450000000000000
          Top = 52.385900000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_CD_UF'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_CD_UF"]')
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 665.197280000000000000
          Top = 52.708720000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '-')
        end
        object Memo10: TfrxMemoView
          Left = 8.338590000000000000
          Top = 75.590600000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Tel. Residencial:')
        end
        object cdsDadosP_OU_NR_TELEFONERESIDENCIAL: TfrxMemoView
          Left = 117.165430000000000000
          Top = 75.590600000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_NR_TELEFONERESIDENCIAL'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_NR_TELEFONERESIDENCIAL"]')
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 222.669450000000000000
          Top = 75.590600000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Celular:')
        end
        object cdsDadosP_OU_NR_CELULAR: TfrxMemoView
          Left = 277.716760000000000000
          Top = 75.590600000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_NR_CELULAR'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_NR_CELULAR"]')
        end
        object Memo12: TfrxMemoView
          Left = 386.086890000000000000
          Top = 75.590600000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Email:')
        end
        object cdsDadosP_OU_DS_EMAIL: TfrxMemoView
          Left = 431.220780000000000000
          Top = 75.590600000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DataField = 'P_OU_DS_EMAIL'
          DataSet = frxDBDataset
          DataSetName = 'cdsDados'
          Memo.UTF8W = (
            '[cdsDados."P_OU_DS_EMAIL"]')
          WordWrap = False
        end
        object Line2: TfrxLineView
          Align = baCenter
          Left = 7.559060000000000000
          Top = 104.047310000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 639.149970000000000000
          Top = 2.000000000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Pagina')
        end
        object Page: TfrxMemoView
          Left = 685.976810000000000000
          Top = 1.779530000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page]')
        end
        object Line3: TfrxLineView
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'cdsDados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'P_OU_CD_CLIENTE=P_OU_CD_CLIENTE'
      'P_OU_DS_NOME=P_OU_DS_NOME'
      'P_OU_DT_NASCIMENTO=P_OU_DT_NASCIMENTO'
      'P_OU_DS_LOGRADOURO=P_OU_DS_LOGRADOURO'
      'P_OU_NR_NUMERO=P_OU_NR_NUMERO'
      'P_OU_DS_COMPLEMENTO=P_OU_DS_COMPLEMENTO'
      'P_OU_DS_BAIRRO=P_OU_DS_BAIRRO'
      'P_OU_NR_CEP=P_OU_NR_CEP'
      'P_OU_CD_UF=P_OU_CD_UF'
      'P_OU_NR_TELEFONERESIDENCIAL=P_OU_NR_TELEFONERESIDENCIAL'
      'P_OU_NR_TELEFONECOMERCIAL=P_OU_NR_TELEFONECOMERCIAL'
      'P_OU_NR_CELULAR=P_OU_NR_CELULAR'
      'P_OU_DS_EMAIL=P_OU_DS_EMAIL'
      'P_OU_DS_MUNICIPIO=P_OU_DS_MUNICIPIO')
    DataSet = qryConsAniversariantes
    BCDToCurrency = False
    Left = 85
    Top = 109
  end
  object frxPDFExport: TfrxPDFExport
    FileName = 'relatorio'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Title = 'Impress'#227'o'
    Author = 'Aonsistemas'
    Subject = 'Impress'#227'o - Aniversariantes'
    Creator = 'Aonsistemas'
    Producer = 'Aonsistemas'
    ProtectionFlags = []
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 116
    Top = 109
  end
  object frxMailExport: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    Left = 84
    Top = 77
  end
  object frxXLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = True
    ExportEMF = True
    ExportPictures = False
    AsText = True
    Background = False
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 114
    Top = 77
  end
end
