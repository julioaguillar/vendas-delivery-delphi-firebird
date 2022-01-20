inherited frmFluxoCaixa: TfrmFluxoCaixa
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta - Fluxo de caixa'
  ClientHeight = 571
  ClientWidth = 994
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1000
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object gpbPeriodo: TGroupBox
    Left = 6
    Top = 4
    Width = 294
    Height = 45
    Caption = 'Per'#237'odo'
    TabOrder = 0
    object lblA: TLabel
      Left = 89
      Top = 22
      Width = 7
      Height = 13
      Caption = #224
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPeriodoInicio: TMaskEdit
      Left = 10
      Top = 16
      Width = 70
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = edtPeriodoInicioExit
    end
    object edtPeriodoFim: TMaskEdit
      Left = 104
      Top = 16
      Width = 70
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnExit = edtPeriodoFimExit
    end
    object btnBuscar: TBitBtn
      Left = 187
      Top = 11
      Width = 100
      Height = 30
      Caption = '&Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        9E050000424D9E05000000000000360400002800000012000000120000000100
        08000000000068010000120B0000120B00000001000000000000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
        D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
        D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
        E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
        E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
        F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFE0FFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFF6413E0FFFF0000FFFFFFFFFFFFFFFFFFFFFFFF630064FFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFF620063FFFFFFFF0000FFFFFFFFC64A0D0737A6910062FF
        FFFFFFFF0000FFFFFF9F021A6C752F001491FFFFFFFFFFFF0000FFFFDA0647F4
        FFFFFE7A00A6FFFFFFFFFFFF0000FFFF7407E9FFFFFFFFFF2F37FFFFFFFFFFFF
        0000FFFF4637FFFFFFFFFFFF7507FFFFFFFFFFFF0000FFFF4C2BFFFFFFFFFFFF
        6C0DFFFFFFFFFFFF0000FFFF8801CEFFFFFFFFFF1A4AFFFFFFFFFFFF0000FFFF
        FF1721CEFFFFE94702C6FFFFFFFFFFFF0000FFFFFFCA17012B3707069FFFFFFF
        FFFFFFFF0000FFFFFFFFFF884C4674DAFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentFont = False
      TabOrder = 2
      OnClick = btnBuscarClick
    end
  end
  object gpbContasRecebidas: TGroupBox
    Left = 6
    Top = 55
    Width = 487
    Height = 410
    Caption = 'Venda de Produtos/Mercadorias - Contas a Receber'
    TabOrder = 1
    DesignSize = (
      487
      410)
    object dbgContasRecebidas: TDBGrid
      Left = 5
      Top = 15
      Width = 477
      Height = 363
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsLancamentoSaida
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'P_OU_DT_LANCAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_DS_LANCAMENTO'
          Title.Caption = 'Origem Lan'#231'amento'
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_VR_LANCAMENTO'
          Title.Caption = 'Valor Total'
          Width = 100
          Visible = True
        end>
    end
    object pnlDescVenda: TPanel
      Left = 5
      Top = 381
      Width = 477
      Height = 21
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object dbmVenda: TDBMemo
        Left = 0
        Top = 0
        Width = 477
        Height = 21
        Align = alClient
        DataField = 'P_OU_DS_DESCRICAO'
        DataSource = dtsLancamentoSaida
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitTop = 16
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
  object gpbContasPagas: TGroupBox
    Left = 501
    Top = 55
    Width = 487
    Height = 410
    Caption = 'Entrada de Produtos/Mercadorias -  Contas a Pagar'
    TabOrder = 2
    DesignSize = (
      487
      410)
    object dbgContasPagas: TDBGrid
      Left = 5
      Top = 15
      Width = 477
      Height = 363
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dtsLancamentoEntrada
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'P_OU_DT_LANCAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_DS_LANCAMENTO'
          Title.Caption = 'Origem Lan'#231'amento'
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_VR_LANCAMENTO'
          Title.Caption = 'Valor Total'
          Width = 100
          Visible = True
        end>
    end
    object pnlEntrada: TPanel
      Left = 5
      Top = 381
      Width = 477
      Height = 21
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object dbmEntrada: TDBMemo
        Left = 0
        Top = 0
        Width = 477
        Height = 21
        Align = alClient
        DataField = 'P_OU_DS_DESCRICAO'
        DataSource = dtsLancamentoEntrada
        TabOrder = 0
        ExplicitWidth = 493
      end
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 720
    Top = 264
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'edtPeriodoInicio=Campo per'#237'odo in'#237'cio deve ser informado'
      'edtPeriodoFim=Campo per'#237'odo fim deve ser informado')
    TabOrder = 3
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object gpbBotoes: TGroupBox
    Left = 6
    Top = 480
    Width = 162
    Height = 60
    TabOrder = 4
    object btnImprimir: TSpeedButton
      Left = 31
      Top = 15
      Width = 100
      Height = 30
      Caption = '&Imprimir'
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
      OnClick = btnImprimirClick
    end
  end
  object Panel1: TPanel
    Left = 293
    Top = 468
    Width = 200
    Height = 45
    BevelOuter = bvNone
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 5
    object lblTotalRecebido: TLabel
      Left = 0
      Top = 0
      Width = 200
      Height = 19
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor Total Recebido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 35
      ExplicitTop = 4
      ExplicitWidth = 140
    end
    object dbeTotalRecebido: TDBEdit
      Left = 0
      Top = 20
      Width = 200
      Height = 25
      TabStop = False
      Align = alBottom
      DataField = 'VR_TOTALSAIDA'
      DataSource = dtsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 35
      ExplicitTop = 29
      ExplicitWidth = 184
    end
  end
  object Panel2: TPanel
    Left = 788
    Top = 468
    Width = 200
    Height = 45
    BevelOuter = bvNone
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 6
    object lblTotalPago: TLabel
      Left = 0
      Top = 0
      Width = 200
      Height = 19
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor Total Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 111
    end
    object dbeTotalPago: TDBEdit
      Left = 0
      Top = 20
      Width = 200
      Height = 25
      TabStop = False
      Align = alBottom
      DataField = 'VR_TOTALENTRADA'
      DataSource = dtsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitTop = 19
      ExplicitWidth = 184
    end
  end
  object Panel3: TPanel
    Left = 788
    Top = 518
    Width = 200
    Height = 45
    BevelOuter = bvNone
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 7
    object lblTotalLiquido: TLabel
      Left = 0
      Top = 0
      Width = 200
      Height = 19
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Total L'#237'quido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 2
      ExplicitTop = 4
      ExplicitWidth = 89
    end
    object dbeTotalLiquido: TDBEdit
      Left = 0
      Top = 20
      Width = 200
      Height = 25
      TabStop = False
      Align = alBottom
      DataField = 'VR_TOTAL'
      DataSource = dtsTotais
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      ExplicitLeft = 125
      ExplicitTop = 2
      ExplicitWidth = 184
    end
  end
  object qryLancamentoSaida: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'DT_REFERENCIAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_REFERENCIAFIM'
        ParamType = ptInput
      end>
    FieldsDisplayFormat.Strings = (
      'P_OU_DT_LANCAMENTO=dd/MM/yyyy'
      'P_OU_VR_LANCAMENTO=,0.00')
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNAFLUXOCAIXA.P_OU_FG_TIPOLANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DS_LANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DS_DESCRICAO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DT_LANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_VR_LANCAMENTO'
      
        'FROM STRDPRC_RETORNAFLUXOCAIXA('#39'SAIDA'#39', :DT_REFERENCIAINICIO, :D' +
        'T_REFERENCIAFIM)'
      
        'ORDER BY STRDPRC_RETORNAFLUXOCAIXA.P_OU_DT_LANCAMENTO ASC, STRDP' +
        'RC_RETORNAFLUXOCAIXA.P_OU_DS_DESCRICAO')
    Left = 40
    Top = 243
  end
  object qryLancamentoEntrada: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'DT_REFERENCIAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_REFERENCIAFIM'
        ParamType = ptInput
      end>
    FieldsDisplayFormat.Strings = (
      'P_OU_DT_LANCAMENTO=dd/MM/yyyy'
      'P_OU_VR_LANCAMENTO=,0.00')
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNAFLUXOCAIXA.P_OU_FG_TIPOLANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DS_LANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DS_DESCRICAO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_DT_LANCAMENTO,'
      '       STRDPRC_RETORNAFLUXOCAIXA.P_OU_VR_LANCAMENTO'
      
        'FROM STRDPRC_RETORNAFLUXOCAIXA('#39'ENTRADA'#39', :DT_REFERENCIAINICIO, ' +
        ':DT_REFERENCIAFIM)'
      
        'ORDER BY STRDPRC_RETORNAFLUXOCAIXA.P_OU_DT_LANCAMENTO ASC, STRDP' +
        'RC_RETORNAFLUXOCAIXA.P_OU_DS_DESCRICAO')
    Left = 72
    Top = 243
  end
  object dtsLancamentoSaida: TDataSource
    DataSet = qryLancamentoSaida
    Left = 40
    Top = 211
  end
  object dtsLancamentoEntrada: TDataSource
    DataSet = qryLancamentoEntrada
    Left = 72
    Top = 211
  end
  object dtsTotais: TDataSource
    DataSet = qryTotais
    Left = 103
    Top = 211
  end
  object qryTotais: TIBOQuery
    Params = <
      item
        DataType = ftDateTime
        Name = 'DT_REFERENCIAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_REFERENCIAFIM'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    OnCalcFields = qryTotaisCalcFields
    SQL.Strings = (
      
        'SELECT COALESCE( ( SELECT SUM(STRDPRC_RETORNAFLUXOCAIXA.P_OU_VR_' +
        'LANCAMENTO)'
      
        '                   FROM STRDPRC_RETORNAFLUXOCAIXA('#39'SAIDA'#39', :DT_R' +
        'EFERENCIAINICIO, :DT_REFERENCIAFIM) ), 0.0) AS VR_TOTALSAIDA,'
      ''
      
        '       COALESCE( ( SELECT SUM(STRDPRC_RETORNAFLUXOCAIXA.P_OU_VR_' +
        'LANCAMENTO)'
      
        '                   FROM STRDPRC_RETORNAFLUXOCAIXA('#39'ENTRADA'#39', :DT' +
        '_REFERENCIAINICIO, :DT_REFERENCIAFIM) ), 0.0) AS VR_TOTALENTRADA'
      ''
      'FROM RDB$DATABASE')
    Left = 103
    Top = 243
    object qryTotaisVR_TOTALSAIDA: TIBOBCDField
      FieldName = 'VR_TOTALSAIDA'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotaisVR_TOTALENTRADA: TIBOBCDField
      FieldName = 'VR_TOTALENTRADA'
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTotaisVR_TOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VR_TOTAL'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
end
