inherited frmImpAtendimentos: TfrmImpAtendimentos
  BorderIcons = [biSystemMenu]
  Caption = 'Impress'#227'o - Atendimentos'
  ClientHeight = 149
  ClientWidth = 440
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 446
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  object gpbProfissionais: TGroupBox
    Left = 8
    Top = 6
    Width = 338
    Height = 45
    Caption = 'Profissional'
    TabOrder = 0
    DesignSize = (
      338
      45)
    object dblProfissionais: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 323
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'CD_PROFISSIONAL'
      ListField = 'DS_NOME'
      ListSource = dtsConsProfissionais
      TabOrder = 0
    end
  end
  object gpbPeriodo: TGroupBox
    Left = 348
    Top = 6
    Width = 87
    Height = 45
    Caption = 'Data'
    TabOrder = 1
    object edtDataReferencia: TMaskEdit
      Left = 9
      Top = 16
      Width = 70
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = edtDataReferenciaExit
    end
  end
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 109
    Width = 440
    Height = 40
    Align = alBottom
    TabOrder = 5
    object btnImprimir: TBitBtn
      Left = 167
      Top = 5
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
  object ckbAgendaBranco: TCheckBox
    Left = 12
    Top = 70
    Width = 160
    Height = 19
    Caption = 'Imprimir &agenda em branco'
    TabOrder = 3
    OnClick = ckbAgendaBrancoClick
  end
  object CamposObrigatorios: TValueListEditor
    Left = 8
    Top = 1
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'dblProfissionais=Campo profissional deve ser informado'
      'edtDataReferencia=Campo data deve ser informado')
    TabOrder = 6
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object gpbPeriodoFim: TGroupBox
    Left = 348
    Top = 57
    Width = 87
    Height = 45
    Caption = 'Data'
    TabOrder = 2
    Visible = False
    object edtDataReferenciaFim: TMaskEdit
      Left = 9
      Top = 16
      Width = 70
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = edtDataReferenciaFimExit
    end
  end
  object ckbOcultarHorario: TCheckBox
    Left = 191
    Top = 70
    Width = 125
    Height = 19
    Caption = 'Ocultar hor'#225'rio &vago'
    TabOrder = 4
  end
  object qryConsProfissionais: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_USUARIO'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PROFISSIONAL.CD_PROFISSIONAL,'
      '       CAD_PROFISSIONAL.DS_NOME'
      'FROM CAD_PROFISSIONAL')
    Left = 200
    Top = 7
  end
  object dtsConsProfissionais: TDataSource
    DataSet = qryConsProfissionais
    Left = 200
    Top = 37
  end
  object qryConsAtendimento: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'P_IN_CD_PROFISSIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_IN_ID_DIASEMANA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'P_IN_DT_REFERENCIA'
        ParamType = ptInput
      end>
    FieldsDisplayFormat.Strings = (
      'P_OU_HR_HORARIO=hh:mm')
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNAAGENDA.P_OU_HR_HORARIO,'
      '       STRDPRC_RETORNAAGENDA.P_OU_CD_CLIENTE,'
      '       STRDPRC_RETORNAAGENDA.P_OU_HR_ATENDIMENTO,'
      '       STRDPRC_RETORNAAGENDA.P_OU_DS_NOME,'
      '       CASE'
      
        '         WHEN STRDPRC_RETORNAAGENDA.P_OU_FG_STATUS = '#39'A'#39' THEN '#39'A' +
        'gendado'#39
      
        '         WHEN STRDPRC_RETORNAAGENDA.P_OU_FG_STATUS = '#39'O'#39' THEN '#39'C' +
        'onfirmado'#39
      
        '         WHEN STRDPRC_RETORNAAGENDA.P_OU_FG_STATUS = '#39'F'#39' THEN '#39'F' +
        'altou'#39
      
        '         WHEN STRDPRC_RETORNAAGENDA.P_OU_FG_STATUS = '#39'D'#39' THEN '#39'D' +
        'esmarcou'#39
      
        '         WHEN STRDPRC_RETORNAAGENDA.P_OU_FG_STATUS = '#39'C'#39' THEN '#39'C' +
        'oncluido'#39
      '       END AS P_OU_FG_STATUS,'
      '       CAD_CLIENTE.NR_TELEFONERESIDENCIAL,'
      '       CAD_CLIENTE.NR_TELEFONECOMERCIAL,'
      '       CAD_CLIENTE.NR_CELULAR'
      
        'FROM STRDPRC_RETORNAAGENDA(:P_IN_CD_PROFISSIONAL, :P_IN_ID_DIASE' +
        'MANA, :P_IN_DT_REFERENCIA)'
      
        'LEFT JOIN CAD_CLIENTE ON(CAD_CLIENTE.CD_CLIENTE = STRDPRC_RETORN' +
        'AAGENDA.P_OU_CD_CLIENTE)'
      '/*WHERE STRDPRC_RETORNAAGENDA.P_OU_DS_NOME IS NOT NULL*/'
      'ORDER BY STRDPRC_RETORNAAGENDA.P_OU_HR_HORARIO')
    Left = 140
    Top = 7
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
      'procedure Header1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '                                         '
      '    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 170
    Top = 37
    Datasets = <
      item
        DataSet = frxDBAtendimento
        DataSetName = 'frxDBAtendimento'
      end>
    Variables = <
      item
        Name = ' Aon'
        Value = Null
      end
      item
        Name = 'DataAgenda'
        Value = ''
      end
      item
        Name = 'Profissional'
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
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 9.118120000000000000
          Top = 7.559060000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Atendimentos')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 44.795300000000000000
          Width = 718.110236220472000000
          Color = clBlack
          Frame.Width = 2.000000000000000000
          Diagonal = True
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 179.527675000000000000
          Top = 7.559060000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'd "de" mmmm "de" yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[FormatDateTime('#39'dd "de" mmmm "de" yyyy'#39', StrToDate(<DataAgenda>' +
              '))]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 599.386210000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 599.386210000000000000
          Top = 20.677180000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 638.740570000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 638.740570000000000000
          Top = 20.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Left = 631.590910000000000000
          Top = 4.259740000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Pagina')
        end
        object Page: TfrxMemoView
          Left = 679.417750000000000000
          Top = 4.039270000000000000
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
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 139.842610000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Top = 8.559060000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Profissional]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 1.889763780000000000
          Top = 41.574830000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 51.354360000000000000
          Top = 41.574830000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 172.637910000000000000
          Top = 41.574830000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o/Nome')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 626.520100000000000000
          Top = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 47.244111570000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = frxDBAtendimento
        DataSetName = 'frxDBAtendimento'
        RowCount = 0
        object frxDBAgendaP_OU_HR_HORARIO: TfrxMemoView
          Left = 1.889763780000000000
          Top = 0.377952760000000000
          Width = 41.574830000000000000
          Height = 39.685039370000000000
          DataSet = frxDBAtendimento
          DataSetName = 'frxDBAtendimento'
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBAtendimento."P_OU_HR_HORARIO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBAgendaP_OU_FG_STATUS: TfrxMemoView
          Left = 626.520100000000000000
          Top = 0.377952760000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = frxDBAtendimento
          DataSetName = 'frxDBAtendimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAtendimento."P_OU_FG_STATUS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 51.354360000000000000
          Top = 0.377952760000000000
          Width = 570.709030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              '[IIF(<frxDBAtendimento."P_OU_CD_CLIENTE"> > 0, IntToStr(<frxDBAt' +
              'endimento."P_OU_CD_CLIENTE">) + '#39' - '#39' + <frxDBAtendimento."P_OU_' +
              'DS_NOME">, '#39#39')]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 51.354360000000000000
          Top = 22.692950000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Telefone Resid'#234'ncial:')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 309.685220000000000000
          Top = 22.692950000000000000
          Width = 115.275590550000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Telefone Comercial:')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 562.457020000000000000
          Top = 22.692950000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
          WordWrap = False
        end
        object Line2: TfrxLineView
          Top = 43.149660000000000000
          Width = 7181.102362204724000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBAgendaNR_TELEFONERESIDENCIAL: TfrxMemoView
          Left = 175.637910000000000000
          Top = 22.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBAtendimento
          DataSetName = 'frxDBAtendimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAtendimento."NR_TELEFONERESIDENCIAL"]')
          ParentFont = False
        end
        object frxDBAgendaNR_TELEFONECOMERCIAL: TfrxMemoView
          Left = 428.630180000000000000
          Top = 22.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBAtendimento
          DataSetName = 'frxDBAtendimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAtendimento."NR_TELEFONECOMERCIAL"]')
          ParentFont = False
        end
        object frxDBAgendaNR_CELULAR: TfrxMemoView
          Left = 615.181510000000000000
          Top = 22.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBAtendimento
          DataSetName = 'frxDBAtendimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBAtendimento."NR_CELULAR"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBAtendimento: TfrxDBDataset
    UserName = 'frxDBAtendimento'
    CloseDataSource = False
    FieldAliases.Strings = (
      'P_OU_HR_HORARIO=P_OU_HR_HORARIO'
      'P_OU_CD_CLIENTE=P_OU_CD_CLIENTE'
      'P_OU_HR_ATENDIMENTO=P_OU_HR_ATENDIMENTO'
      'P_OU_DS_NOME=P_OU_DS_NOME'
      'P_OU_FG_STATUS=P_OU_FG_STATUS'
      'NR_TELEFONERESIDENCIAL=NR_TELEFONERESIDENCIAL'
      'NR_TELEFONECOMERCIAL=NR_TELEFONECOMERCIAL'
      'NR_CELULAR=NR_CELULAR')
    DataSet = qryConsAtendimento
    BCDToCurrency = False
    Left = 140
    Top = 37
  end
  object qryAtendimento: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_IN_CD_PROFISSIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_IN_ID_DIASEMANA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_IN_DT_REFERENCIA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNAAGENDA.P_OU_ID_ATENDIMENTO'
      
        'FROM STRDPRC_RETORNAAGENDA(:P_IN_CD_PROFISSIONAL, :P_IN_ID_DIASE' +
        'MANA, :P_IN_DT_REFERENCIA)'
      'WHERE STRDPRC_RETORNAAGENDA.P_OU_ID_ATENDIMENTO IS NOT NULL')
    Left = 229
    Top = 7
  end
  object frxPDFExport: TfrxPDFExport
    FileName = 'Relatorio'
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
    Author = 'Aon Sistemas'
    Subject = 'Impress'#227'o - Relat'#243'rio'
    Creator = 'Aon Sistemas'
    Producer = 'Aon Sistemas'
    ProtectionFlags = []
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 171
    Top = 6
  end
end
