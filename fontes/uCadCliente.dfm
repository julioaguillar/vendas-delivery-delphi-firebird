inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro - Cliente'
  ClientHeight = 422
  ClientWidth = 894
  DoubleBuffered = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  ExplicitWidth = 900
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 382
    Width = 894
    ExplicitTop = 382
    ExplicitWidth = 894
    inherited btnIncluir: TBitBtn
      Left = 147
      ExplicitLeft = 147
    end
    inherited btnExcluir: TBitBtn
      Left = 247
      ExplicitLeft = 247
    end
    inherited btnAlterar: TBitBtn
      Left = 347
      ExplicitLeft = 347
    end
    inherited btnConsultar: TBitBtn
      Left = 447
      ExplicitLeft = 447
    end
    inherited btnConfirmar: TBitBtn
      Left = 547
      ExplicitLeft = 547
    end
    inherited btnCancelar: TBitBtn
      Left = 647
      ExplicitLeft = 647
    end
  end
  object pgcCliente: TPageControl [1]
    Left = 0
    Top = 0
    Width = 894
    Height = 382
    ActivePage = tbsDadosCliente
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    object tbsDadosCliente: TTabSheet
      Caption = 'Dados do Cliente'
      object gpbCodigo: TGroupBox
        Left = 15
        Top = 10
        Width = 115
        Height = 41
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dbeCodigo: TDBEdit
          Left = 7
          Top = 13
          Width = 101
          Height = 21
          DataField = 'CD_CLIENTE'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbNome: TGroupBox
        Left = 140
        Top = 10
        Width = 540
        Height = 41
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          540
          41)
        object dbeNome: TDBEdit
          Left = 6
          Top = 13
          Width = 528
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DS_NOME'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbFoto: TGroupBox
        Left = 686
        Top = 10
        Width = 184
        Height = 154
        Caption = 'Foto'
        TabOrder = 14
        object btnCapturarFotoWeb: TSpeedButton
          Left = 149
          Top = 60
          Width = 29
          Height = 29
          Hint = 'Capturar foto pela webcan'
          Enabled = False
          Glyph.Data = {
            26040000424D2604000000000000360000002800000012000000120000000100
            180000000000F0030000C30E0000C30E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000FF00FFFF00FF16161600000000000000000000000000
            0000000000000000000000000000000000000000000000161616FF00FFFF00FF
            0000FF00FF000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000FF00FF0000FF00FF000000
            0000000000000000000000000404046D6D6DA9A9A9A9A9A96E6E6E0303030000
            00000000000000000000000000FF00FF0000FF00FF0000000000000000000000
            00030303C5C5C5FFFFFFCFCFCFCFCFCFFFFFFFC6C6C602020200000000000000
            0000000000FF00FF0000FF00FF000000000000000000000000646464FFFFFF2F
            2F2F0000000000002F2F2FFFFFFF656565000000000000000000000000FF00FF
            0000FF00FF000000000000000000000000A6A6A6CFCFCF000000000000000000
            000000CFCFCFA6A6A6000000000000000000000000FF00FF0000FF00FF000000
            000000000000000000A4A4A4CFCFCF000000000000000000000000CFCFCFA4A4
            A4000000000000000000000000FF00FF0000FF00FF0000000000000000000000
            00646464FFFFFF2F2F2F000000000000303030FFFFFF65656500000000000000
            0000000000FF00FF0000FF00FF000000000000000000000000030303C5C5C5FF
            FFFFCFCFCFCFCFCFFFFFFFC4C4C4030303000000000000000000000000FF00FF
            0000FF00FF0000000000000000000000000000000404046D6D6DABABABABABAB
            6D6D6D030303000000000000000000000000000000FF00FF0000FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FF00FF0000FF00FFFF00FF1515150000000000
            0000000000000000000000000000000000000000000000000000000000000015
            1515FF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0A0A0A00
            00000000000000000000000B0B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000
            000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF0000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnCapturarFotoWebClick
        end
        object btnCapturarFotoArquivo: TSpeedButton
          Left = 149
          Top = 89
          Width = 29
          Height = 29
          Hint = 'Carregar arquivo da foto'
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
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFB0160000000000FFFF000000000017B2FF
            0000FF15000000000000FFFF00000000000017FF0000FF0000FFFFFFFFFFFFFF
            FFFFFFFFFF0000FF0000FF0000FF6200000000000000005FFF0000FF0000FF00
            00FFFF3100248A0000002AFFFF0000FF0000FF0000FFFFDE21D7FF62000AD5FF
            FF0000FF0000FF0000FFFFFFFFFFFFFF319FFFFFFF0000FF0000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFF
            FF373AFFFF0000FF0000FF0000FFFFFFFFFFFFFFFF3337FFFF0000FF0000FF00
            00FFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFF
            FF0000FF0000FF16000000000000FFFF00000000000016FF0000FFAE16000000
            0000FFFF000000000015B0FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnCapturarFotoArquivoClick
        end
        object btnLimpar: TSpeedButton
          Left = 149
          Top = 118
          Width = 29
          Height = 29
          Hint = 'Apagar foto'
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
          ShowHint = True
          OnClick = btnLimparClick
        end
        object dbiFotoCliente: TDBImage
          Left = 6
          Top = 15
          Width = 140
          Height = 132
          DataField = 'FT_CLIENTE'
          DataSource = dtsCadPadrao
          ReadOnly = True
          Stretch = True
          TabOrder = 0
          TabStop = False
          OnDblClick = dbiFotoClienteDblClick
        end
      end
      object gpbRG: TGroupBox
        Left = 15
        Top = 68
        Width = 115
        Height = 41
        Caption = 'RG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object dbeRG: TDBEdit
          Left = 6
          Top = 13
          Width = 102
          Height = 21
          DataField = 'NR_RG'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbCPF: TGroupBox
        Left = 134
        Top = 68
        Width = 124
        Height = 41
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object dbeCPF: TDBEdit
          Left = 6
          Top = 13
          Width = 112
          Height = 21
          DataField = 'NR_CPF'
          DataSource = dtsCadPadrao
          TabOrder = 0
          OnExit = dbeCPFExit
        end
      end
      object gpbNascimento: TGroupBox
        Left = 15
        Top = 123
        Width = 404
        Height = 41
        Caption = 'Data Nascimento/Funda'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        DesignSize = (
          404
          41)
        object dbeNascimento: TDBEdit
          Left = 6
          Top = 13
          Width = 71
          Height = 21
          DataField = 'DT_NASCIMENTO'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
        object edtIdade: TEdit
          Tag = 1
          Left = 80
          Top = 13
          Width = 318
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 1
        end
      end
      object gpbSexo: TGroupBox
        Left = 408
        Top = 68
        Width = 128
        Height = 41
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object dbcSexo: TDBComboBox
          Left = 6
          Top = 13
          Width = 113
          Height = 21
          Style = csDropDownList
          AutoDropDown = True
          DataField = 'DS_SEXO'
          DataSource = dtsCadPadrao
          Items.Strings = (
            'Masculino'
            'Feminino')
          TabOrder = 0
          OnEnter = dbcSexoEnter
        end
      end
      object gpbEstadoCivil: TGroupBox
        Left = 540
        Top = 68
        Width = 140
        Height = 41
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object dbcEstadoCivil: TDBComboBox
          Left = 6
          Top = 13
          Width = 126
          Height = 21
          Style = csDropDownList
          DataField = 'DS_ESTADOCIVIL'
          DataSource = dtsCadPadrao
          Items.Strings = (
            'Solteiro'
            'Casado'
            'Viuvo'
            'Separado'
            'Outro'
            'Ignorado')
          TabOrder = 0
          OnEnter = dbcEstadoCivilEnter
        end
      end
      object gpbProfissao: TGroupBox
        Left = 425
        Top = 123
        Width = 255
        Height = 41
        Caption = 'Profiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        DesignSize = (
          255
          41)
        object dbeProfissao: TDBEdit
          Left = 6
          Top = 13
          Width = 243
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DS_PROFISSAO'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbEndereco: TGroupBox
        Left = 15
        Top = 170
        Width = 855
        Height = 107
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object gpbLogradouro: TGroupBox
          Left = 102
          Top = 15
          Width = 394
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
            Width = 382
            Height = 21
            DataField = 'DS_LOGRADOURO'
            DataSource = dtsCadPadrao
            TabOrder = 0
          end
        end
        object gpbNumero: TGroupBox
          Left = 499
          Top = 15
          Width = 89
          Height = 41
          Caption = 'N'#250'mero'
          TabOrder = 2
          object dbeNumero: TDBEdit
            Left = 6
            Top = 13
            Width = 76
            Height = 21
            DataField = 'NR_NUMERO'
            DataSource = dtsCadPadrao
            TabOrder = 0
          end
        end
        object gpbComplemento: TGroupBox
          Left = 591
          Top = 15
          Width = 256
          Height = 41
          Caption = 'Complemento'
          TabOrder = 3
          object dbeComplemento: TDBEdit
            Left = 6
            Top = 13
            Width = 244
            Height = 21
            DataField = 'DS_COMPLEMENTO'
            DataSource = dtsCadPadrao
            TabOrder = 0
          end
        end
        object gpbBairro: TGroupBox
          Left = 9
          Top = 58
          Width = 359
          Height = 41
          Caption = 'Bairro'
          TabOrder = 4
          object dbeBairro: TDBEdit
            Left = 6
            Top = 13
            Width = 347
            Height = 21
            DataField = 'DS_BAIRRO'
            DataSource = dtsCadPadrao
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
            DataSource = dtsCadPadrao
            TabOrder = 0
            OnEnter = dbeCEPEnter
            OnExit = dbeCEPExit
          end
        end
        object gpbUF: TGroupBox
          Left = 380
          Top = 58
          Width = 66
          Height = 41
          Caption = 'UF'
          TabOrder = 5
          object dbcUF: TDBLookupComboBox
            Left = 6
            Top = 13
            Width = 49
            Height = 21
            DataField = 'CD_UF'
            DataSource = dtsCadPadrao
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
          Left = 456
          Top = 58
          Width = 391
          Height = 41
          Caption = 'Cidade'
          TabOrder = 6
          object dbcCidade: TDBLookupComboBox
            Left = 6
            Top = 13
            Width = 377
            Height = 21
            DataField = 'CD_MUNICIPIO'
            DataSource = dtsCadPadrao
            KeyField = 'CD_MUNICIPIO'
            ListField = 'DS_MUNICIPIO'
            ListSource = dtsMunicipio
            NullValueKey = 46
            TabOrder = 0
            OnEnter = dbcCidadeEnter
          end
        end
      end
      object gpbTelefoneResidencial: TGroupBox
        Left = 15
        Top = 300
        Width = 130
        Height = 41
        Caption = 'Telefone Resid'#234'ncial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object dbeTelefoneResidencial: TDBEdit
          Left = 6
          Top = 13
          Width = 117
          Height = 21
          DataField = 'NR_TELEFONERESIDENCIAL'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbTelefoneComercial: TGroupBox
        Left = 155
        Top = 300
        Width = 130
        Height = 41
        Caption = 'Telefone Comercial'
        TabOrder = 11
        object dbeTelefoneComercial: TDBEdit
          Left = 6
          Top = 13
          Width = 117
          Height = 21
          DataField = 'NR_TELEFONECOMERCIAL'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbCelular: TGroupBox
        Left = 296
        Top = 300
        Width = 130
        Height = 41
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        object dbeCelular: TDBEdit
          Left = 6
          Top = 13
          Width = 117
          Height = 21
          DataField = 'NR_CELULAR'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object gpbEmail: TGroupBox
        Left = 437
        Top = 300
        Width = 433
        Height = 41
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        object dbeEmail: TDBEdit
          Left = 6
          Top = 13
          Width = 417
          Height = 21
          DataField = 'DS_EMAIL'
          DataSource = dtsCadPadrao
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 262
        Top = 68
        Width = 142
        Height = 41
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object dbeCNPJ: TDBEdit
          Left = 6
          Top = 13
          Width = 130
          Height = 21
          DataField = 'NR_CNPJ'
          DataSource = dtsCadPadrao
          TabOrder = 0
          OnExit = dbeCNPJExit
        end
      end
    end
    object tbsMensalidades: TTabSheet
      Caption = 'Hist'#243'rico de Compras'
      ImageIndex = 2
      object Image2: TImage
        Left = 392
        Top = 200
        Width = 105
        Height = 105
      end
      object gpbMensalidades: TGroupBox
        Left = 9
        Top = 4
        Width = 868
        Height = 345
        Caption = 'Compras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 7
          Top = 194
          Width = 853
          Height = 144
          Caption = 'Itens'
          TabOrder = 0
          object DBGrid1: TDBGrid
            Tag = 1
            Left = 8
            Top = 15
            Width = 838
            Height = 122
            DataSource = dtsLancamentoSaidaItem
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DS_NOME'
                Title.Caption = 'Produto'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FG_UNIDADEMEDIDA'
                Title.Caption = 'Unid.Medida'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VR_UNITARIO'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_QUANTIDADE'
                Title.Caption = 'Quantidade'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VR_ACRESCIMO'
                Title.Caption = 'Acr'#233'scimo'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VR_DESCONTO'
                Title.Caption = 'Desconto'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VR_TOTALITEM'
                Title.Caption = 'Total'
                Width = 100
                Visible = True
              end>
          end
        end
        object dbgPedidos: TDBGrid
          Left = 7
          Top = 16
          Width = 853
          Height = 173
          DataSource = dtsLancamentoSaida
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_VENDA'
              Title.Caption = 'Data'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HR_VENDA'
              Title.Caption = 'Hora'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VR_TOTALVENDA'
              Title.Caption = 'Valor Venda'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_FORMAPAGAMENTO'
              Title.Caption = 'Forma Pagamento'
              Width = 150
              Visible = True
            end>
        end
      end
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 173
    Width = 208
    Height = 86
    Strings.Strings = (
      'dbeCodigo=C'#243'digo deve ser informado.'
      'dbeNome=Nome deve ser informado')
    TabOrder = 2
    ExplicitLeft = 173
    ExplicitWidth = 208
    ExplicitHeight = 86
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 410
    Top = 238
  end
  inherited qryCadPadrao: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM CAD_CLIENTE CAD_CLIENTE'
      'WHERE'
      '   CD_CLIENTE = :OLD_CD_CLIENTE')
    EditSQL.Strings = (
      'UPDATE CAD_CLIENTE CAD_CLIENTE SET'
      '   CAD_CLIENTE.CD_CLIENTE = :CD_CLIENTE, /*PK*/'
      '   CAD_CLIENTE.DS_NOME = :DS_NOME,'
      '   CAD_CLIENTE.NR_RG = :NR_RG,'
      '   CAD_CLIENTE.NR_CPF = :NR_CPF,'
      '   CAD_CLIENTE.NR_CNPJ = :NR_CNPJ,'
      '   CAD_CLIENTE.DT_NASCIMENTO = :DT_NASCIMENTO,'
      '   CAD_CLIENTE.DS_SEXO = :DS_SEXO,'
      '   CAD_CLIENTE.DS_ESTADOCIVIL = :DS_ESTADOCIVIL,'
      '   CAD_CLIENTE.DS_PROFISSAO = :DS_PROFISSAO,'
      '   CAD_CLIENTE.DS_LOGRADOURO = :DS_LOGRADOURO,'
      '   CAD_CLIENTE.NR_NUMERO = :NR_NUMERO,'
      '   CAD_CLIENTE.DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '   CAD_CLIENTE.DS_BAIRRO = :DS_BAIRRO,'
      '   CAD_CLIENTE.NR_CEP = :NR_CEP,'
      '   CAD_CLIENTE.CD_UF = :CD_UF,'
      '   CAD_CLIENTE.CD_MUNICIPIO = :CD_MUNICIPIO,'
      '   CAD_CLIENTE.NR_TELEFONERESIDENCIAL = :NR_TELEFONERESIDENCIAL,'
      '   CAD_CLIENTE.NR_TELEFONECOMERCIAL = :NR_TELEFONECOMERCIAL,'
      '   CAD_CLIENTE.NR_CELULAR = :NR_CELULAR,'
      '   CAD_CLIENTE.DS_EMAIL = :DS_EMAIL,'
      '   CAD_CLIENTE.FT_CLIENTE = :FT_CLIENTE,'
      '   CAD_CLIENTE.FG_STATUS = :FG_STATUS'
      'WHERE'
      '   CD_CLIENTE = :OLD_CD_CLIENTE')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_CLIENTE('
      '   CD_CLIENTE, /*PK*/'
      '   DS_NOME,'
      '   NR_RG,'
      '   NR_CPF,'
      '   NR_CNPJ,'
      '   DT_NASCIMENTO,'
      '   DS_SEXO,'
      '   DS_ESTADOCIVIL,'
      '   DS_PROFISSAO,'
      '   DS_LOGRADOURO,'
      '   NR_NUMERO,'
      '   DS_COMPLEMENTO,'
      '   DS_BAIRRO,'
      '   NR_CEP,'
      '   CD_UF,'
      '   CD_MUNICIPIO,'
      '   NR_TELEFONERESIDENCIAL,'
      '   NR_TELEFONECOMERCIAL,'
      '   NR_CELULAR,'
      '   DS_EMAIL,'
      '   FT_CLIENTE,'
      '   FG_STATUS)'
      'VALUES ('
      '   :CD_CLIENTE,'
      '   :DS_NOME,'
      '   :NR_RG,'
      '   :NR_CPF,'
      '   :NR_CNPJ,'
      '   :DT_NASCIMENTO,'
      '   :DS_SEXO,'
      '   :DS_ESTADOCIVIL,'
      '   :DS_PROFISSAO,'
      '   :DS_LOGRADOURO,'
      '   :NR_NUMERO,'
      '   :DS_COMPLEMENTO,'
      '   :DS_BAIRRO,'
      '   :NR_CEP,'
      '   :CD_UF,'
      '   :CD_MUNICIPIO,'
      '   :NR_TELEFONERESIDENCIAL,'
      '   :NR_TELEFONECOMERCIAL,'
      '   :NR_CELULAR,'
      '   :DS_EMAIL,'
      '   :FT_CLIENTE,'
      '   :FG_STATUS)')
    KeyLinks.Strings = (
      'CAD_CLIENTE.CD_CLIENTE')
    SQL.Strings = (
      'SELECT CAD_CLIENTE.CD_CLIENTE,'
      '       CAD_CLIENTE.DS_NOME,'
      '       CAD_CLIENTE.NR_RG,'
      '       CAD_CLIENTE.NR_CPF,'
      '       CAD_CLIENTE.NR_CNPJ,'
      '       CAD_CLIENTE.DT_NASCIMENTO,'
      '       CAD_CLIENTE.DS_SEXO,'
      '       CAD_CLIENTE.DS_ESTADOCIVIL,'
      '       CAD_CLIENTE.DS_PROFISSAO,'
      '       CAD_CLIENTE.DS_LOGRADOURO,'
      '       CAD_CLIENTE.NR_NUMERO,'
      '       CAD_CLIENTE.DS_COMPLEMENTO,'
      '       CAD_CLIENTE.DS_BAIRRO,'
      '       CAD_CLIENTE.NR_CEP,'
      '       CAD_CLIENTE.CD_UF,'
      '       CAD_CLIENTE.CD_MUNICIPIO,'
      '       CAD_CLIENTE.NR_TELEFONERESIDENCIAL,'
      '       CAD_CLIENTE.NR_TELEFONECOMERCIAL,'
      '       CAD_CLIENTE.NR_CELULAR,'
      '       CAD_CLIENTE.DS_EMAIL,'
      '       CAD_CLIENTE.FT_CLIENTE,'
      '       CAD_CLIENTE.FG_STATUS'
      'FROM CAD_CLIENTE'
      'WHERE CAD_CLIENTE.CD_CLIENTE = :CD_CLIENTE')
    Left = 375
    Top = 238
  end
  inherited dtsCadPadrao: TDataSource
    DataSet = cdsDadosCliente
    OnDataChange = dtsCadPadraoDataChange
    Left = 172
    Top = 278
  end
  object cdsDadosCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDadosClienteAfterOpen
    AfterInsert = cdsDadosClienteAfterInsert
    Left = 172
    Top = 238
    object cdsDadosClienteCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
    end
    object cdsDadosClienteDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 70
    end
    object cdsDadosClienteNR_RG: TStringField
      FieldName = 'NR_RG'
      Size = 15
    end
    object cdsDadosClienteNR_CPF: TStringField
      FieldName = 'NR_CPF'
      EditMask = '999.999.999-99;1;_'
      Size = 14
    end
    object cdsDadosClienteDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsDadosClienteDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 9
    end
    object cdsDadosClienteDS_ESTADOCIVIL: TStringField
      FieldName = 'DS_ESTADOCIVIL'
      Size = 25
    end
    object cdsDadosClienteDS_PROFISSAO: TStringField
      FieldName = 'DS_PROFISSAO'
      Size = 30
    end
    object cdsDadosClienteDS_LOGRADOURO: TStringField
      FieldName = 'DS_LOGRADOURO'
      Size = 50
    end
    object cdsDadosClienteNR_NUMERO: TIntegerField
      FieldName = 'NR_NUMERO'
    end
    object cdsDadosClienteDS_COMPLEMENTO: TStringField
      FieldName = 'DS_COMPLEMENTO'
      Size = 30
    end
    object cdsDadosClienteDS_BAIRRO: TStringField
      FieldName = 'DS_BAIRRO'
      Size = 30
    end
    object cdsDadosClienteNR_CEP: TStringField
      FieldName = 'NR_CEP'
      EditMask = '99\.999\-999;1;_'
      Size = 10
    end
    object cdsDadosClienteCD_UF: TStringField
      FieldName = 'CD_UF'
      Size = 2
    end
    object cdsDadosClienteCD_MUNICIPIO: TIntegerField
      FieldName = 'CD_MUNICIPIO'
    end
    object cdsDadosClienteNR_TELEFONERESIDENCIAL: TStringField
      FieldName = 'NR_TELEFONERESIDENCIAL'
      EditMask = '\(99\) 9999\-9999;1;_'
      Size = 15
    end
    object cdsDadosClienteNR_TELEFONECOMERCIAL: TStringField
      FieldName = 'NR_TELEFONECOMERCIAL'
      EditMask = '\(99\) 9999\-9999;1;_'
      Size = 15
    end
    object cdsDadosClienteNR_CELULAR: TStringField
      FieldName = 'NR_CELULAR'
      EditMask = '\(99\) 99999\-9999;1;_'
      Size = 15
    end
    object cdsDadosClienteDS_EMAIL: TStringField
      FieldName = 'DS_EMAIL'
      Size = 50
    end
    object cdsDadosClienteFT_CLIENTE: TBlobField
      FieldName = 'FT_CLIENTE'
      Size = 80
    end
    object cdsDadosClienteFG_STATUS: TStringField
      FieldName = 'FG_STATUS'
      Size = 10
    end
    object cdsDadosClienteNR_CNPJ: TStringField
      FieldName = 'NR_CNPJ'
      EditMask = '99.999.999/9999-99;1;_'
      Size = 18
    end
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
    Left = 273
    Top = 238
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
    Left = 306
    Top = 238
  end
  object dtsUF: TDataSource
    DataSet = qryUF
    Left = 273
    Top = 278
  end
  object dtsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 306
    Top = 278
  end
  object qryConsCliente: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM CAD_CLIENTE'
      'WHERE CAD_CLIENTE.CD_CLIENTE = :CD_CLIENTE')
    Left = 375
    Top = 278
  end
  object qryConsCodigoCliente: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT MAX(CAD_CLIENTE.CD_CLIENTE) AS CD_CLIENTE'
      'FROM CAD_CLIENTE')
    Left = 340
    Top = 278
  end
  object qryNumClientes: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT COUNT( CAD_CLIENTE.CD_CLIENTE ) NR_CLIENTE'
      'FROM CAD_CLIENTE')
    Left = 340
    Top = 238
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Title = 'Selecione a foto do Cliente'
    Left = 445
    Top = 238
  end
  object imgImpressao: TImageList
    BlendColor = clWhite
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 58
    Width = 60
    Left = 410
    Top = 278
    Bitmap = {
      494C01010100050004003C003A00FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000F00000003A000000010020000000000080D9
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEEBD6FFFCD6ACFFFAB871FFF0A559FFE7913DFFE888
      2BFFE98422FFE3811DFFE18320FFE28725FFED8931FFEE913AFFEEA250FFF6BB
      76FFFED8A8FFFFEFD6FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9EE
      E0FFF3C79EFFEEA25AFFE48A2CFFDB801DFFE27E20FFE27D1BFFE57D18FFEC80
      1AFFF0831AFFEF811BFFED7E1AFFE97C1AFFDD7E17FFE47F18FFEA8118FFE67F
      18FFDB7C1BFFD78734FFE7A661FFFCC689FFFFF0E1FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCE7D2FFF1B881FFEB8E
      31FFEC8112FFE98313FFE68212FFEE8712FFE68A19FFE58F1DFFE39320FFDE96
      20FFDD9721FFE09A24FFE59B25FFE89924FFE09828FFDE9222FFE18C1FFFE889
      21FFEA851EFFE87F16FFE77E15FFEA8118FFEC8E2FFFF8B97CFFFCE9CEFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF3D8FFFFBC77FFE38934FFE17712FFE982
      1BFFE0841BFFE08B1EFFE89A35FFE79F47FFEEB266FFF2BB70FFF4C37FFFF2C7
      88FFF2CA8FFFF4CC92FFF6CA94FFF7C892FFFAC488FFF7C583FFEEC275FFE8BA
      62FFE7B04FFFE7A13CFFE78F2AFFE5801DFFE77E17FFE47B14FFEB8935FFF3BA
      8DFFFAF1E3FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBD2ABFFE79744FFEF7E16FFE3811DFFDF8820FFE795
      28FFF1A644FFF2B86DFFF3C58BFFF4C990FFF6CA9BFFF5CB9EFFF6CCA1FFF4CC
      A2FFF0CDA1FFEFCEA0FFEFD09BFFEFD19AFFF7D39DFFF8D39FFFF5D09EFFF3CB
      97FFF8CC91FFFCCC84FFF6C26FFFEBB557FFE19C3FFFDF8723FFE58111FFE680
      0FFFE89644FFF0D6AEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFB682FFE98A29FFE17F11FFDB891AFFE1922BFFE9A754FFF3BF
      83FFF5C797FFF5C895FFF5CD99FFEECD9FFFF5D19BFFF7D09CFFF9CFA0FFFCCF
      A4FFFDD0A5FFFACFA4FFF6CFA2FFF3CFA1FFF7CEA1FFF8CFA2FFF9D1A1FFF8D0
      9FFFF7CF9EFFF6CE9DFFF1CC9AFFEFC999FFF7C97CFFEEB861FFEA9C37FFE987
      19FFEA8211FFEB892BFFF1B482FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF4
      E4FFE7A661FFEB8219FFE17D13FFE0912AFFDEA53CFFF3C278FFF3C99CFFF1C4
      9EFFF7CA9EFFF7CF9FFFF1D0A3FFEED0A7FFF7D2A6FFF6D2A4FFF6D2A4FFF9D2
      A5FFF9D3A3FFFAD5A3FFFAD5A1FFF9D59FFFFED1ABFFFACEA9FFF3CDAAFFF3CF
      ABFFF3D2ABFFF3D1A6FFF2D1A0FFF3D19CFFEDD19BFFFBCC99FFFAC487FFEEB3
      5DFFF29931FFE87814FFE27C23FFFEAD58FFFFF1DBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFEDD8FFEB9C
      5DFFEE7E1AFFEC8615FFE0952FFFF1B563FFF4C393FFF6CA95FFF3CD97FFF3D1
      9CFFF2CF9DFFF5CF9FFFFCD4A4FFF8D1A4FFF8D3A7FFF7D4A8FFF5D6A9FFF2D5
      A8FFF3D6AAFFF6D6ABFFF9D5ADFFFAD3ADFFF9D8A6FFF9D8A6FFF9D8A6FFF8D7
      A6FFF7D6A5FFFAD3A6FFFCD1A6FFFED0A7FFF9D19CFFF2CB9EFFF0CFA2FFEECC
      90FFF0BF69FFF1A53BFFE1861AFFDA7D1AFFE19B66FFFFF1D3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF1E2FFECA057FFE27E
      14FFE28C1CFFE39E37FFF5BA74FFEFC797FFF3CB9BFFF5CD9DFFF5CF9FFFF7D0
      A3FFF6D2A4FFF7D2A6FFF6D3A7FFF7D4A8FFF9D6AAFFF9D6AAFFFAD7ABFFFAD7
      ABFFFAD7ABFFFBD8ACFFFAD7ABFFFAD7ABFFFAD8ADFFFAD9ACFFF9D8ABFFFAD7
      ABFFF9D6AAFFF8D5A9FFF7D4A8FFF6D3A7FFF3D0A8FFF6D2A4FFF8D09FFFF7CF
      9EFFF3CD97FFF3C480FFEAAC4EFFD58918FFE37F19FFF19F4EFFFFF5E3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4AE61FFE27D1AFFE888
      1DFFE09C3DFFF5C081FFF8C993FFFAC89AFFF5CD9DFFF7CF9FFFF7D0A3FFF9D2
      A5FFF8D4A6FFF7D4A8FFF8D5A9FFF9D6AAFFFAD9ACFFFAD9ACFFFBDAADFFFBDA
      ADFFFBDAADFFFBDAADFFFBDAADFFFBDAADFFFCDAAFFFFCDAAFFFFBD9AEFFFBDA
      ADFFFAD9ACFFFAD7ABFFF9D6AAFFF8D5A9FFF6D4A9FFF8D4A6FFF9D1A1FFF6CF
      A2FFF3CF9FFFF8D096FFFCC87BFFF3B458FFDC8B1CFFE47D26FFF1A55CFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6B97BFFDE811EFFE6890AFFE79F
      3AFFFBBA83FFF8C59AFFEDC99BFFF5CEA1FFF5CEA1FFF7D0A3FFF8D4A6FFFAD5
      A9FFF9D6AAFFFAD7ABFFFBD9AEFFFCDAAFFFFDDBB0FFFDDBB0FFFDDBB0FFFEDC
      B1FFFEDCB1FFFEDCB1FFFEDCB1FFFEDCB1FFFCDCB1FFFCDCB1FFFCDCB1FFFBDB
      B0FFFDDBB0FFFCDAAFFFFBD9AEFFFAD9ACFFF8D6ABFFFBD7A9FFFBD5A5FFF6D1
      A5FFF0CDA5FFF1CEA2FFF8CF98FFF6C684FFE9AF50FFEE851EFFEC7F13FFECBC
      82FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7D4ACFFED8220FFE78024FFE59D37FFF2BE
      72FFFCC298FFFBC798FFEFCC9AFFE7D19DFFF6D1A5FFF8D3A7FFF8D5A9FFFAD7
      ABFFFBD9AEFFFCDAAFFFFBDBB0FFFDDDB4FFFDDDB4FFFDDDB4FFFEDEB5FFFEDE
      B5FFFEDEB5FFFEDEB5FFFEDEB5FFFEDEB5FFFCDEB5FFFCDEB5FFFCDEB5FFFEDE
      B5FFFDDDB4FFFCDCB1FFFBDBB0FFFBDBB0FFF5D8ACFFFAD9ACFFFCD8AAFFFBD6
      AAFFF3D0A8FFF0CCA6FFF3CEA2FFF1C998FFF5C689FFEBA442FFE58619FFEB86
      24FFF5D0AEFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF4DEFFE09743FFF28317FFDD8D2EFFF1B07DFFF4BE
      8FFFF6D096FFEECA9CFFF8D2A2FFF2D29DFFF6D3A7FFF8D5AAFFF9D7ACFFFBD9
      AEFFFBDBB2FFFCDCB3FFFBDDB4FFFDDFB6FFFDDEB7FFFDDEB7FFFDDEB7FFFEDF
      B8FFFEDFB8FFFEDFB8FFFEDFB8FFFEDFB8FFFCDFB8FFFCDFB8FFFCDFB8FFFDDE
      B7FFFDDFB6FFFCDEB5FFFBDDB4FFFBDDB4FFF7DBB2FFFBDBB0FFFBD8ACFFFDD8
      ACFFFAD4AAFFF7D1A7FFF8D1A5FFF6CDA0FFF7CA9EFFE9C37BFFE49D3BFFEE80
      16FFF59841FFFFF2E2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8BF82FFE48214FFE4891DFFE5AB5FFFEFC094FFF7C6
      9AFFEFCA96FFF2D0A5FFF3CAA3FFFED5A8FFF7D5AAFFF9D7ACFFFADAB1FFFCDC
      B3FFFBDDB4FFFCDDB6FFFBDEB7FFFDE0B9FFFDE0B9FFFDE0B9FFFDE0B9FFFEE1
      BAFFFEE1BAFFFEE1BAFFFEE1BAFFFEE1BAFFFCE1BCFFFCE1BCFFFCE1BCFFFDE0
      B9FFFDE0B9FFFCDFB8FFFBDEB7FFFBDEB7FFF8DEB6FFF9DDB4FFF9D9AEFFFBD8
      ADFFFCD7ABFFFAD3A6FFFAD1A4FFF5CD9DFFF3CB97FFF2CA99FFEEB969FFE18C
      1FFFF28015FFF1B783FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFEBCCFFE18C30FFE88015FFE6A043FFEFB984FFEDC993FFEFC7
      93FFF5C89DFFF3CC9FFFF9D4AEFFF8D2A8FFF8D8AFFFFADAB1FFFCDCB3FFFCDD
      B6FFFBDEB7FFFCDFB8FFFBE0BBFFFDE2BDFFFDE2BDFFFDE2BDFFFEE3BEFFFEE3
      BEFFFEE3BEFFFEE3BEFFFEE3BEFFFEE3BEFFFDE3BEFFFDE3BEFFFEE3BEFFFDE2
      BDFFFDE2BDFFFCE1BCFFFCE2BAFFFBE1B9FFFBDFB6FFFCE0B7FFF8DBB4FFFCDB
      B4FFFDDBB0FFFCD7ABFFF9D5A7FFF5D1A3FFF6D39BFFFAC79CFFF2C690FFEBAB
      4DFFE47F1CFFEA8E35FFFDECD2FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EBB275FFE6831BFFE98624FFE6AF72FFFBC487FFB8B8B7FFAFB0
      ADFFA9A9A6FFA6A8A4FFB0B2AEFFC0C1BFFFBFBFBFFFBEBEBFFFBEBEBEFFBEBE
      BEFFC0C1BEFFC3C4C0FFC3C4C0FFC4C5C1FFC6C8C3FFC5C6C2FFC3C4C0FFC4C5
      C2FFC3C3C1FFC1C1BFFFBFC0BFFFC0C1BFFFC0C1BFFFBEBEBDFFC0C0BFFFC1C2
      C0FFC0C1BFFFC2C2C1FFC0C1BFFFC1C2C0FFC1C2C0FFC2C2C1FFC3C3C3FFC4C4
      C4FFC4C4C4FFC6C6C6FFC8C8C7FFC7C8C6FFC1C3C1FFC6C6C6FFF2C89BFFECBB
      75FFEF9530FFDA7D16FFF5BA72FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF6DCFFF78F2CFFE1811DFFE69C54FFF0BA83FFF1C28CFFB3B3B3FFCCCC
      CCFFBDBDBDFFC3C3C4FFDFDFE0FFF7F7F7FFF3F3F3FFF1F1F1FFF2F2F2FFF3F3
      F3FFF2F2F2FFF2F2F2FFF4F4F4FFF2F2F2FFF2F2F2FFF2F2F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF2F2F2FFF1F1F1FFF1F1F1FFF0F0F0FFF0F0
      F0FFF0EFEFFFEFEFEFFFF0F0F0FFF1F1F1FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2
      F2FFF2F2F2FFF3F3F3FFF5F6F5FFF4F4F4FFF7F6F7FFC7C7C7FFF5CD99FFF7C1
      84FFEBA859FFDE8513FFE68E34FFFFF1E1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EAC89DFFE77D18FFE2882AFFF7B26DFFF2BC85FFF2C38DFFBABABAFFCCCC
      CCFFCCCCCCFFEFEFEFFFFAFAFAFFF2F2F2FFF3F3F3FFF2F2F2FFF3F3F3FFF2F2
      F2FFF2F2F2FFF3F3F3FFF4F4F4FFF3F3F3FFF3F3F3FFF4F4F4FFF4F4F4FFF5F5
      F5FFF5F5F5FFF6F6F6FFF7F6F6FFF7F8F8FFF7F7F7FFFBFBFBFFE5E5E5FFC1C1
      C1FFD7D8D8FFBEBEBEFFEEEEEEFFF8F8F8FFF6F6F6FFF5F5F5FFF4F4F4FFF6F6
      F6FFF7F7F7FFF6F6F6FFF6F6F6FFF7F7F7FFFAFAFAFFCCCCCCFFF2CEA0FFF8C9
      95FFF3B775FFE58F25FFE2811FFFF4C599FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3A460FFEA811AFFE69643FFF5B876FFF2BF87FFF3C490FFB6B6B6FFCFCF
      CFFFC4C4C4FFCACACAFFC8C8C8FFDBDBDBFFF6F6F6FFF7F7F7FFF5F5F5FFF5F5
      F5FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
      F6FFF5F5F5FFF4F4F4FFF6F6F6FFF6F6F6FFF6F6F6FFF8F8F8FFEDEDEDFFDADA
      DAFFE5E5E5FFDCDCDCFFF3F3F3FFF8F8F8FFF7F7F7FFF7F7F7FFF7F7F7FFF6F6
      F6FFF7F7F7FFF7F7F7FFF6F6F6FFF7F7F7FFFBFBFBFFCBCBCBFFE9C99EFFEEC7
      9BFFF2C08BFFEB9D40FFE87F16FFF0A458FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDEB
      E0FFE3892BFFE8831DFFE8A35AFFF1BB7EFFF4C08BFFF5C692FFB7B7B7FFDDDD
      DDFFD0D0D0FFCCCCCCFFC9C9C9FFDEDEDEFFFBFBFBFFFCFCFCFFFAFAFAFFFAFA
      FAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFAFA
      FAFFFAFAFAFFF9F9F9FFFAFAFAFFFDFDFDFFFBFBFBFFFAFAFAFFFCFCFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFFAFAFAFFFBFBFBFFFBFBFBFFFBFBFBFFFCFC
      FCFFFAFAFAFFF9F9F9FFFAFAFAFFFBFBFBFFFDFDFDFFCDCDCDFFEFCEA1FFEFC8
      9CFFF3C596FFF0AB5CFFE8811AFFEC8D2CFFFFEBDCFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8D1
      B5FFE87D14FFE78928FFEEAE6DFFF0BE84FFF2C08CFFF4C794FFBDBDBDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFFBFBFBFFFBFBFBFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFFCFCFCFFFCFCFCFFFBFBFBFFFAFA
      FAFFFCFCFCFFFDFDFDFFFAFAFAFFF2F2F2FFF9F9F9FFFDFDFDFFFCFCFCFFFBFB
      FBFFFBFBFBFFFBFBFBFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFAFAFAFFF7F7
      F7FFFCFCFCFFFEFEFEFFFCFCFCFFFCFCFCFFFEFEFEFFCFCFCFFFF7D4A2FFF6C9
      96FFF6C696FFF2B772FFE5852BFFE3811DFFF9D3B1FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0B5
      83FFF18319FFEA983FFFF0B577FFE9B880FFF2C08CFFF4C794FFBCBCBCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFF9F9F9FFFCFCFCFFEDEDEDFFC3C3C3FFE6E6E6FFFCFCFCFFF8F8F8FFF8F8
      F8FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF8F8F8FFFDFDFDFFE7E7E7FFC2C2
      C2FFE9E9E9FFFFFFFFFFF7F7F7FFF7F7F7FFFAFAFAFFD0D0D0FFF6D3A1FFF7C8
      92FFF4C391FFF2BE82FFE89141FFE2801CFFF3B67EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E99D
      55FFE87F1EFFE29B4BFFF1B579FFEFBC84FFF0BF8DFFF2C796FFB8B8B8FFE6E6
      E6FFD9D9D9FFDEDEDEFFDFDFDFFFDBDBDBFFE0E0E0FFE7E7E7FFE5E5E5FFE8E8
      E8FFDFDFDFFFE3E3E3FFE0E0E0FFEAEAEAFFE1E1E1FFDFDFDFFFE3E3E3FFE8E8
      E8FFFCFCFCFFFFFFFFFFF9F9F9FFE7E7E7FFF6F6F6FFFFFFFFFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFF6F6F6FFE4E4
      E4FFF5F5F5FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFD0D0D0FFF2D1A4FFFBCC
      98FFF5C693FFEEBF89FFEC9B50FFE07D15FFEF9F52FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EC94
      40FFE7832AFFE4A359FFF4B779FFF1BB84FFF0BF8DFFF2C796FFBABABAFFD3D3
      D3FFBDBDBDFFC0C0C0FFBFBFBFFFBABABAFFC4C4C4FFC5C5C5FFBEBEBEFFD0D0
      D0FFBCBCBCFFBDBDBDFFBFBFBFFFD3D3D3FFBFBFBFFFB7B7B7FFBBBBBBFFC9C9
      C9FFF8F8F8FFFCFCFCFFFCFCFCFFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFDFDFDFFFFFF
      FFFFFDFDFDFFFBFBFBFFFDFDFDFFFDFDFDFFFEFEFEFFD1D1D1FFE8CDA8FFF7CD
      9EFFF3C595FFEBBF8AFFF7A65BFFE98313FFEF9439FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EA8A
      2DFFEB8A30FFECA964FFE8B478FFF0BA83FFEFBE90FFF4C697FFBEBEBEFFFBFB
      FBFFF7F7F7FFF7F7F7FFF7F7F7FFF5F5F5FFF8F8F8FFF7F7F7FFF5F5F5FFF6F6
      F6FFF4F4F4FFF4F4F4FFF4F4F4FFF7F7F7FFF4F4F4FFF3F3F3FFF4F4F4FFF4F4
      F4FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF9F9F9FFF8F8
      F8FFF8F8F8FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF7F7
      F7FFF7F7F7FFF8F8F8FFF8F8F8FFF8F8F8FFFAFAFAFFD2D2D2FFF6D3A8FFF0C9
      9DFFF5C692FFF3BF8AFFF3AE69FFE0821EFFE78C29FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E687
      2AFFEB8A32FFEEAB66FFE9B579FFF1BB84FFF0BF8FFFF3C595FFBCBCBCFFE1E1
      E1FFDBDBDBFFD1D1D1FFCACACAFFD8D8D8FFD4D4D4FFD5D5D5FFDBDBDBFFF0F0
      F0FFF6F6F6FFF6F6F6FFF6F6F6FFF5F5F5FFF6F6F6FFF7F7F7FFF6F6F6FFF7F7
      F7FFF6F6F6FFF4F4F4FFF5F5F5FFF4F4F4FFF5F5F5FFF6F6F6FFF7F7F7FFF6F6
      F6FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
      F8FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFBFBFBFFD2D2D2FFF6D3A8FFF0C9
      9DFFF4C591FFF2BE89FFF4B06DFFE28522FFE48622FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E083
      28FFE98D34FFF0AD68FFEBB578FFF0BB82FFEFBF8BFFF4C592FFB9B9B9FFC9C9
      C9FFCBCBCBFFC7C7C7FFC2C3C3FFBEBEBEFFB6B6B6FFBCBCBCFFCECECFFFF4F5
      F5FFFBFBFBFFF9F9FAFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF8F8
      F9FFF9F9FAFFF9F8F9FFF9F9FAFFF9F9F9FFF9F9F9FFFAFAFAFFFAFAFAFFF9F9
      F9FFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFF9FAFAFFF9F9F9FFF9F9F9FFF9F9
      F9FFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFCFCFCFFD1D1D1FFF6D1A5FFF3CA
      9DFFF4C490FFEFBD89FFF5B372FFE28829FFE7821FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DC84
      2AFFE88F37FFF1AE69FFECB578FFEEB980FFF1BF8AFFF4C591FFC0C0C0FFFBFA
      F8FFF7F6F4FFF8F6F5FFF9F7F5FFF9F7F6FFF9F7F6FFF9F7F6FFF7F5F4FFF4F3
      F1FFF5F3F2FFF5F3F2FFF6F4F3FFF6F4F3FFF6F4F3FFF6F4F3FFF7F5F4FFF8F6
      F5FFF7F5F4FFF7F5F4FFF8F6F5FFF8F6F5FFF8F7F6FFF8F6F6FFF8F7F6FFF8F7
      F6FFF8F7F6FFF9F8F7FFF9F8F7FFF9F7F7FFFAF7F7FFFAF9F7FFFAFAF8FFFAF9
      F8FFFAF9F8FFFBF9F9FFFAF9F9FFF9FAF9FFFBFCFBFFD1D1D1FFF5CEA2FFF2C9
      9CFFF3C38FFFEFBD89FFF3B373FFE2892EFFE88321FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DE8A
      31FFE28F39FFF1AB68FFEFB377FFEDB97DFFF0BF87FFF2C38FFFC3C3C2FFE2E0
      D9FFD4D0C8FFD4D0C9FFD3D0C8FFD3CFC7FFD2CEC7FFCFCCC5FFCFCCC4FFD0CC
      C5FFCFCCC5FFCFCBC5FFD0CCC5FFD2CFC7FFD3CFC8FFD2CFC8FFD3D0C9FFD5D1
      CAFFD2CFC7FFD2CEC7FFD3CFC8FFD2CEC7FFD1CCC7FFD2CDCAFFD1CDC8FFD3CE
      CAFFD3CECAFFD5CFCCFFD7D0CDFFD7D1CEFFD5D0CDFFD6D2CEFFD6D3CEFFD6D3
      CEFFD7D3D0FFDBD6D2FFDBD7D4FFD8D7D3FFDDDDD9FFCECECEFFF2CB9FFFF1C7
      98FFF2C28EFFEFBD89FFF1B073FFE2892EFFE58528FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E495
      3EFFDE8E39FFEDA764FFEFB175FFEDB97DFFF1BE86FFF1C18DFFBFBFBFFFE8E7
      E5FFDCD8D7FFDFDCD9FFE0DDDAFFDFDCDAFFE1DEDBFFE1DEDAFFDEDAD8FFDCD7
      D5FFDED9D6FFDCD7D4FFDCD7D3FFDDD9D5FFDEDAD7FFDEDAD7FFDDD9D6FFDDD9
      D5FFDDD9D5FFDCD8D4FFDBD7D4FFD9D4D3FFDAD6D2FFDBD7D2FFDAD7D2FFDBD8
      D2FFDCD9D4FFDBD9D3FFDBD8D2FFDBD9D3FFDAD7D2FFDDD8D3FFDFD9D4FFDFDB
      D4FFDFDBD6FFDFDBD6FFE0DCD7FFE2DED9FFE6E4DFFFD0D0CFFFF2CB9FFFEFC5
      96FFF3C18CFFF0BB88FFECAC6CFFE38A2FFFE38C36FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0A3
      4CFFDC913BFFEAA363FFEFB074FFEBB87AFFEFBC84FFF1C18DFFBCBCBCFFD8D8
      D9FFC0C0C1FFC4C5C5FFC6C6C7FFCACACBFFDFDEDDFFEAE6E3FFDBD8D2FFDAD6
      D1FFDAD6D1FFDAD5D0FFD9D5D0FFD6D1CEFFD9D4D1FFDAD4D2FFDAD4D2FFD9D3
      D0FFD9D4D1FFD8D3D1FFD7D2CEFFD7D2CCFFD7D3CDFFD9D5CFFFD8D5CFFFD9D5
      CFFFDCD8D2FFDBD8D2FFDAD6D0FFD9D7D0FFDAD6D0FFDBD7D1FFDCD9D3FFDFDB
      D5FFDEDBD5FFDEDAD4FFE0DCD5FFE0DDD6FFE8E3DEFFD0D0CFFFF3CDA3FFEEC4
      95FFF3BF8AFFF1BB86FFE9A667FFE78C31FFE99C4DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAAF
      59FFDF9340FFE8A161FFEDAE72FFE9B678FFEDBA82FFF2C18FFFBFBFBFFFE7E7
      E7FFD9D9D9FFD6D6D6FFD3D3D3FFD6D7D7FFDDDDDCFFDEDCD8FFD9D7D1FFDEDB
      D7FFDFDCD7FFDFDCD7FFDEDAD5FFDCD8D6FFDDD9D6FFDEDAD8FFDEDAD7FFDCD8
      D4FFDBD7D4FFDCD8D5FFDBD8D3FFDCD8D3FFDBD7D2FFDAD7D2FFDBD7D1FFDBD7
      D2FFDCD9D4FFDAD7D3FFDAD6D2FFDAD7D1FFDAD6D1FFD9D7D2FFDAD7D2FFDCD9
      D4FFDBD8D3FFDBD7D2FFDCD8D4FFDCD8D3FFE2DEDBFFD0CFCFFFF6D0A6FFEEC4
      95FFF2BE89FFF1BB86FFE6A463FFEA9032FFF0AC5FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEC4
      95FFE39042FFEE9C4EFFECB375FFEAAF77FFEFB87FFFF1C79AFFBFBFBFFFCACA
      CAFFC1C1C1FFC6C6C6FFD6D6D6FFC7C7C7FFC3C3C2FFBABBBAFFCBCACAFFF5F4
      F5FFFFFDFFFFFDFCFDFFFCFCFCFFFCFCFCFFFCFCFBFFFCFCFBFFFCFCFBFFFCFB
      FAFFFCFBFAFFFCFBFAFFFCFBFCFFFCFBFCFFFCFBFCFFFBFBFBFFFBFAFAFFFAF9
      FAFFF9F9F9FFF8F7F8FFF8F7F8FFF8F8F9FFF8F7F7FFF7F6F6FFF7F5F6FFF5F4
      F5FFF6F3F5FFF6F4F5FFF4F4F5FFF4F4F5FFFAF9FAFFD2D2D2FFF8D5B4FFF1C6
      9FFFE9BE85FFF4BE81FFE59C58FFEC9037FFEEC398FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8DC
      BAFFE29447FFEB9C4BFFEBAE6AFFE9B279FFEEBA85FFF3CBA1FFBDBDBDFFD8D8
      D8FFD7D7D7FFD8D8D8FFE0E0E0FFDADADAFFDCDCDCFFDADADAFFE0E0E0FFF1F1
      F1FFF8F8F8FFF7F7F7FFF6F7F7FFF7F7F7FFF7F7F7FFF8F7F7FFF7F7F8FFF7F8
      F8FFF8F8F8FFF8F8F9FFF9F9F9FFF9F9F9FFF9F9F9FFFAFAFAFFFAFBFBFFFAFB
      FBFFFAFBFAFFFAFBFBFFFBFCFCFFFAFBFBFFFAFAFBFFFAFBFBFFFAFBFBFFFBFB
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFDFDFFFEFEFFFFD0D0D0FFF6D6B9FFF4D1
      A6FFEDBE86FFECB376FFDE9852FFEA9139FFF9DABBFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF4
      E2FFE29F5AFFE89A47FFEAA75CFFE7B077FFEDBF8FFFF7D2ACFFB7B7B7FFD5D5
      D5FFE0E0E0FFDDDDDDFFD8D8D8FFD6D6D6FFD6D6D6FFDADADAFFD7D7D7FFD3D3
      D3FFCACACAFFCDCDCDFFC7C7C7FFD2D2D2FFD1D1D1FFC8C8C5FFC7C6C5FFC7C6
      C5FFCAC8C7FFCAC7C7FFC9C7C7FFC5C4C5FFC7C8C6FFD3D4D2FFCFCFCEFFCCCD
      CCFFD3D4D2FFCBCAC9FFC6C5C5FFC5C5C4FFC7C5C5FFC6C5C6FFC7C6C6FFCAC8
      C8FFCAC8C8FFCACACAFFCBCACAFFCDCCCCFFCCCBCBFFC0BFBEFFF5D4BAFFF4D8
      AFFFF1C28EFFECAC6CFFE1984EFFED9E4FFFFFF3E3FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6B583FFE99745FFEBA356FFEAAE72FFEFC699FFF7D4B3FFC2C2C2FFDADA
      DAFF9B9B9BFF9B9B9BFF9E9E9EFFB6B6B6FFA8A8A8FFA4A4A4FF979797FF9E9E
      9EFFA5A5A5FFB8B8B8FFEBEBEBFFBFBFBFFFC7C7C7FFE0DFDDFFD5D4D0FFD7D5
      D2FFD8D3CEFFD7D2CEFFD3CFCEFFE7E6E5FFE1E1E1FF9A9A9BFFAAAAA9FFB6B7
      B6FF9D9D9DFFCCCBCAFFD8D6D4FFD5D3CFFFD7D3CFFFD7D3CFFFD6D4D0FFD6D3
      CFFFD7D4CFFFD8D5D2FFD8D7D2FFD8D8D2FFDCDBD8FFCCCAC8FFF6D3B9FFF2D8
      B3FFF0C898FFF0A560FFE29447FFEDB679FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5D7BCFFE7994CFFEB9E55FFEEAC6BFFF2CB9FFFF4D5B6FFC3C3C3FFEAEA
      EAFF8F8F8FFF9E9E9EFFA7A7A7FFBEBEBEFFA7A7A7FFA7A7A7FF979797FFA2A2
      A2FFA5A5A5FFBEBEBEFFFAFAFAFFCDCDCDFFCACACAFFF1F0EEFFE6E6E3FFE9E8
      E4FFE8E6E0FFE6E4DEFFE4E1E0FFF8F7F7FFF7F7F8FFCDCCCEFFDCDCDDFFD7D7
      D8FFB9B9BAFFE2E1E1FFE4E2E2FFE1DFDBFFE3DFD9FFE1DED9FFE2DDD9FFE2DE
      D9FFE1DDD8FFE1DCD8FFE1DED9FFDFE0D9FFE6E7E1FFD1D0CFFFFBD7B9FFF3D9
      BBFFEAC89AFFEE9D52FFE5934BFFF6D8B5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5A66CFFE59750FFEBA55FFFF5CBA0FFF8D9BAFFC1C1C1FFBFBF
      BFFFBEBEBEFFBEBEBEFFBFBFBFFFC0C0C0FFBEBEBEFFC2C2C2FFBFBFBFFFC1C1
      C1FFBEBEBEFFC4C4C4FFC7C7C7FFCBCBCBFFCCCCCCFFCCCCCCFFCBCCC9FFCCCC
      CAFFCDCDCBFFCACACAFFCACACAFFCCCCCCFFCDCDCDFFCFCFCFFFCFCFCFFFD1D1
      D1FFD4D4D4FFD1D1D1FFD0CFD0FFD1D2D1FFD1D2D1FFCFD1D0FFD0D1D0FFD1D1
      D1FFCFD0CFFFCFD0CEFFCECFCEFFCECFCDFFCFD0CEFFC0C0C0FFFBDBBEFFF8DB
      C0FFE7BF8BFFE5974AFFEAA56CFFFEF6E9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0CAA8FFE99D55FFE29E51FFEFC598FFFEDDBCFFF3DAC0FFF8DD
      C2FFF6DEC2FFF5E0CAFFF5E1CFFFFCE5CFFFF9E8D5FFFAE8D7FFFBEBDAFFFCED
      DDFFFBEEE0FFFAEEE2FFFCF0E4FFFCF2E8FFFCF2E8FFFCF3E9FFFDF4EAFFFDF4
      EAFFFDF4EBFFFDF4EBFFFEF5ECFFFCF5ECFFFEF5ECFFFEF5ECFFFDF4EAFFFEF4
      EAFFFDF3E9FFFCF2E8FFFCF0E6FFFBEFE5FFFDF0E2FFFBEEE0FFFBECDCFFFAEA
      D9FFFBEAD7FFF8E7D2FFF8E6CFFFF6E4CDFFF9E1C9FFF9E1C5FFF6DEC6FFFADB
      BCFFE7AB6FFFE69B56FFF5C9A4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFEFDEFFF5AC62FFE09E4FFFE7B98AFFFFDDBBFFF5DDC1FFF5E0
      C1FFF7E2C6FFF5E4CFFFF4E3D0FFFEE7D1FFF9E8D5FFFBE9D8FFFBEBDAFFFBEC
      DCFFFBEEE0FFFAEEE2FFFCF0E4FFFBF1E7FFFCF2E8FFFCF3E9FFFDF4EAFFFDF4
      EAFFFDF4EBFFFDF4EBFFFDF4EBFFFCF5ECFFFEF5ECFFFDF4EBFFFDF4EAFFFDF3
      E9FFFDF3E9FFFCF2E8FFFCF0E6FFFBEFE5FFFDF0E2FFFBEEE0FFFBECDCFFFAEA
      D9FFFBEAD7FFF9E8D3FFF9E7D0FFF7E5CEFFFFE5CAFFFDE1C9FFECDECCFFF5D5
      B1FFE89D58FFEEAA69FFFFEFD9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFCEADFFEB9B54FFE7A467FFFED7B1FFF6E8CCFFEEDD
      C8FFF8E2D7FFF1DECFFFFBE9D2FFFDE7D5FFF9E9D8FFFAEAD9FFFBECDCFFFAED
      DDFFFBEEE0FFFAEFE1FFFAF1E4FFFBF2E5FFFCF1E9FFFBF2E9FFFCF3EAFFFDF4
      EBFFFDF4EBFFFDF4EBFFFDF4EBFFFBF4EBFFFDF4EBFFFCF3EAFFFCF3EAFFFBF2
      E8FFFBF2E8FFFBF1E7FFFBF1E7FFFBF1E7FFFFEFE2FFFCECE0FFFDF1DFFFFAEE
      D6FFF7E8D5FFFDE7DCFFF8E5D8FFF4E8D0FFFFE8CAFFF3E0CBFFF7E6D3FFE7BB
      85FFE39D50FFFACDABFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF6E4FFECB281FFE69C4EFFE6BC91FFFDE3D3FFFFE7
      D3FFF7E5C8FFFBEAD5FFF8E2D6FFFAE9D6FFFAEAD9FFFBEBDBFFFBECDCFFFAED
      DFFFFBEEE0FFFAEEE2FFF9F0E3FFFAF1E4FFFCF1E9FFFCF1E9FFFDF2EAFFFCF3
      EAFFFDF4EBFFFDF4EBFFFDF4EBFFFDF4EBFFFDF4EBFFFDF4EBFFFCF3E9FFFDF3
      E9FFFCF2E8FFFCF2E8FFFBF1E7FFFBF1E7FFFDF0E2FFFFEFE2FFF9ECDEFFF7EA
      DAFFFFF0DDFFFFECD6FFF8E5D0FFF5EBD9FFFCE8CFFFEDE7DCFFF4D1AFFFEAA1
      5DFFF0B682FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAE1CDFFF0AC63FFDFA064FFF7D6B5FFF3E9
      D7FFFFE9D0FFFFE7D2FFF9E8DBFFF7ECD8FFFBEBDBFFFBEBDEFFFDEDE0FFFCEF
      E1FFFDEFE3FFFBEFE3FFFCF0E4FFFAF0E6FFFCF2E8FFFCF2E8FFFDF3E9FFFDF3
      E9FFFDF4EAFFFDF4EAFFFDF4EAFFFDF4EAFFFDF4EAFFFDF4EAFFFDF3E9FFFDF3
      E9FFFCF2E8FFFCF2E8FFFCF3E6FFFBF2E5FFFCF1E3FFFDEDDCFFFEEDE0FFF8EC
      E8FFF3E7E1FFF9EBD8FFFFF0D5FFFCEAD3FFF8EEDDFFF5E2CDFFE9AE76FFF2A6
      64FFFFE0CBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7CFACFFE69F5BFFE9B26FFFF8EA
      CEFFF5E9E5FFFFE8DEFFFAEBD8FFF7F0DDFFFCECE0FFFDEDE1FFFCEEE2FFFEF0
      E4FFFDF1E7FFFDF1E7FFFCF2E8FFFCF2E8FFFDF3E9FFFDF3E9FFFEF4EAFFFDF4
      EAFFFEF5EBFFFEF5EBFFFEF5EBFFFEF5EBFFFDF4EBFFFDF4EAFFFDF4EAFFFDF3
      E9FFFDF3E9FFFCF2E8FFFCF2E8FFFCF3E6FFFBF2E5FFFEF2E6FFFCECE5FFFEEA
      E9FFF9ECE4FFF4EDDCFFFAF1DDFFFCECDCFFFCE9D4FFF2BB88FFE19E5FFFF5D1
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDCA9EFFE3A055FFEBB2
      7BFFFAEDDDFFF5F2EDFFF9EBDFFFFBEFE3FFFAEEE4FFFBEFE5FFFCF0E6FFFDF1
      E7FFFCF1E9FFFDF2EAFFFDF2EAFFFDF2EAFFFDF4EBFFFDF4EBFFFEF5ECFFFEF5
      ECFFFEF5ECFFFCF5ECFFFCF5ECFFFCF5ECFFFEF5ECFFFEF5ECFFFDF4EBFFFDF4
      EBFFFDF4EBFFFCF3E9FFFDF3E9FFFDF3E9FFFAF2E5FFF5F2EEFFF8EFECFFFFEE
      E4FFFFEDDDFFF8F1E0FFFAF6EBFFFBEBE4FFEFBB92FFE4A05FFFF2C899FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3C193FFECA5
      5BFFF1BE8CFFFEEFDFFFF7F1ECFFFCF1E9FFFBF2E9FFFBF2E9FFFBF2E9FFFBF2
      E9FFFCF3EAFFFDF4EBFFFDF4EBFFFBF4EBFFFCF5ECFFFCF5ECFFFDF6EDFFFDF6
      EDFFFDF6EDFFFBF6EDFFFBF6EDFFFBF6EDFFFDF5EEFFFDF5EEFFFDF5EEFFFDF5
      EEFFFCF4EDFFFCF5ECFFFEF5ECFFFEF5ECFFFDF3E9FFF9F1EAFFFEF3EBFFFFF4
      EBFFFCF3EFFFFDF8F5FFFDE8D3FFE9BE93FFE69B63FFEDC398FFFEF8E5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDC8
      94FFE19B5FFFECB88FFFFFEFD8FFFFFAECFFFEF5F1FFFDF5EEFFFCF4EDFFFCF4
      EDFFFDF5EEFFFCF6EFFFFCF6EFFFFCF6EFFFFCF6EFFFFCF6EFFFFDF7F0FFFDF7
      F0FFFBF8F0FFFBF8F0FFFBF8F0FFFBF8F0FFFBF7F2FFFDF7F2FFFDF7F2FFFDF7
      F2FFFCF6F1FFFCF6EFFFFCF6EFFFFCF6EFFFFFF5EDFFFFFAF0FFFFF7EAFFF7F5
      EDFFFDF9F4FFFCE3D3FFE9B88CFFE09F5AFFEFC499FFFFF4E6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5CC9BFFE5A05BFFE4AE7FFFF6E1CBFFFFFAF5FFFFF9F4FFFEF8F3FFFDF7
      F2FFFEF8F3FFFEF8F1FFFEF8F1FFFEF8F1FFFCF8F3FFFCF8F3FFFDF9F4FFFDF9
      F4FFFDF9F4FFFDF9F4FFFCF9F4FFFCF9F4FFFCF7F4FFFCF7F4FFFCF7F4FFFCF7
      F4FFFCF8F3FFFEF8F3FFFDF7F2FFFDF7F2FFFFF7F3FFFAF5F2FFF8FDFBFFF8FC
      F0FFF7DBB8FFE8A86EFFE6A064FFFCCA96FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1D1BAFFE5A777FFF1A05CFFE4C4A7FFFFF1DEFFFFFFF9FFF9F9
      F9FFFFFAF9FFFFFBF7FFFFF9F0FFFDFCF2FFFFFAF3FFFFFBF6FFFFFBF8FFFFFA
      FBFFFDF8FAFFFEF7FAFFFFF9FAFFFFF8FAFFFEF9FBFFFEF9FAFFFDFAF6FFFEFB
      F3FFFDF9F4FFFEF9F6FFFFFAFBFFFFFAFDFFF7FFFFFFFFFFFAFFFDEBD4FFF0C0
      90FFE5A160FFE8AC71FFF4D7B8FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAE5C5FFE3C08EFFE4A65FFFE1AB6EFFF1CAA3FFFFF0
      DFFFFDFCFEFFF4FBFFFFFBFEFFFFFFFEFDFFFFFFFBFFFDFCF8FFF8F9F7FFF8FB
      F9FFFBFEFCFFFDFEFAFFFEFEF8FFFFFEF6FFFFFBF8FFFFFEFDFFFFFDFDFFF9FB
      FCFFFAFCFDFFFDFFFFFFFFFFFEFFFCFBF7FFFFE8D8FFF2C7A0FFE7A767FFE6A5
      61FFECC18EFFF6E5CBFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFAE5FFF9D1AEFFECB485FFE29F62FFE5A5
      65FFE8BE89FFF0DDBCFFF7F1E4FFFBF9F8FFFFFCFBFFFFFFFFFFFDFFFFFFFBFF
      FFFFFAFFFFFFF9FEFFFFF9FFFEFFF9FFFDFFFFFFF7FFFFFFFBFFF9FEFFFFFAFE
      FFFFFFFDFEFFFFF3E6FFFADBBCFFEBC399FFE6A162FFE7A467FFEEB582FFF5D6
      B7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBF2E5FFF0D1B0FFE9B6
      7EFFE8AA64FFE4A35EFFE2A56DFFEEB386FFE2BC9CFFF4D0B2FFFFE4CBFFFFED
      DBFFFFF2E7FFFFF7F1FFFFF7F7FFFBF5F6FFF3F0E1FFF2E7D3FFF0D8BCFFEEC7
      A1FFEAB785FFE7AB70FFE5A564FFE6A560FFECB784FFF4D2AEFFFBF0E2FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCDDC6FFF6C299FFEFAF78FFE5A263FFE4A35EFFE6A560FFE8A560FFE6A2
      5FFFE6A25FFFE7A362FFE7A362FFE29F60FFDEA267FFE4A366FFEAA461FFE8A2
      5FFFE2A464FFE2B179FFECCA9CFFF9DFB7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDE7D0FFF8D5A9FFEDC797FFE2B784FFE2B0
      76FFE3AA6CFFE4A763FFEBA863FFF2AD67FFEBAF74FFF0B783FFF4C49AFFF7D3
      B5FFFCE4D2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000F00000003A0000000100010000000000400700000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object qryLancamentoSaida: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterScroll = qryLancamentoSaidaAfterScroll
    SQL.Strings = (
      'SELECT LCT_VENDA.ID_VENDA,'
      '       LCT_VENDA.DT_VENDA,'
      '       LCT_VENDA.HR_VENDA,'
      '       LCT_VENDA.DS_FORMAPAGAMENTO,'
      '       LCT_VENDA.VR_TOTALVENDA,'
      '       LCT_VENDA.VR_TOTALPAGO,'
      '       LCT_VENDA.VR_TROCO,'
      '       LCT_VENDA.VR_DESCONTO,'
      '       LCT_VENDA.VR_ACRESCIMO,'
      '       LCT_VENDA.FG_STATUS'
      'FROM LCT_VENDA'
      'WHERE LCT_VENDA.ID_VENDA IS NOT NULL'
      '      AND LCT_VENDA.CD_CLIENTE = :CD_CLIENTE'
      'ORDER BY LCT_VENDA.DT_VENDA DESC, LCT_VENDA.HR_VENDA DESC')
    Left = 205
    Top = 238
  end
  object dtsLancamentoSaida: TDataSource
    DataSet = qryLancamentoSaida
    Left = 205
    Top = 278
  end
  object qryLancamentoSaidaItem: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTO.DS_NOME,'
      '       LCT_VENDAITEM.FG_UNIDADEMEDIDA,'
      '       LCT_VENDAITEM.VR_UNITARIO,'
      '       LCT_VENDAITEM.NR_QUANTIDADE,'
      '       LCT_VENDAITEM.VR_DESCONTO,'
      '       LCT_VENDAITEM.VR_ACRESCIMO,'
      '       LCT_VENDAITEM.VR_TOTALITEM'
      'FROM LCT_VENDAITEM'
      
        'LEFT JOIN CAD_PRODUTO ON(CAD_PRODUTO.ID_PRODUTO = LCT_VENDAITEM.' +
        'ID_PRODUTO)'
      'WHERE LCT_VENDAITEM.ID_VENDA = :ID_VENDA')
    Left = 239
    Top = 238
  end
  object dtsLancamentoSaidaItem: TDataSource
    DataSet = qryLancamentoSaidaItem
    Left = 239
    Top = 278
  end
end
