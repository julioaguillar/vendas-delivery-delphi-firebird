inherited frmCadEmpresa: TfrmCadEmpresa
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro - Empresa'
  ClientHeight = 297
  ClientWidth = 689
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 695
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
  object gpbEndereco: TGroupBox
    Left = 5
    Top = 96
    Width = 676
    Height = 107
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object gpbLogradouro: TGroupBox
      Left = 101
      Top = 15
      Width = 309
      Height = 41
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dbeLogradouro: TDBEdit
        Left = 6
        Top = 13
        Width = 297
        Height = 21
        DataField = 'DS_LOGRADOURO'
        DataSource = dtsEmpresa
        Enabled = False
        TabOrder = 0
      end
    end
    object gpbNumero: TGroupBox
      Left = 413
      Top = 15
      Width = 86
      Height = 41
      Caption = 'N'#250'mero'
      TabOrder = 2
      object dbeNumero: TDBEdit
        Left = 6
        Top = 13
        Width = 74
        Height = 21
        DataField = 'NR_NUMERO'
        DataSource = dtsEmpresa
        Enabled = False
        TabOrder = 0
      end
    end
    object gpbComplemento: TGroupBox
      Left = 500
      Top = 15
      Width = 166
      Height = 41
      Caption = 'Complemento'
      TabOrder = 3
      object dbeComplemento: TDBEdit
        Left = 6
        Top = 13
        Width = 153
        Height = 21
        DataField = 'DS_COMPLEMENTO'
        DataSource = dtsEmpresa
        Enabled = False
        TabOrder = 0
      end
    end
    object gpbBairro: TGroupBox
      Left = 9
      Top = 58
      Width = 306
      Height = 41
      Caption = 'Bairro'
      TabOrder = 4
      object dbeBairro: TDBEdit
        Left = 6
        Top = 13
        Width = 294
        Height = 21
        DataField = 'DS_BAIRRO'
        DataSource = dtsEmpresa
        Enabled = False
        TabOrder = 0
      end
    end
    object gpbCEP: TGroupBox
      Left = 9
      Top = 15
      Width = 90
      Height = 41
      Caption = 'CEP'
      TabOrder = 0
      object dbeCEP: TDBEdit
        Left = 6
        Top = 13
        Width = 78
        Height = 21
        DataField = 'NR_CEP'
        DataSource = dtsEmpresa
        Enabled = False
        TabOrder = 0
        OnEnter = dbeCEPEnter
        OnExit = dbeCEPExit
      end
    end
    object gpbUF: TGroupBox
      Left = 317
      Top = 58
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
        DataSource = dtsEmpresa
        Enabled = False
        KeyField = 'CD_UF'
        ListField = 'CD_UF'
        ListSource = dtsUF
        NullValueKey = 46
        TabOrder = 0
        OnClick = dbcUFClick
        OnEnter = dbcUFEnter
      end
    end
    object gpbCidade: TGroupBox
      Left = 370
      Top = 58
      Width = 296
      Height = 41
      Caption = 'Cidade'
      TabOrder = 6
      object dbcCidade: TDBLookupComboBox
        Left = 6
        Top = 13
        Width = 283
        Height = 21
        DataField = 'CD_MUNICIPIO'
        DataSource = dtsEmpresa
        Enabled = False
        KeyField = 'CD_MUNICIPIO'
        ListField = 'DS_MUNICIPIO'
        ListSource = dtsMunicipio
        NullValueKey = 46
        TabOrder = 0
        OnEnter = dbcCidadeEnter
      end
    end
  end
  object gpbNomeEmpresarial: TGroupBox
    Left = 5
    Top = 3
    Width = 331
    Height = 41
    Caption = 'Nome Empresarial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object dbeNomeEmpresarial: TDBEdit
      Left = 6
      Top = 13
      Width = 319
      Height = 21
      DataField = 'DS_NOMEEMPRESARIAL'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbNomeFantasia: TGroupBox
    Left = 339
    Top = 3
    Width = 342
    Height = 41
    Caption = 'Nome Fantasia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object dbeNomeFantasia: TDBEdit
      Left = 6
      Top = 13
      Width = 329
      Height = 21
      DataField = 'DS_NOMEFANTASIA'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbTipoDocumento: TGroupBox
    Left = 5
    Top = 48
    Width = 101
    Height = 41
    Caption = 'Tipo documento'
    TabOrder = 3
    object dbTipoDocumento: TDBComboBox
      Left = 8
      Top = 13
      Width = 77
      Height = 21
      Style = csDropDownList
      AutoDropDown = True
      DataField = 'FG_TIPODOCUMENTO'
      DataSource = dtsEmpresa
      Enabled = False
      Items.Strings = (
        'CNPJ'
        'CPF')
      TabOrder = 0
      OnEnter = dbTipoDocumentoEnter
      OnExit = dbTipoDocumentoExit
      OnKeyDown = dbTipoDocumentoKeyDown
    end
  end
  object gpbCNPJCPF: TGroupBox
    Left = 110
    Top = 48
    Width = 162
    Height = 41
    Caption = 'CNPJ/CPF'
    TabOrder = 4
    object dbeCNPJCPF: TDBEdit
      Left = 6
      Top = 13
      Width = 148
      Height = 21
      DataField = 'NR_CNPJCPF'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
      OnExit = dbeCNPJCPFExit
    end
  end
  object gpbProprietario: TGroupBox
    Left = 276
    Top = 48
    Width = 405
    Height = 41
    Caption = 'Propriet'#225'rio'
    TabOrder = 5
    object dbeProprietario: TDBEdit
      Left = 7
      Top = 13
      Width = 391
      Height = 21
      DataField = 'DS_PROPRIETARIO'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbTelefone: TGroupBox
    Left = 5
    Top = 208
    Width = 115
    Height = 41
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object dbeTelefone: TDBEdit
      Left = 6
      Top = 13
      Width = 102
      Height = 21
      DataField = 'NR_TELEFONE'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbFax: TGroupBox
    Left = 122
    Top = 208
    Width = 115
    Height = 41
    Caption = 'Celular'
    TabOrder = 8
    object dbeFax: TDBEdit
      Left = 6
      Top = 13
      Width = 103
      Height = 21
      DataField = 'NR_CELULAR'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbHomePage: TGroupBox
    Left = 241
    Top = 208
    Width = 226
    Height = 41
    Caption = 'Home page'
    TabOrder = 9
    object dbeHomePage: TDBEdit
      Left = 6
      Top = 13
      Width = 214
      Height = 21
      DataField = 'DS_HOMEPAGE'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbCorreioEletronico: TGroupBox
    Left = 470
    Top = 208
    Width = 211
    Height = 41
    Caption = 'Correio eletronico'
    TabOrder = 10
    object dbeCorreioEletronico: TDBEdit
      Left = 7
      Top = 13
      Width = 197
      Height = 21
      DataField = 'DS_EMAIL'
      DataSource = dtsEmpresa
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 257
    Width = 689
    Height = 40
    Align = alBottom
    TabOrder = 0
    object btnAlterar: TBitBtn
      Left = 193
      Top = 5
      Width = 100
      Height = 30
      Caption = '&Alterar'
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
        0000FFFF6F3F3FACFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF3F000004ACFFFFFF
        FFFFFFFFFFFFFFFF0000FFFF3F00000004ADFFFFFFFFFFFFFFFFFFFF0000FFFF
        AB0400000004ADFFFFFFFFFFFFFFFFFF0000FFFFFFAA0400000004ADFFFFFFFF
        FFFFFFFF0000FFFFFFFFAA0400000005ADFFFFFFFFFFFFFF0000FFFFFFFFFFA9
        0400000005AEFFFFFFFFFFFF0000FFFFFFFFFFFFA90300000005AEFFFFFFFFFF
        0000FFFFFFFFFFFFFFA90300000006E1FFFFFFFF0000FFFFFFFFFFFFFFFFA803
        00019AE1B4FFFFFF0000FFFFFFFFFFFFFFFFFFA8059AE12205B1FFFF0000FFFF
        FFFFFFFFFFFFFFFFDEE12200005EFFFF0000FFFFFFFFFFFFFFFFFFFFFFAF0300
        3CFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFAA5AFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnConfirmar: TBitBtn
      Left = 294
      Top = 5
      Width = 100
      Height = 30
      Caption = '&Confirmar'
      Enabled = False
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
      TabOrder = 1
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 395
      Top = 5
      Width = 100
      Height = 30
      Caption = 'Ca&ncelar'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 453
    Top = 19
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'dbeNomeFantasia=O campo Nome Fantasia deve ser informado')
    TabOrder = 11
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object trnsPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Isolation = tiCommitted
    Left = 589
    Top = 54
  end
  object qryEmpresa: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_EMPRESA CAD_EMPRESA'
      'WHERE'
      '   CD_EMPRESA = :OLD_CD_EMPRESA')
    EditSQL.Strings = (
      'UPDATE CAD_EMPRESA CAD_EMPRESA SET'
      '   CAD_EMPRESA.CD_EMPRESA = :CD_EMPRESA, /*PK*/'
      '   CAD_EMPRESA.DS_NOMEEMPRESARIAL = :DS_NOMEEMPRESARIAL,'
      '   CAD_EMPRESA.DS_NOMEFANTASIA = :DS_NOMEFANTASIA,'
      '   CAD_EMPRESA.FG_TIPODOCUMENTO = :FG_TIPODOCUMENTO,'
      '   CAD_EMPRESA.NR_CNPJCPF = :NR_CNPJCPF,'
      '   CAD_EMPRESA.DS_PROPRIETARIO = :DS_PROPRIETARIO,'
      '   CAD_EMPRESA.DS_LOGRADOURO = :DS_LOGRADOURO,'
      '   CAD_EMPRESA.NR_NUMERO = :NR_NUMERO,'
      '   CAD_EMPRESA.DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '   CAD_EMPRESA.DS_BAIRRO = :DS_BAIRRO,'
      '   CAD_EMPRESA.NR_CEP = :NR_CEP,'
      '   CAD_EMPRESA.CD_UF = :CD_UF,'
      '   CAD_EMPRESA.CD_MUNICIPIO = :CD_MUNICIPIO,'
      '   CAD_EMPRESA.NR_TELEFONE = :NR_TELEFONE,'
      '   CAD_EMPRESA.NR_CELULAR = :NR_CELULAR,'
      '   CAD_EMPRESA.DS_HOMEPAGE = :DS_HOMEPAGE,'
      '   CAD_EMPRESA.DS_EMAIL = :DS_EMAIL'
      'WHERE'
      '   CD_EMPRESA = :OLD_CD_EMPRESA')
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsPadrao
    InsertSQL.Strings = (
      'INSERT INTO CAD_EMPRESA('
      '   CD_EMPRESA, /*PK*/'
      '   DS_NOMEEMPRESARIAL,'
      '   DS_NOMEFANTASIA,'
      '   FG_TIPODOCUMENTO,'
      '   NR_CNPJCPF,'
      '   DS_PROPRIETARIO,'
      '   DS_LOGRADOURO,'
      '   NR_NUMERO,'
      '   DS_COMPLEMENTO,'
      '   DS_BAIRRO,'
      '   NR_CEP,'
      '   CD_UF,'
      '   CD_MUNICIPIO,'
      '   NR_TELEFONE,'
      '   NR_CELULAR,'
      '   DS_HOMEPAGE,'
      '   DS_EMAIL)'
      'VALUES ('
      '   :CD_EMPRESA,'
      '   :DS_NOMEEMPRESARIAL,'
      '   :DS_NOMEFANTASIA,'
      '   :FG_TIPODOCUMENTO,'
      '   :NR_CNPJCPF,'
      '   :DS_PROPRIETARIO,'
      '   :DS_LOGRADOURO,'
      '   :NR_NUMERO,'
      '   :DS_COMPLEMENTO,'
      '   :DS_BAIRRO,'
      '   :NR_CEP,'
      '   :CD_UF,'
      '   :CD_MUNICIPIO,'
      '   :NR_TELEFONE,'
      '   :NR_CELULAR,'
      '   :DS_HOMEPAGE,'
      '   :DS_EMAIL)')
    KeyLinks.Strings = (
      'CAD_EMPRESA.CD_EMPRESA')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterOpen = qryEmpresaAfterOpen
    AfterScroll = qryEmpresaAfterScroll
    SQL.Strings = (
      'SELECT CAD_EMPRESA.CD_EMPRESA,'
      '       CAD_EMPRESA.DS_NOMEEMPRESARIAL,'
      '       CAD_EMPRESA.DS_NOMEFANTASIA,'
      '       CAD_EMPRESA.FG_TIPODOCUMENTO,'
      '       CAD_EMPRESA.NR_CNPJCPF,'
      '       CAD_EMPRESA.DS_PROPRIETARIO,'
      '       CAD_EMPRESA.DS_LOGRADOURO,'
      '       CAD_EMPRESA.NR_NUMERO,'
      '       CAD_EMPRESA.DS_COMPLEMENTO,'
      '       CAD_EMPRESA.DS_BAIRRO,'
      '       CAD_EMPRESA.NR_CEP,'
      '       CAD_EMPRESA.CD_UF,'
      '       CAD_EMPRESA.CD_MUNICIPIO,'
      '       CAD_EMPRESA.NR_TELEFONE,'
      '       CAD_EMPRESA.NR_CELULAR,'
      '       CAD_EMPRESA.DS_HOMEPAGE,'
      '       CAD_EMPRESA.DS_EMAIL'
      'FROM CAD_EMPRESA')
    Left = 589
    Top = 22
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 621
    Top = 22
  end
  object qryUF: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_UNIDADEFEDERAL.CD_UF,'
      '       CAD_UNIDADEFEDERAL.DS_ESTADO'
      'FROM CAD_UNIDADEFEDERAL')
    Left = 524
    Top = 22
  end
  object qryMunicipio: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
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
    Left = 556
    Top = 22
  end
  object dtsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 556
    Top = 54
  end
  object dtsUF: TDataSource
    DataSet = qryUF
    Left = 524
    Top = 54
  end
end
