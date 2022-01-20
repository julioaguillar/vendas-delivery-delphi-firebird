inherited frmCadFornecedor: TfrmCadFornecedor
  Caption = 'Cadastro - Fornecedor'
  ClientHeight = 466
  ClientWidth = 666
  ExplicitWidth = 672
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 426
    Width = 666
    ExplicitTop = 426
    ExplicitWidth = 666
    inherited btnConsultar: TBitBtn [0]
      Left = 253
      Enabled = False
      Visible = False
      ExplicitLeft = 253
    end
    inherited btnIncluir: TBitBtn [1]
      Left = 158
      ExplicitLeft = 158
    end
    inherited btnExcluir: TBitBtn [2]
      Left = 258
      ExplicitLeft = 258
    end
    inherited btnAlterar: TBitBtn [3]
      Left = 358
      ExplicitLeft = 358
    end
    inherited btnConfirmar: TBitBtn
      Left = 458
      ExplicitLeft = 458
    end
    inherited btnCancelar: TBitBtn
      Left = 558
      ExplicitLeft = 558
    end
    object btnExportar: TBitBtn
      Left = 5
      Top = 4
      Width = 148
      Height = 32
      Caption = '&Exportar para Agenda'
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
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFBF000000000000
        00000000BFFFFFFF0000FFFFFFDF7F7F7F7F7F7F7F7F7F7FDFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF7F7FFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFF7F00007FFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        7F000000007FFFFFFFFFFFFF0000FFFFFFFFFF7F0000000000007FFFFFFFFFFF
        0000FFFFFFFF7F00000000000000007FFFFFFFFF0000FFFFFFFFBFBF8F000000
        008FBFBFFFFFFFFF0000FFFFFFFFFFFFBF00000000BFFFFFFFFFFFFF0000FFFF
        FFFFFFFFBF00000000BFFFFFFFFFFFFF0000FFFFFFFFFFFFBF00000000BFFFFF
        FFFFFFFF0000FFFFFFFFFFFFCF3F3F3F3FCFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnClick = btnExportarClick
    end
  end
  object gpbNomeEmpresarial: TGroupBox [1]
    Left = 10
    Top = 4
    Width = 377
    Height = 44
    Caption = 'Nome'
    TabOrder = 1
    object dbeNomeEmpresarial: TDBEdit
      Left = 6
      Top = 16
      Width = 364
      Height = 21
      DataField = 'DS_NOME'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbTelefone: TGroupBox [2]
    Left = 10
    Top = 50
    Width = 97
    Height = 44
    Caption = 'Telefone'
    TabOrder = 4
    object dbeTelefone: TDBEdit
      Left = 6
      Top = 16
      Width = 85
      Height = 21
      DataField = 'NR_TELEFONE'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbFax: TGroupBox [3]
    Left = 109
    Top = 50
    Width = 97
    Height = 44
    Caption = 'Fax'
    TabOrder = 5
    object dbeFax: TDBEdit
      Left = 6
      Top = 16
      Width = 85
      Height = 21
      DataField = 'NR_FAX'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbEmail: TGroupBox [4]
    Left = 208
    Top = 50
    Width = 232
    Height = 44
    Caption = 'E-mail'
    TabOrder = 6
    object dbeEmail: TDBEdit
      Left = 6
      Top = 16
      Width = 219
      Height = 21
      DataField = 'DS_EMAIL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbContato: TGroupBox [5]
    Left = 443
    Top = 50
    Width = 142
    Height = 44
    Caption = 'Contato'
    TabOrder = 7
    object dbeContato: TDBEdit
      Left = 6
      Top = 16
      Width = 130
      Height = 21
      DataField = 'DS_CONTATO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbRamal: TGroupBox [6]
    Left = 587
    Top = 50
    Width = 68
    Height = 44
    Caption = 'Ramal'
    TabOrder = 8
    object dbeRamal: TDBEdit
      Left = 6
      Top = 16
      Width = 55
      Height = 21
      DataField = 'NR_RAMAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbObservacao: TGroupBox [7]
    Left = 10
    Top = 201
    Width = 645
    Height = 44
    Caption = 'Observa'#231#227'o'
    TabOrder = 10
    object dbeObservacao: TDBEdit
      Left = 6
      Top = 16
      Width = 631
      Height = 21
      DataField = 'DS_OBSERVACAO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbConvenios: TGroupBox [8]
    Left = 10
    Top = 248
    Width = 645
    Height = 173
    Caption = 'Fornecedores / Prestadores de Servi'#231'o'
    TabOrder = 11
    object dbgConvenios: TDBGrid
      Left = 6
      Top = 14
      Width = 633
      Height = 153
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbgConveniosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TELEFONE'
          Title.Caption = 'Telefone'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_FAX'
          Title.Caption = 'Fax'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_CONTATO'
          Title.Caption = 'Contato'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_RAMAL'
          Title.Caption = 'Ramal'
          Width = 50
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 371
    Top = 302
    Strings.Strings = (
      'dbeNomeEmpresarial=Nome deve ser informado')
    TabOrder = 12
    ExplicitLeft = 371
    ExplicitTop = 302
  end
  object gpbEndereco: TGroupBox [10]
    Left = 10
    Top = 97
    Width = 645
    Height = 102
    Caption = 'Endere'#231'o'
    TabOrder = 9
    object gpbLogradouro: TGroupBox
      Left = 97
      Top = 14
      Width = 280
      Height = 41
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dbeLogradouro: TDBEdit
        Left = 6
        Top = 13
        Width = 268
        Height = 21
        DataField = 'DS_LOGRADOURO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbNumero: TGroupBox
      Left = 379
      Top = 14
      Width = 72
      Height = 41
      Caption = 'N'#250'mero'
      TabOrder = 2
      object dbeNumero: TDBEdit
        Left = 6
        Top = 13
        Width = 60
        Height = 21
        DataField = 'NR_NUMERO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbComplemento: TGroupBox
      Left = 452
      Top = 14
      Width = 185
      Height = 41
      Caption = 'Complemento'
      TabOrder = 3
      object dbeComplemento: TDBEdit
        Left = 6
        Top = 13
        Width = 173
        Height = 21
        DataField = 'DS_COMPLEMENTO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbBairro: TGroupBox
      Left = 9
      Top = 54
      Width = 248
      Height = 41
      Caption = 'Bairro'
      TabOrder = 4
      object dbeBairro: TDBEdit
        Left = 6
        Top = 13
        Width = 235
        Height = 21
        DataField = 'DS_BAIRRO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbCEP: TGroupBox
      Left = 9
      Top = 14
      Width = 87
      Height = 41
      Caption = 'CEP'
      TabOrder = 0
      object dbeCEP: TDBEdit
        Left = 6
        Top = 13
        Width = 74
        Height = 21
        DataField = 'NR_CEP'
        DataSource = dtsCadPadrao
        TabOrder = 0
        OnEnter = dbeCEPEnter
        OnExit = dbeCEPExit
      end
    end
    object gpbUF: TGroupBox
      Left = 259
      Top = 54
      Width = 51
      Height = 41
      Caption = 'UF'
      TabOrder = 5
      object dbcUF: TDBLookupComboBox
        Left = 6
        Top = 13
        Width = 39
        Height = 21
        DataField = 'CD_UF'
        DataSource = dtsCadPadrao
        KeyField = 'CD_UF'
        ListField = 'CD_UF'
        ListSource = dtsConsUF
        NullValueKey = 46
        TabOrder = 0
        OnClick = dbcUFClick
        OnEnter = dbcUFEnter
      end
    end
    object gpbCidade: TGroupBox
      Left = 313
      Top = 54
      Width = 324
      Height = 41
      Caption = 'Cidade'
      TabOrder = 6
      object dbcCidade: TDBLookupComboBox
        Left = 6
        Top = 13
        Width = 312
        Height = 21
        DataField = 'CD_MUNICIPIO'
        DataSource = dtsCadPadrao
        KeyField = 'CD_MUNICIPIO'
        ListField = 'DS_MUNICIPIO'
        ListSource = dtsConsMunicipio
        NullValueKey = 46
        TabOrder = 0
        OnEnter = dbcCidadeEnter
      end
    end
  end
  object gpbCNPJ: TGroupBox [11]
    Left = 388
    Top = 4
    Width = 145
    Height = 44
    Caption = 'CNPJ'
    TabOrder = 2
    object dbeCNPJ: TDBEdit
      Left = 6
      Top = 16
      Width = 131
      Height = 21
      DataField = 'NR_CNPJ'
      DataSource = dtsCadPadrao
      TabOrder = 0
      OnExit = dbeCNPJExit
    end
  end
  object gpbCPF: TGroupBox [12]
    Left = 535
    Top = 4
    Width = 120
    Height = 44
    Caption = 'CPF'
    TabOrder = 3
    object dbeCPF: TDBEdit
      Left = 6
      Top = 16
      Width = 108
      Height = 21
      DataField = 'NR_CPF'
      DataSource = dtsCadPadrao
      TabOrder = 0
      OnExit = dbeCPFExit
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 507
    Top = 336
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_FORNECEDOR CAD_FORNECEDOR'
      'WHERE'
      '   CD_FORNECEDOR = :OLD_CD_FORNECEDOR')
    EditSQL.Strings = (
      'UPDATE CAD_FORNECEDOR CAD_FORNECEDOR SET'
      '   CAD_FORNECEDOR.CD_FORNECEDOR = :CD_FORNECEDOR, /*PK*/'
      '   CAD_FORNECEDOR.DS_NOME = :DS_NOME,'
      '   CAD_FORNECEDOR.NR_CNPJ = :NR_CNPJ,'
      '   CAD_FORNECEDOR.NR_CPF = :NR_CPF,'
      '   CAD_FORNECEDOR.DS_LOGRADOURO = :DS_LOGRADOURO,'
      '   CAD_FORNECEDOR.NR_NUMERO = :NR_NUMERO,'
      '   CAD_FORNECEDOR.DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '   CAD_FORNECEDOR.DS_BAIRRO = :DS_BAIRRO,'
      '   CAD_FORNECEDOR.NR_CEP = :NR_CEP,'
      '   CAD_FORNECEDOR.CD_UF = :CD_UF,'
      '   CAD_FORNECEDOR.CD_MUNICIPIO = :CD_MUNICIPIO,'
      '   CAD_FORNECEDOR.NR_TELEFONE = :NR_TELEFONE,'
      '   CAD_FORNECEDOR.NR_FAX = :NR_FAX,'
      '   CAD_FORNECEDOR.DS_EMAIL = :DS_EMAIL,'
      '   CAD_FORNECEDOR.DS_CONTATO = :DS_CONTATO,'
      '   CAD_FORNECEDOR.NR_RAMAL = :NR_RAMAL,'
      '   CAD_FORNECEDOR.DS_OBSERVACAO = :DS_OBSERVACAO'
      'WHERE'
      '   CD_FORNECEDOR = :OLD_CD_FORNECEDOR')
    FieldsEditMask.Strings = (
      'NR_CEP=99\.999\-999;1;_'
      'NR_TELEFONE=\(99\) 9999\-9999;1;_'
      'NR_FAX=\(99\) 9999\-9999;1;_'
      'NR_CNPJ=99.999.999/9999-99;1;_'
      'NR_CPF=999.999.999-99;1;_')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_FORNECEDOR('
      '   CD_FORNECEDOR, /*PK*/'
      '   DS_NOME,'
      '   NR_CNPJ,'
      '   NR_CPF,'
      '   DS_LOGRADOURO,'
      '   NR_NUMERO,'
      '   DS_COMPLEMENTO,'
      '   DS_BAIRRO,'
      '   NR_CEP,'
      '   CD_UF,'
      '   CD_MUNICIPIO,'
      '   NR_TELEFONE,'
      '   NR_FAX,'
      '   DS_EMAIL,'
      '   DS_CONTATO,'
      '   NR_RAMAL,'
      '   DS_OBSERVACAO)'
      'VALUES ('
      '   :CD_FORNECEDOR,'
      '   :DS_NOME,'
      '   :NR_CNPJ,'
      '   :NR_CPF,'
      '   :DS_LOGRADOURO,'
      '   :NR_NUMERO,'
      '   :DS_COMPLEMENTO,'
      '   :DS_BAIRRO,'
      '   :NR_CEP,'
      '   :CD_UF,'
      '   :CD_MUNICIPIO,'
      '   :NR_TELEFONE,'
      '   :NR_FAX,'
      '   :DS_EMAIL,'
      '   :DS_CONTATO,'
      '   :NR_RAMAL,'
      '   :DS_OBSERVACAO)')
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'SELECT CAD_FORNECEDOR.CD_FORNECEDOR,'
      '       CAD_FORNECEDOR.DS_NOME,'
      '       CAD_FORNECEDOR.NR_CNPJ,'
      '       CAD_FORNECEDOR.NR_CPF,'
      '       CAD_FORNECEDOR.DS_LOGRADOURO,'
      '       CAD_FORNECEDOR.NR_NUMERO,'
      '       CAD_FORNECEDOR.DS_COMPLEMENTO,'
      '       CAD_FORNECEDOR.DS_BAIRRO,'
      '       CAD_FORNECEDOR.NR_CEP,'
      '       CAD_FORNECEDOR.CD_UF,'
      '       CAD_FORNECEDOR.CD_MUNICIPIO,'
      '       CAD_FORNECEDOR.NR_TELEFONE,'
      '       CAD_FORNECEDOR.NR_FAX,'
      '       CAD_FORNECEDOR.DS_EMAIL,'
      '       CAD_FORNECEDOR.DS_CONTATO,'
      '       CAD_FORNECEDOR.NR_RAMAL,'
      '       CAD_FORNECEDOR.DS_OBSERVACAO'
      'FROM CAD_FORNECEDOR'
      'ORDER BY CAD_FORNECEDOR.DS_NOME')
    Left = 539
    Top = 336
  end
  inherited dtsCadPadrao: TDataSource
    Left = 539
    Top = 304
  end
  object qryConsUF: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_UNIDADEFEDERAL.CD_UF,'
      '       CAD_UNIDADEFEDERAL.DS_ESTADO'
      'FROM CAD_UNIDADEFEDERAL')
    Left = 160
    Top = 336
  end
  object qryConsMunicipio: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'CD_UF'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_MUNICIPIO.CD_MUNICIPIO,'
      '       CAD_MUNICIPIO.DS_MUNICIPIO,'
      '       CAD_MUNICIPIO.CD_UF'
      'FROM CAD_MUNICIPIO'
      'WHERE CAD_MUNICIPIO.CD_UF = :CD_UF')
    Left = 192
    Top = 336
  end
  object dtsConsUF: TDataSource
    DataSet = qryConsUF
    Left = 160
    Top = 307
  end
  object dtsConsMunicipio: TDataSource
    DataSet = qryConsMunicipio
    Left = 192
    Top = 307
  end
  object qryValidaExclusao: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CONVENIO'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT COUNT(CAD_PACIENTE.CD_PACIENTE) AS NR_PACIENTE'
      'FROM CAD_PACIENTE'
      'WHERE CAD_PACIENTE.CD_CONVENIO = :CD_CONVENIO')
    Left = 224
    Top = 336
  end
  object qryConsAgenda: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_TELEFONECOMERCIAL'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_AGENDATELEFONE.ID_AGENDATELEFONE,'
      '       CAD_AGENDATELEFONE.DS_CONTATO,'
      '       CAD_AGENDATELEFONE.NR_TELEFONECOMERCIAL'
      'FROM CAD_AGENDATELEFONE'
      
        'WHERE UPPER(CAD_AGENDATELEFONE.DS_CONTATO) = UPPER(:DS_CONTATO) ' +
        'OR'
      
        '      CAD_AGENDATELEFONE.NR_TELEFONECOMERCIAL = :NR_TELEFONECOME' +
        'RCIAL')
    Left = 160
    Top = 368
  end
  object qryCadAgenda: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENDATELEFONE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_CONTATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_TELEFONECOMERCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_EMAIL'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'INSERT INTO CAD_AGENDATELEFONE ('
      '  ID_AGENDATELEFONE,'
      '  DS_CONTATO,'
      '  NR_TELEFONECOMERCIAL,'
      '  DS_EMAIL)'
      'VALUES ('
      '  :ID_AGENDATELEFONE,'
      '  :DS_CONTATO,'
      '  :NR_TELEFONECOMERCIAL,'
      '  :DS_EMAIL)')
    Left = 191
    Top = 368
  end
end
