inherited frmCadAtendimentoItem: TfrmCadAtendimentoItem
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro - Atendimento Cliente'
  ClientHeight = 281
  ClientWidth = 688
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 694
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  object gpbCliente: TGroupBox
    Left = 8
    Top = 31
    Width = 418
    Height = 41
    Caption = 'Cliente (F9 Abre a consulta)'
    TabOrder = 0
    object btnConsultarCliente: TSpeedButton
      Left = 70
      Top = 14
      Width = 23
      Height = 21
      Caption = '...'
      OnClick = btnConsultarClienteClick
    end
    object edtNomeCliente: TEdit
      Left = 96
      Top = 14
      Width = 314
      Height = 21
      Enabled = False
      MaxLength = 70
      TabOrder = 0
    end
    object edtCodCliente: TEdit
      Left = 7
      Top = 14
      Width = 62
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      OnEnter = edtCodClienteEnter
      OnExit = edtCodClienteExit
      OnKeyDown = edtCodClienteKeyDown
    end
  end
  object gpbDia: TGroupBox
    Left = 8
    Top = 77
    Width = 119
    Height = 41
    Caption = 'Dia'
    TabOrder = 3
    object edtData: TDateTimePicker
      Left = 9
      Top = 14
      Width = 102
      Height = 21
      Date = 40982.558942395830000000
      Time = 40982.558942395830000000
      TabOrder = 0
      OnEnter = edtDataEnter
    end
  end
  object gpbHora: TGroupBox
    Left = 132
    Top = 77
    Width = 56
    Height = 41
    Caption = 'Hora'
    TabOrder = 4
    object edtHora: TMaskEdit
      Left = 8
      Top = 14
      Width = 41
      Height = 21
      EditMask = '!99:99;1;_'
      MaxLength = 5
      TabOrder = 0
      Text = '  :  '
      OnExit = edtHoraExit
    end
  end
  object gpbProfissional: TGroupBox
    Left = 0
    Top = 0
    Width = 688
    Height = 25
    Align = alTop
    TabOrder = 7
    object lblProfissional: TLabel
      Left = 8
      Top = 5
      Width = 73
      Height = 16
      AutoSize = False
      Caption = 'Profissional:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescProfissional: TLabel
      Left = 81
      Top = 5
      Width = 482
      Height = 16
      AutoSize = False
      Caption = 'lblDescProfissional'
    end
  end
  object gpbAnotacoes: TGroupBox
    Left = 8
    Top = 123
    Width = 672
    Height = 104
    Caption = 'Anota'#231#245'es'
    TabOrder = 6
    object dbmAnotacoes: TDBMemo
      Left = 7
      Top = 15
      Width = 658
      Height = 82
      DataField = 'DS_ANOTACAO'
      DataSource = dtsCadConsulta
      ScrollBars = ssVertical
      TabOrder = 0
      OnEnter = dbmAnotacoesEnter
      OnExit = dbmAnotacoesExit
      OnKeyPress = dbmAnotacoesKeyPress
    end
  end
  object gpbRodape: TGroupBox
    Left = 0
    Top = 239
    Width = 688
    Height = 42
    Align = alBottom
    TabOrder = 8
    object btnCadastroCliente: TSpeedButton
      Left = 8
      Top = 6
      Width = 120
      Height = 30
      Caption = '&Cadastro Cliente'
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000
        000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF000000646464A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
        A0505050000000FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFF2424244444
        44E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E73838383C3C3CFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFB4B4B41010100C0C0C4C4C4C7C
        7C7CB0B0B0B4B4B4949494545454080808181818CBCBCBFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFE7E7E77C7C7C343434000000000000000000
        0404043C3C3C888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF888888202020101010747474FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060600C
        0C0C747474686868040404A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C747474FFFFFFFFFFFF
        5454543C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF2C2C2C686868FFFFFFFFFFFF484848303030FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF949494040404545454484848000000949494FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        80802C2C2C4C4C4CB4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = btnCadastroClienteClick
    end
    object btnConfirmar: TBitBtn
      Left = 244
      Top = 6
      Width = 100
      Height = 30
      Caption = '&Confirmar'
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
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFDF1F7FFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFDF1F05007FFFFFFFFFFFFFFFFFFF0000FFFFFFDF1F14CF64007FFFFFFFFF
        FFFFFFFF0000FFFFE01F14D1FFFF63007FFFFFFFFFFFFFFF0000FFFFFF42D2FF
        FFFFFF63007FFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF62007FFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFF62007FFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFF61007FFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF61008FFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFF78DFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 344
      Top = 6
      Width = 100
      Height = 30
      Caption = 'Ca&ncelar'
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
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFF2774FFFFFFFFFFFF7028FFFFFFFF0000FFFF
        FFFF700074FFFFFFFF710071FFFFFFFF0000FFFFFFFFFF700074FFFF720072FF
        FFFFFFFF0000FFFFFFFFFFFF700074730073FFFFFFFFFFFF0000FFFFFFFFFFFF
        FF70000074FFFFFFFFFFFFFF0000FFFFFFFFFFFFFF70000074FFFFFFFFFFFFFF
        0000FFFFFFFFFFFF700070700074FFFFFFFFFFFF0000FFFFFFFFFF710071FFFF
        700074FFFFFFFFFF0000FFFFFFFF720072FFFFFFFF700074FFFFFFFF0000FFFF
        FFFF2673FFFFFFFFFFFF7027FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ModalResult = 2
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
  end
  object gpbStatus: TGroupBox
    Left = 194
    Top = 77
    Width = 161
    Height = 41
    Caption = 'Status'
    TabOrder = 5
    object cbbStatus: TComboBox
      Left = 7
      Top = 14
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnEnter = cbbStatusEnter
      Items.Strings = (
        'Agendado'
        'Confirmado'
        'Faltou'
        'Desmarcou'
        'Concluido')
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 468
    Top = 146
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'edtCodCliente=O Cliente deve ser informado'
      'edtData=O Dia deve ser informado'
      'edtHora=A Hora deve ser informada')
    TabOrder = 9
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object gpbTelefoneResidencial: TGroupBox
    Left = 430
    Top = 31
    Width = 123
    Height = 41
    Caption = 'Telefone Resid'#234'ncial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object dbeTelefoneResidencial: TDBEdit
      Left = 8
      Top = 13
      Width = 108
      Height = 21
      DataField = 'NR_TELEFONERESIDENCIAL'
      DataSource = dtsCadConsulta
      TabOrder = 0
    end
  end
  object gpbCelular: TGroupBox
    Left = 557
    Top = 31
    Width = 123
    Height = 41
    Caption = 'Celular'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object dbeCelular: TDBEdit
      Left = 8
      Top = 13
      Width = 108
      Height = 21
      DataField = 'NR_CELULAR'
      DataSource = dtsCadConsulta
      TabOrder = 0
    end
  end
  object qryCadAtendimento: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ATENDIMENTO'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM CAD_ATENDIMENTO CAD_ATENDIMENTO'
      'WHERE'
      '   ID_ATENDIMENTO = :OLD_ID_ATENDIMENTO')
    EditSQL.Strings = (
      'UPDATE CAD_ATENDIMENTO CAD_ATENDIMENTO SET'
      '   CAD_ATENDIMENTO.ID_ATENDIMENTO = :ID_ATENDIMENTO, /*PK*/'
      '   CAD_ATENDIMENTO.CD_PROFISSIONAL = :CD_PROFISSIONAL,'
      '   CAD_ATENDIMENTO.CD_CLIENTE = :CD_CLIENTE,'
      '   CAD_ATENDIMENTO.DT_ATENDIMENTO = :DT_ATENDIMENTO,'
      '   CAD_ATENDIMENTO.HR_ATENDIMENTO = :HR_ATENDIMENTO,'
      '   CAD_ATENDIMENTO.FG_STATUS = :FG_STATUS,'
      '   CAD_ATENDIMENTO.DS_ANOTACAO = :DS_ANOTACAO,'
      
        '   CAD_ATENDIMENTO.NR_TELEFONERESIDENCIAL = :NR_TELEFONERESIDENC' +
        'IAL,'
      '   CAD_ATENDIMENTO.NR_CELULAR = :NR_CELULAR'
      'WHERE'
      '   ID_ATENDIMENTO = :OLD_ID_ATENDIMENTO')
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsPadrao
    InsertSQL.Strings = (
      'INSERT INTO CAD_ATENDIMENTO('
      '   ID_ATENDIMENTO, /*PK*/'
      '   CD_PROFISSIONAL,'
      '   CD_CLIENTE,'
      '   DT_ATENDIMENTO,'
      '   HR_ATENDIMENTO,'
      '   FG_STATUS,'
      '   DS_ANOTACAO,'
      '   NR_TELEFONERESIDENCIAL,'
      '   NR_CELULAR)'
      'VALUES ('
      '   :ID_ATENDIMENTO,'
      '   :CD_PROFISSIONAL,'
      '   :CD_CLIENTE,'
      '   :DT_ATENDIMENTO,'
      '   :HR_ATENDIMENTO,'
      '   :FG_STATUS,'
      '   :DS_ANOTACAO,'
      '   :NR_TELEFONERESIDENCIAL,'
      '   :NR_CELULAR)')
    KeyLinks.Strings = (
      'CAD_ATENDIMENTO.ID_ATENDIMENTO')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_ATENDIMENTO.ID_ATENDIMENTO,'
      '       CAD_ATENDIMENTO.CD_PROFISSIONAL,'
      '       CAD_ATENDIMENTO.CD_CLIENTE,'
      '       CAD_ATENDIMENTO.DT_ATENDIMENTO,'
      '       CAD_ATENDIMENTO.HR_ATENDIMENTO,'
      '       CAD_ATENDIMENTO.FG_STATUS,'
      '       CAD_ATENDIMENTO.DS_ANOTACAO,'
      '       CAD_ATENDIMENTO.NR_TELEFONERESIDENCIAL,'
      '       CAD_ATENDIMENTO.NR_CELULAR'
      'FROM CAD_ATENDIMENTO'
      'WHERE CAD_ATENDIMENTO.ID_ATENDIMENTO = :ID_ATENDIMENTO')
    Left = 357
    Top = 182
    object qryCadAtendimentoCD_PROFISSIONAL: TIntegerField
      FieldName = 'CD_PROFISSIONAL'
    end
    object qryCadAtendimentoFG_STATUS: TStringField
      FieldName = 'FG_STATUS'
      Size = 1
    end
    object qryCadAtendimentoDS_ANOTACAO: TMemoField
      FieldName = 'DS_ANOTACAO'
      BlobType = ftMemo
      Size = 8
    end
    object qryCadAtendimentoNR_TELEFONERESIDENCIAL: TStringField
      FieldName = 'NR_TELEFONERESIDENCIAL'
      EditMask = '\(99\) 9999\-9999;1;_'
      Size = 15
    end
    object qryCadAtendimentoNR_CELULAR: TStringField
      FieldName = 'NR_CELULAR'
      EditMask = '\(99\) 99999\-9999;1;_'
      Size = 15
    end
    object qryCadAtendimentoID_ATENDIMENTO: TIntegerField
      FieldName = 'ID_ATENDIMENTO'
      Required = True
    end
    object qryCadAtendimentoCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object qryCadAtendimentoDT_ATENDIMENTO: TDateField
      FieldName = 'DT_ATENDIMENTO'
    end
    object qryCadAtendimentoHR_ATENDIMENTO: TTimeField
      FieldName = 'HR_ATENDIMENTO'
    end
  end
  object trnsPadrao: TIBOTransaction
    IB_Connection = dmPrincipal.IB_Connection
    Isolation = tiCommitted
    Left = 389
    Top = 182
  end
  object dtsCadConsulta: TDataSource
    DataSet = qryCadAtendimento
    Left = 358
    Top = 152
  end
  object qryConsCliente: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    KeyLinks.Strings = (
      'CAD_CLIENTE.CD_CLIENTE')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_CLIENTE.CD_CLIENTE,'
      '       CAD_CLIENTE.DS_NOME'
      'FROM CAD_CLIENTE'
      'WHERE CAD_CLIENTE.CD_CLIENTE = :CD_CLIENTE')
    Left = 389
    Top = 150
  end
end
