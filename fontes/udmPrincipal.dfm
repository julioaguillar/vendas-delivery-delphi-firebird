object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 428
  Width = 677
  object IB_Connection: TIB_Connection
    CacheStatementHandles = False
    DefaultTransaction = IB_Transaction
    PasswordStorage = psNotSecure
    SQLDialect = 3
    Params.Strings = (
      'PATH=C:\Aon\Vendas\fdb\AONVENDAS.FDB'
      'CHARACTER SET=WIN1252'
      'USER NAME=SYSDBA'
      'SQL DIALECT=3'
      'SERVER=127.0.0.1/3052'
      'FORCED WRITES=TRUE'
      'RESERVE PAGE SPACE=TRUE'
      'PROTOCOL=TCP/IP'
      'BUFFERS=<default>')
    OnError = IB_ConnectionError
    Left = 56
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object IB_Transaction: TIB_Transaction
    IB_Connection = IB_Connection
    Isolation = tiCommitted
    Left = 56
    Top = 82
  end
  object qryConsVersaoBanco: TIBOQuery
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_CONTROLEVERSAO.NR_VERSAOSISTEMA,'
      '       CAD_CONTROLEVERSAO.NR_BUILDSISTEMA,'
      '       CAD_CONTROLEVERSAO.DT_SISTEMA,'
      '       CAD_CONTROLEVERSAO.NR_VERSAOBANCO,'
      '       CAD_CONTROLEVERSAO.DT_BANCO'
      'FROM CAD_CONTROLEVERSAO')
    Left = 201
    Top = 24
  end
  object ibsAtualizaBancoDados: TIB_Script
    IB_Connection = IB_Connection
    IB_Transaction = IB_Transaction
    Left = 201
    Top = 82
  end
  object qryConsSerial: TIBOQuery
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_LIBERACAOSISTEMA.NR_SERIAL,'
      '       CAD_LIBERACAOSISTEMA.FG_STATUS,'
      '       CAD_LIBERACAOSISTEMA.DS_EMAIL,'
      '       CAD_LIBERACAOSISTEMA.DS_CLIENTE'
      'FROM CAD_LIBERACAOSISTEMA')
    Left = 334
    Top = 24
  end
  object qryStatusSerial: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'FG_STATUS'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'UPDATE CAD_LIBERACAOSISTEMA'
      'SET FG_STATUS = :FG_STATUS')
    Left = 334
    Top = 82
  end
  object qryNumProfissional: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'NR_LIMITEUSUARIO'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'UPDATE CAD_LIMITEUSUARIO'
      'SET NR_LIMITEUSUARIO = :NR_LIMITEUSUARIO')
    Left = 452
    Top = 24
  end
  object qryLog: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ORIGEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'OPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CAMPO'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      
        'INSERT INTO LOG(ID, USUARIO, DATA, HORA, ORIGEM, OPERACAO, DESCR' +
        'ICAO, CAMPO)'
      
        'VALUES((SELECT COALESCE(MAX(LOG.ID)+1,1) FROM LOG), :USUARIO, ( ' +
        'SELECT CURRENT_DATE FROM RDB$DATABASE ), ( SELECT CURRENT_TIME F' +
        'ROM RDB$DATABASE ), :ORIGEM, :OPERACAO, :DESCRICAO, :CAMPO)')
    Left = 452
    Top = 82
  end
  object IB_ConnectionInfo: TIB_ConnectionInfo
    IB_Connection = IB_Connection
    Left = 56
    Top = 150
  end
  object iboConfigService: TIBOConfigService
    TraceFlags = []
    Left = 201
    Top = 150
  end
  object IBOBackupService: TIBOBackupService
    TraceFlags = []
    BlockingFactor = 0
    Options = []
    Left = 56
    Top = 211
  end
  object IBORestoreService: TIBORestoreService
    TraceFlags = []
    PageBuffers = 0
    Left = 201
    Top = 211
  end
  object qryConsCEP: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_CEP'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_ENDERECO.CD_ENDERECO,'
      '       CAD_ENDERECO.CD_UF,'
      '       CAD_ENDERECO.DS_TIPOLOGRADOURO,'
      '       CAD_ENDERECO.DS_LOGRADOURO,'
      '       CAD_ENDERECO.DS_COMPLEMENTO,'
      '       CAD_ENDERECO.DS_CEP,'
      '       CAD_ENDERECO.DS_BAIRRO,'
      '       CAD_ENDERECO.DS_MUNICIPIO'
      'FROM CAD_ENDERECO'
      'WHERE CAD_ENDERECO.DS_CEP = :DS_CEP')
    Left = 334
    Top = 150
  end
  object qryConsMunicipio: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_MUNICIPIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_UF'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_MUNICIPIO.CD_MUNICIPIO,'
      '       CAD_MUNICIPIO.DS_MUNICIPIO'
      'FROM CAD_MUNICIPIO'
      'WHERE CAD_MUNICIPIO.DS_MUNICIPIO = :DS_MUNICIPIO AND'
      '      CAD_MUNICIPIO.CD_UF = :CD_UF')
    Left = 452
    Top = 150
  end
  object cdsDadosCupom: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Fant'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IEIM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Extrato'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DescCupom'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CPFConsumidor'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SubTotal'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Desconto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acrescimo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ValorTotal'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Troco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Destinatario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Observacao'
        DataType = ftBlob
        Size = 80
      end
      item
        Name = 'NumeroSAT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DataHora'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QRCode'
        DataType = ftBlob
        Size = 80
      end
      item
        Name = 'ObservacaoDelivery'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'NomeConsumidor'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'EnderecoConsumidor'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 278
    Data = {
      B90200009619E0BD010000001800000015000000000003000000B9020446616E
      740100490000000100055749445448020002003200044E6F6D65010049000000
      010005574944544802000200320008456E64657265636F010049000000010005
      574944544802000200FA0004434E504A01004900000001000557494454480200
      02006400044945494D0100490000000100055749445448020002006400074578
      747261746F010049000000010005574944544802000200640009446573634375
      706F6D01004900000001000557494454480200020064000D435046436F6E7375
      6D69646F72010049000000010005574944544802000200640008537562546F74
      616C010049000000010005574944544802000200320008446573636F6E746F01
      0049000000010005574944544802000200320009416372657363696D6F010049
      00000001000557494454480200020032000A56616C6F72546F74616C01004900
      000001000557494454480200020032000554726F636F01004900000001000557
      494454480200020032000C44657374696E61746172696F010049000000010005
      57494454480200020032000A4F62736572766163616F04004B00000002000753
      55425459504502004900070042696E6172790005574944544802000200500009
      4E756D65726F5341540100490000000100055749445448020002003200084461
      7461486F72610100490000000100055749445448020002003200065152436F64
      6504004B0000000200075355425459504502004900070042696E617279000557
      49445448020002005000124F62736572766163616F44656C6976657279010049
      000000010005574944544802000200FA000E4E6F6D65436F6E73756D69646F72
      010049000000010005574944544802000200460012456E64657265636F436F6E
      73756D69646F72010049000000010005574944544802000200FA000000}
    object cdsDadosCupomFant: TStringField
      FieldName = 'Fant'
      Size = 50
    end
    object cdsDadosCupomNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object cdsDadosCupomEndereco: TStringField
      FieldName = 'Endereco'
      Size = 250
    end
    object cdsDadosCupomCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 100
    end
    object cdsDadosCupomIEIM: TStringField
      FieldName = 'IEIM'
      Size = 100
    end
    object cdsDadosCupomExtrato: TStringField
      FieldName = 'Extrato'
      Size = 100
    end
    object cdsDadosCupomDescCupom: TStringField
      FieldName = 'DescCupom'
      Size = 100
    end
    object cdsDadosCupomCPFConsumidor: TStringField
      FieldName = 'CPFConsumidor'
      Size = 100
    end
    object cdsDadosCupomSubTotal: TStringField
      FieldName = 'SubTotal'
      Size = 50
    end
    object cdsDadosCupomDesconto: TStringField
      FieldName = 'Desconto'
      Size = 50
    end
    object cdsDadosCupomAcrescimo: TStringField
      FieldName = 'Acrescimo'
      Size = 50
    end
    object cdsDadosCupomValorTotal: TStringField
      FieldName = 'ValorTotal'
      Size = 50
    end
    object cdsDadosCupomTroco: TStringField
      FieldName = 'Troco'
      Size = 50
    end
    object cdsDadosCupomDestinatario: TStringField
      FieldName = 'Destinatario'
      Size = 50
    end
    object cdsDadosCupomObservacao: TBlobField
      FieldName = 'Observacao'
      Size = 80
    end
    object cdsDadosCupomNumeroSAT: TStringField
      FieldName = 'NumeroSAT'
      Size = 50
    end
    object cdsDadosCupomDataHora: TStringField
      FieldName = 'DataHora'
      Size = 50
    end
    object cdsDadosCupomQRCode: TBlobField
      FieldName = 'QRCode'
      Size = 80
    end
    object cdsDadosCupomObservacaoDelivery: TStringField
      FieldName = 'ObservacaoDelivery'
      Size = 250
    end
    object cdsDadosCupomNomeConsumidor: TStringField
      FieldName = 'NomeConsumidor'
      Size = 70
    end
    object cdsDadosCupomEnderecoConsumidor: TStringField
      FieldName = 'EnderecoConsumidor'
      Size = 250
    end
  end
  object cdsItensCupom: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'CodItem'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DescItem'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Quantidade'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DescQtde'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ValorUnitario'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ValorTotal'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Desconto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LiquidoDesc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Acrescimo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LiquidoAcres'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 201
    Top = 278
    Data = {
      590100009619E0BD01000000180000000B000000000003000000590104497465
      6D040001000000000007436F644974656D010049000000010005574944544802
      000200320008446573634974656D010049000000010005574944544802000200
      64000A5175616E74696461646501004900000001000557494454480200020032
      0008446573635174646501004900000001000557494454480200020032000D56
      616C6F72556E69746172696F0100490000000100055749445448020002003200
      0A56616C6F72546F74616C010049000000010005574944544802000200320008
      446573636F6E746F01004900000001000557494454480200020032000B4C6971
      7569646F44657363010049000000010005574944544802000200320009416372
      657363696D6F01004900000001000557494454480200020032000C4C69717569
      646F416372657301004900000001000557494454480200020032000000}
    object cdsItensCupomItem: TIntegerField
      FieldName = 'Item'
    end
    object cdsItensCupomCodItem: TStringField
      FieldName = 'CodItem'
      Size = 50
    end
    object cdsItensCupomDescItem: TStringField
      FieldName = 'DescItem'
      Size = 100
    end
    object cdsItensCupomQuantidade: TStringField
      FieldName = 'Quantidade'
      Size = 50
    end
    object cdsItensCupomDescQtde: TStringField
      FieldName = 'DescQtde'
      Size = 50
    end
    object cdsItensCupomValorUnitario: TStringField
      FieldName = 'ValorUnitario'
      Size = 50
    end
    object cdsItensCupomValorTotal: TStringField
      FieldName = 'ValorTotal'
      Size = 50
    end
    object cdsItensCupomDesconto: TStringField
      FieldName = 'Desconto'
      Size = 50
    end
    object cdsItensCupomLiquidoDesc: TStringField
      FieldName = 'LiquidoDesc'
      Size = 50
    end
    object cdsItensCupomAcrescimo: TStringField
      FieldName = 'Acrescimo'
      Size = 50
    end
    object cdsItensCupomLiquidoAcres: TStringField
      FieldName = 'LiquidoAcres'
      Size = 50
    end
  end
  object cdsPagamentos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Valor'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 334
    Top = 278
    Data = {
      520000009619E0BD010000001800000002000000000003000000520009446573
      63726963616F010049000000010005574944544802000200C8000556616C6F72
      01004900000001000557494454480200020032000000}
    object cdsPagamentosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object cdsPagamentosValor: TStringField
      FieldName = 'Valor'
      Size = 50
    end
  end
  object frxDBPagamentos: TfrxDBDataset
    UserName = 'frxDBPagamentos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Descricao=Descricao'
      'Valor=Valor')
    DataSet = cdsPagamentos
    BCDToCurrency = False
    Left = 334
    Top = 349
  end
  object frxDBDadosCupom: TfrxDBDataset
    UserName = 'frxDBDadosCupom'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Fant=Fant'
      'Nome=Nome'
      'Endereco=Endereco'
      'CNPJ=CNPJ'
      'IEIM=IEIM'
      'Extrato=Extrato'
      'DescCupom=DescCupom'
      'CPFConsumidor=CPFConsumidor'
      'SubTotal=SubTotal'
      'Desconto=Desconto'
      'Acrescimo=Acrescimo'
      'ValorTotal=ValorTotal'
      'Troco=Troco'
      'Destinatario=Destinatario'
      'Observacao=Observacao'
      'NumeroSAT=NumeroSAT'
      'DataHora=DataHora'
      'QRCode=QRCode'
      'ObservacaoDelivery=ObservacaoDelivery'
      'NomeConsumidor=NomeConsumidor'
      'EnderecoConsumidor=EnderecoConsumidor')
    DataSet = cdsDadosCupom
    BCDToCurrency = False
    Left = 56
    Top = 349
  end
  object frxDBItensCupom: TfrxDBDataset
    UserName = 'frxDBItensCupom'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Item=Item'
      'CodItem=CodItem'
      'DescItem=DescItem'
      'Quantidade=Quantidade'
      'DescQtde=DescQtde'
      'ValorUnitario=ValorUnitario'
      'ValorTotal=ValorTotal'
      'Desconto=Desconto'
      'LiquidoDesc=LiquidoDesc'
      'Acrescimo=Acrescimo'
      'LiquidoAcres=LiquidoAcres')
    DataSet = cdsItensCupom
    BCDToCurrency = False
    Left = 201
    Top = 349
  end
  object frxCupomFiscal: TfrxReport
    Version = '5.5.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42566.391764398100000000
    ReportOptions.LastChange = 43643.400180300920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure extratoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      
        '  msSubTotal.Visible   := <frxDBDadosCupom."SubTotal"> <> '#39#39';   ' +
        '                             '
      
        '  msDesconto.Visible   := <frxDBDadosCupom."Desconto"> <> '#39#39';   ' +
        '                             '
      '  msAcrescimo.Visible  := <frxDBDadosCupom."Acrescimo"> <> '#39#39';'
      '  msTroco.Visible      := <frxDBDadosCupom."Troco"> <> '#39#39';'
      '  msObservacao.Visible := <frxDBDadosCupom."Observacao"> <> '#39#39';'
      '    '
      'end;'
      ''
      'procedure dtItensOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '  dtItens.Child     := nil;'
      '  cdDesconto.Child  := nil;'
      '  cdAcrescimo.Child := nil;'
      ''
      '  if ( <frxDBItensCupom."Desconto"> <> '#39#39' ) then'
      '    dtItens.Child := cdDesconto;'
      ''
      
        '  if ( <frxDBItensCupom."Acrescimo"> <> '#39#39' ) and ( dtItens.Child' +
        ' = nil ) then'
      '    dtItens.Child := cdAcrescimo'
      '  else if ( <frxDBItensCupom."Acrescimo"> <> '#39#39' ) then'
      '    cdDesconto.Child := cdAcrescimo;           '
      '    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 334
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
      end
      item
        DataSet = frxDBItensCupom
        DataSetName = 'frxDBItensCupom'
      end
      item
        DataSet = frxDBPagamentos
        DataSetName = 'frxDBPagamentos'
      end>
    Variables = <
      item
        Name = ' SFAutomatus'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object extrato: TfrxReportPage
      PaperWidth = 72.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 135
      LargeDesignHeight = True
      OnBeforePrint = 'extratoOnBeforePrint'
      object msCabecalho: TfrxMasterData
        FillType = ftBrush
        Height = 226.771800000000000000
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object frxDBDadosCupomFant: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.322820000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Fant'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Fant"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDadosCupomNome: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.275510000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Nome'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Nome"]')
          ParentFont = False
        end
        object frxDBDadosCupomEndereco: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.952690000000000000
          Width = 264.567100000000000000
          Height = 28.346466460000000000
          DataField = 'Endereco'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Endereco"]')
          ParentFont = False
        end
        object frxDBDadosCupomCNPJ: TfrxMemoView
          Left = 3.779530000000000000
          Top = 69.968460000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'CNPJ'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."CNPJ"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDadosCupomExtrato: TfrxMemoView
          Left = 3.779530000000000000
          Top = 116.118120000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Extrato'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Extrato"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 100.747990000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 134.842610000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."DescCupom"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 149.630023780000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 169.307203780000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'CPFConsumidor'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDadosCupom."CPFConsumidor"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 181.535560000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 197.787570000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '  #  |C'#211'D|DESC|QTD|UN|VL UN R$|(VLTR R$) * |VL ITEM R$')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 212.330860000000000000
          Width = 264.567100000000000000
          Height = 11.338590000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
      end
      object dtItens: TfrxDetailData
        FillType = ftBrush
        Height = 32.125984250000000000
        Top = 268.346630000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'dtItensOnBeforePrint'
        DataSet = frxDBItensCupom
        DataSetName = 'frxDBItensCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object frxDBItensCupomItem: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[FormatFloat('#39'000'#39', <frxDBItensCupom."Item">)]')
          ParentFont = False
        end
        object frxDBItensCupomDescItem: TfrxMemoView
          Left = 119.417440000000000000
          Top = 0.779530000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataField = 'DescItem'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBItensCupom."DescItem"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomCodItem: TfrxMemoView
          Left = 29.236240000000000000
          Top = 0.779530000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataField = 'CodItem'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBItensCupom."CodItem"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomQuantidade: TfrxMemoView
          Left = 3.779530000000000000
          Top = 16.236240000000000000
          Width = 49.133890000000000000
          Height = 13.228346460000000000
          DataField = 'Quantidade'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Quantidade"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomDescQtde: TfrxMemoView
          Left = 55.252010000000000000
          Top = 16.236240000000000000
          Width = 26.456710000000000000
          Height = 13.228346460000000000
          DataField = 'DescQtde'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBItensCupom."DescQtde"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomValorUnitario: TfrxMemoView
          Left = 83.504020000000000000
          Top = 16.236240000000000000
          Width = 75.590600000000000000
          Height = 13.228346460000000000
          DataField = 'ValorUnitario'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."ValorUnitario"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomValorTotal: TfrxMemoView
          Left = 183.669450000000000000
          Top = 16.236240000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          DataField = 'ValorTotal'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."ValorTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object cdDesconto: TfrxChild
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 325.039580000000000000
        Width = 272.126160000000000000
        object frxDBItensCupomDesconto: TfrxMemoView
          Left = 115.637910000000000000
          Top = 6.559060000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataField = 'Desconto'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Desconto"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomLiquidoDesc: TfrxMemoView
          Left = 115.637910000000000000
          Top = 21.015770000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataField = 'LiquidoDesc'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."LiquidoDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 6.559060000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'desconto')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.015770000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object cdAcrescimo: TfrxChild
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 385.512060000000000000
        Width = 272.126160000000000000
        object Memo8: TfrxMemoView
          Left = 115.637910000000000000
          Top = 6.559060000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Acrescimo"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 115.637910000000000000
          Top = 21.015770000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."LiquidoAcres"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 6.559060000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'acr'#233'scimo')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.015770000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object msTotal: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 570.709030000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo18: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL R$')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."ValorTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msSubTotal: TfrxMasterData
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 445.984540000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo20: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Subtotal')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."SubTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msDesconto: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 487.559370000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo22: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Descontos')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Desconto"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msAcrescimo: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 529.134200000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo24: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Acr'#233'scimos')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Acrescimo"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object dtPagamentos: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 612.283860000000000000
        Width = 272.126160000000000000
        DataSet = frxDBPagamentos
        DataSetName = 'frxDBPagamentos'
        RowCount = 0
        object frxDBPagamentosDescricao: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.133858270000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          DataField = 'Descricao'
          DataSet = frxDBPagamentos
          DataSetName = 'frxDBPagamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPagamentos."Descricao"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBPagamentosValor: TfrxMemoView
          Left = 187.448980000000000000
          Top = 1.133858270000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBPagamentos
          DataSetName = 'frxDBPagamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPagamentos."Valor"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msTroco: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 653.858690000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo26: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Troco R$')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Troco"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msObservacao: TfrxMasterData
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 695.433520000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Top = 14.118120000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES DO CONTRIBUINTE')
          ParentFont = False
        end
        object frxDBDadosCupomObservacao: TfrxMemoView
          Left = 3.779530000000000000
          Top = 28.897650000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Observacao'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDadosCupom."Observacao"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 230.551330000000000000
        Top = 763.465060000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo37: TfrxMemoView
          Left = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 3.779530000000000000
          Top = 15.456710000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."NumeroSAT"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 3.779530000000000000
          Top = 31.354360000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."DataHora"]')
          ParentFont = False
        end
        object imgQrCode: TfrxPictureView
          Left = 56.693001260000000000
          Top = 60.756030000000000000
          Width = 158.740157480000000000
          Height = 158.740147720000000000
          Center = True
          DataField = 'QRCode'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object mmAssinatura: TfrxMemoView
          Left = 3.779530000000000000
          Top = 91.756030000000000000
          Width = 264.567100000000000000
          Height = 45.354360000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '___________________________________'
            'Assinatura')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
  object qryConsVenda: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT LCT_VENDA.ID_VENDA,'
      '       LCT_VENDA.DT_VENDA,'
      '       LCT_VENDA.HR_VENDA,'
      '       LCT_VENDA.DS_FORMAPAGAMENTO,'
      '       LCT_VENDA.VR_TOTALVENDA,'
      '       LCT_VENDA.VR_TOTALPAGO,'
      '       LCT_VENDA.VR_TROCO,'
      '       CAD_EMPRESA.DS_NOMEEMPRESARIAL,'
      '       CAD_EMPRESA.DS_NOMEFANTASIA,'
      '       CAD_EMPRESA.FG_TIPODOCUMENTO,'
      '       CAD_EMPRESA.NR_CNPJCPF,'
      '       CAD_EMPRESA.DS_LOGRADOURO,'
      '       CAD_EMPRESA.NR_NUMERO,'
      '       CAD_EMPRESA.DS_COMPLEMENTO,'
      '       CAD_EMPRESA.DS_BAIRRO,'
      '       CAD_EMPRESA.NR_CEP,'
      '       CAD_EMPRESA.NR_TELEFONE,'
      '       CAD_EMPRESA.NR_CELULAR,'
      '       CAD_EMPRESA.DS_HOMEPAGE,'
      '       CAD_EMPRESA.DS_EMAIL,'
      '       CAD_MUNICIPIO.DS_MUNICIPIO,'
      '       CAD_MUNICIPIO.CD_UF,'
      '       CAD_CLIENTE.CD_CLIENTE,'
      '       CAD_CLIENTE.DS_NOME,'
      '       CAD_CLIENTE.NR_CPF,'
      '       CAD_CLIENTE.NR_CNPJ,'
      '       CAD_CLIENTE.DS_NOME AS DS_NOMECLIENTE,'
      
        '       CAD_CLIENTE.DS_LOGRADOURO         AS DS_LOGRADOUROCLIENTE' +
        ','
      '       CAD_CLIENTE.NR_NUMERO             AS NR_NUMEROCLIENTE,'
      
        '       CAD_CLIENTE.DS_COMPLEMENTO        AS DS_COMPLEMENTOCLIENT' +
        'E,'
      '       CAD_CLIENTE.DS_BAIRRO             AS DS_BAIRROCLIENTE,'
      '       CAD_MUNICIPIOCLIENTE.DS_MUNICIPIO AS DS_MUNICIPIOCLIENTE,'
      '       CAD_PARAMETROS.DS_OBSERVACAOCUPOM'
      'FROM LCT_VENDA'
      'LEFT JOIN CAD_EMPRESA ON(CAD_EMPRESA.CD_EMPRESA IS NOT NULL)'
      
        'LEFT JOIN CAD_MUNICIPIO ON(CAD_MUNICIPIO.CD_MUNICIPIO = CAD_EMPR' +
        'ESA.CD_MUNICIPIO)'
      
        'LEFT JOIN CAD_CLIENTE ON(CAD_CLIENTE.CD_CLIENTE = LCT_VENDA.CD_C' +
        'LIENTE)'
      
        'LEFT JOIN CAD_MUNICIPIO CAD_MUNICIPIOCLIENTE ON(CAD_MUNICIPIOCLI' +
        'ENTE.CD_MUNICIPIO = CAD_CLIENTE.CD_MUNICIPIO)'
      
        'LEFT JOIN CAD_PARAMETROS ON(CAD_PARAMETROS.ID_PARAMETROS IS NOT ' +
        'NULL)'
      'WHERE LCT_VENDA.ID_VENDA = :ID_VENDA')
    Left = 452
    Top = 216
  end
  object qryConsVendaItens: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT LCT_VENDAITEM.ID_VENDA,'
      '       LCT_VENDAITEM.ID_VENDAITEM,'
      '       LCT_VENDAITEM.ID_PRODUTO,'
      '       LCT_VENDAITEM.FG_UNIDADEMEDIDA,'
      '       LCT_VENDAITEM.VR_UNITARIO,'
      '       LCT_VENDAITEM.NR_QUANTIDADE,'
      '       LCT_VENDAITEM.VR_DESCONTO,'
      '       LCT_VENDAITEM.VR_ACRESCIMO,'
      '       LCT_VENDAITEM.VR_TOTALITEM,'
      '       CAD_PRODUTO.CD_PRODUTO,'
      '       CAD_PRODUTO.DS_NOME,'
      '       CAD_PRODUTO.FG_UNIDADEMEDIDA'
      'FROM LCT_VENDAITEM'
      
        'LEFT JOIN CAD_PRODUTO ON(CAD_PRODUTO.ID_PRODUTO = LCT_VENDAITEM.' +
        'ID_PRODUTO)'
      'WHERE LCT_VENDAITEM.ID_VENDA = :ID_VENDA')
    Left = 452
    Top = 278
  end
  object frxBarCodeObject: TfrxBarCodeObject
    Left = 452
    Top = 349
  end
  object qryConsTotal: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      
        'SELECT SUM(COALESCE(LCT_VENDAITEM.VR_DESCONTO, 0.0)) AS VR_DESCO' +
        'NTO,'
      
        '       SUM(COALESCE(LCT_VENDAITEM.VR_ACRESCIMO, 0.0)) AS VR_ACRE' +
        'SCIMO,'
      
        '       SUM(COALESCE(LCT_VENDAITEM.VR_UNITARIO, 0.0) * COALESCE(L' +
        'CT_VENDAITEM.NR_QUANTIDADE, 0.0)) AS VR_TOTALITEM'
      'FROM LCT_VENDAITEM'
      'WHERE LCT_VENDAITEM.ID_VENDA = :ID_VENDA')
    Left = 581
    Top = 349
  end
  object qryUsuarioAuditoria: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_NOMEUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DT_USUARIOAUDITORIA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HR_USUARIOAUDITORIA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_ORIGEMFUNCAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_DESCRICAOFUNCAO'
        ParamType = ptInput
      end>
    IB_Connection = IB_Connection
    IB_Transaction = trnsUsuarioAuditoria
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'INSERT INTO CAD_USUARIOAUDITORIA ('
      '  DS_USUARIO, DS_NOMEUSUARIO, DT_USUARIOAUDITORIA,'
      '  HR_USUARIOAUDITORIA, DS_ORIGEMFUNCAO, DS_DESCRICAOFUNCAO)'
      'VALUES ('
      '  :DS_USUARIO, :DS_NOMEUSUARIO, :DT_USUARIOAUDITORIA,'
      '  :HR_USUARIOAUDITORIA, :DS_ORIGEMFUNCAO, :DS_DESCRICAOFUNCAO)')
    Left = 581
    Top = 278
  end
  object trnsUsuarioAuditoria: TIB_Transaction
    IB_Connection = IB_Connection
    Isolation = tiCommitted
    Left = 581
    Top = 216
  end
  object frxCupomFiscalDelivery: TfrxReport
    Version = '5.5.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42566.391764398100000000
    ReportOptions.LastChange = 43643.400180300920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure extratoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      
        '  msSubTotal.Visible   := <frxDBDadosCupom."SubTotal"> <> '#39#39';   ' +
        '                             '
      
        '  msDesconto.Visible   := <frxDBDadosCupom."Desconto"> <> '#39#39';   ' +
        '                             '
      '  msAcrescimo.Visible  := <frxDBDadosCupom."Acrescimo"> <> '#39#39';'
      '  msTroco.Visible      := <frxDBDadosCupom."Troco"> <> '#39#39';'
      '  msObservacao.Visible := <frxDBDadosCupom."Observacao"> <> '#39#39';'
      '    '
      'end;'
      ''
      'procedure dtItensOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '  dtItens.Child     := nil;'
      '  cdDesconto.Child  := nil;'
      '  cdAcrescimo.Child := nil;'
      ''
      '  if ( <frxDBItensCupom."Desconto"> <> '#39#39' ) then'
      '    dtItens.Child := cdDesconto;'
      ''
      
        '  if ( <frxDBItensCupom."Acrescimo"> <> '#39#39' ) and ( dtItens.Child' +
        ' = nil ) then'
      '    dtItens.Child := cdAcrescimo'
      '  else if ( <frxDBItensCupom."Acrescimo"> <> '#39#39' ) then'
      '    cdDesconto.Child := cdAcrescimo;           '
      '    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 581
    Top = 150
    Datasets = <
      item
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
      end
      item
        DataSet = frxDBItensCupom
        DataSetName = 'frxDBItensCupom'
      end
      item
        DataSet = frxDBPagamentos
        DataSetName = 'frxDBPagamentos'
      end>
    Variables = <
      item
        Name = ' SFAutomatus'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object extrato: TfrxReportPage
      PaperWidth = 72.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 135
      LargeDesignHeight = True
      OnBeforePrint = 'extratoOnBeforePrint'
      object msCabecalho: TfrxMasterData
        FillType = ftBrush
        Height = 156.850393700787400000
        Top = 18.897650000000000000
        Width = 272.126160000000000000
        Child = frxCupomFiscalDelivery.chEntrega
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object frxDBDadosCupomFant: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.322820000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Fant'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Fant"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDadosCupomNome: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.275510000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Nome'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Nome"]')
          ParentFont = False
        end
        object frxDBDadosCupomEndereco: TfrxMemoView
          Left = 3.779530000000000000
          Top = 39.952690000000000000
          Width = 264.567100000000000000
          Height = 28.346466460000000000
          DataField = 'Endereco'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Endereco"]')
          ParentFont = False
        end
        object frxDBDadosCupomCNPJ: TfrxMemoView
          Left = 3.779530000000000000
          Top = 69.968460000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'CNPJ'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."CNPJ"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDadosCupomExtrato: TfrxMemoView
          Left = 3.779530000000000000
          Top = 106.118120000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataField = 'Extrato'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."Extrato"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.747990000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 124.842610000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."DescCupom"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 139.630023780000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
      end
      object dtItens: TfrxDetailData
        FillType = ftBrush
        Height = 32.125984250000000000
        Top = 442.205010000000000000
        Width = 272.126160000000000000
        OnBeforePrint = 'dtItensOnBeforePrint'
        DataSet = frxDBItensCupom
        DataSetName = 'frxDBItensCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object frxDBItensCupomItem: TfrxMemoView
          Left = 3.779530000000000000
          Top = 0.779530000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[FormatFloat('#39'000'#39', <frxDBItensCupom."Item">)]')
          ParentFont = False
        end
        object frxDBItensCupomDescItem: TfrxMemoView
          Left = 119.417440000000000000
          Top = 0.779530000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          DataField = 'DescItem'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBItensCupom."DescItem"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomCodItem: TfrxMemoView
          Left = 29.236240000000000000
          Top = 0.779530000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataField = 'CodItem'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBItensCupom."CodItem"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomQuantidade: TfrxMemoView
          Left = 3.779530000000000000
          Top = 16.236240000000000000
          Width = 49.133890000000000000
          Height = 13.228346460000000000
          DataField = 'Quantidade'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Quantidade"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomDescQtde: TfrxMemoView
          Left = 55.252010000000000000
          Top = 16.236240000000000000
          Width = 26.456710000000000000
          Height = 13.228346460000000000
          DataField = 'DescQtde'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBItensCupom."DescQtde"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomValorUnitario: TfrxMemoView
          Left = 83.504020000000000000
          Top = 16.236240000000000000
          Width = 75.590600000000000000
          Height = 13.228346460000000000
          DataField = 'ValorUnitario'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."ValorUnitario"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomValorTotal: TfrxMemoView
          Left = 183.669450000000000000
          Top = 16.236240000000000000
          Width = 83.149660000000000000
          Height = 13.228346460000000000
          DataField = 'ValorTotal'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."ValorTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object cdDesconto: TfrxChild
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 498.897960000000000000
        Width = 272.126160000000000000
        object frxDBItensCupomDesconto: TfrxMemoView
          Left = 115.637910000000000000
          Top = 6.559060000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataField = 'Desconto'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Desconto"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBItensCupomLiquidoDesc: TfrxMemoView
          Left = 115.637910000000000000
          Top = 21.015770000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataField = 'LiquidoDesc'
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."LiquidoDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 3.779530000000000000
          Top = 6.559060000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'desconto')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.015770000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object cdAcrescimo: TfrxChild
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 559.370440000000000000
        Width = 272.126160000000000000
        object Memo8: TfrxMemoView
          Left = 115.637910000000000000
          Top = 6.559060000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."Acrescimo"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 115.637910000000000000
          Top = 21.015770000000000000
          Width = 151.181200000000000000
          Height = 13.228346460000000000
          DataSet = frxDBItensCupom
          DataSetName = 'frxDBItensCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBItensCupom."LiquidoAcres"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 6.559060000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'acr'#233'scimo')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 21.015770000000000000
          Width = 105.826840000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'valor l'#237'quido')
          ParentFont = False
          WordWrap = False
        end
      end
      object msTotal: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 744.567410000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo18: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL R$')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."ValorTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msSubTotal: TfrxMasterData
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 619.842920000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo20: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Subtotal')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."SubTotal"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msDesconto: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 661.417750000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo22: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Descontos')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Desconto"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msAcrescimo: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 702.992580000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo24: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Acr'#233'scimos')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Acrescimo"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object dtPagamentos: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 786.142240000000000000
        Width = 272.126160000000000000
        DataSet = frxDBPagamentos
        DataSetName = 'frxDBPagamentos'
        RowCount = 0
        object frxDBPagamentosDescricao: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.133858270000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          DataField = 'Descricao'
          DataSet = frxDBPagamentos
          DataSetName = 'frxDBPagamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPagamentos."Descricao"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBPagamentosValor: TfrxMemoView
          Left = 187.448980000000000000
          Top = 1.133858270000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = frxDBPagamentos
          DataSetName = 'frxDBPagamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPagamentos."Valor"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msTroco: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 827.717070000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        object Memo26: TfrxMemoView
          Left = 3.559060000000000000
          Top = 1.889763780000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Troco R$')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 92.960730000000000000
          Top = 1.889763780000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDadosCupom."Troco"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object msObservacao: TfrxMasterData
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 869.291900000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Top = 14.118120000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES DO CONTRIBUINTE')
          ParentFont = False
        end
        object frxDBDadosCupomObservacao: TfrxMemoView
          Left = 3.779530000000000000
          Top = 28.897650000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataField = 'Observacao'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxDBDadosCupom."Observacao"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 230.551330000000000000
        Top = 937.323440000000000000
        Width = 272.126160000000000000
        DataSet = frxDBDadosCupom
        DataSetName = 'frxDBDadosCupom'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo37: TfrxMemoView
          Left = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo38: TfrxMemoView
          Left = 3.779530000000000000
          Top = 15.456710000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."NumeroSAT"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 3.779530000000000000
          Top = 31.354360000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDadosCupom."DataHora"]')
          ParentFont = False
        end
        object imgQrCode: TfrxPictureView
          Left = 56.693001260000000000
          Top = 60.756030000000000000
          Width = 158.740157480000000000
          Height = 158.740147720000000000
          Center = True
          DataField = 'QRCode'
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object mmAssinatura: TfrxMemoView
          Left = 3.779530000000000000
          Top = 91.756030000000000000
          Width = 264.567100000000000000
          Height = 45.354360000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '___________________________________'
            'Assinatura')
          ParentFont = False
          WordWrap = False
        end
      end
      object chEntrega: TfrxChild
        FillType = ftBrush
        Height = 73.700787400000000000
        Top = 200.315090000000000000
        Width = 272.126160000000000000
        Child = frxCupomFiscalDelivery.chObservacao
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Top = 19.212583780000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDadosCupom."NomeConsumidor"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.000000000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'CLIENTE')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 38.015770000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'ENTREGA')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 3.779530000000000000
          Top = 55.133890000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDadosCupom."EnderecoConsumidor"]')
          ParentFont = False
        end
      end
      object chObservacao: TfrxChild
        FillType = ftBrush
        Height = 47.244094490000000000
        Top = 298.582870000000000000
        Width = 272.126160000000000000
        Stretched = True
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 13.000000000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'OBSERVA'#199#195'O')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 3.779530000000000000
          Top = 28.897650000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDadosCupom."ObservacaoDelivery"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Width = 264.567100000000000000
          Height = 11.338590000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 47.244094488188980000
        Top = 370.393940000000000000
        Width = 272.126160000000000000
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.527520000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '  #  |C'#211'D|DESC|QTD|UN|VL UN R$|(VLTR R$) * |VL ITEM R$')
          ParentFont = False
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 33.070810000000000000
          Width = 264.567100000000000000
          Height = 11.338590000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.559060000000000000
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          DataSet = frxDBDadosCupom
          DataSetName = 'frxDBDadosCupom'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '-----')
          ParentFont = False
          WordWrap = False
        end
      end
    end
  end
end
