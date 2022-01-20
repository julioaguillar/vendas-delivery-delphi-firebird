inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro - Produto/Mercadoria'
  ClientHeight = 571
  ClientWidth = 994
  OnShow = FormShow
  ExplicitWidth = 1000
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 531
    Width = 994
    ExplicitTop = 433
    ExplicitWidth = 719
    object btnConsCodFabricante: TSpeedButton [0]
      Left = 6
      Top = 5
      Width = 35
      Height = 30
      Hint = 'Pesquisa Produto/Mercadoria por C'#243'digo do Fabricante'
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000FF00FF9F9F9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F9F9F9FFF00FF
        0000FF00FF7F7F7F0000003F3F3F1F1F1F0000003F3F3F1F1F1F0000003F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F0000007F7F7FFF00FF0000FF00FF7F7F7F
        000000FFFFFF7F7F7F000000FFFFFF7F7F7F000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000007F7F7FFF00FF0000FF00FF7F7F7F0000003F3F3F1F1F
        1F0000003F3F3F1F1F1F0000003F3F3F9F9F9FFFFFFF3F3F3F9F9F9FFFFFFF00
        00007F7F7FFF00FF0000FF00FF7F7F7F0000003F3F3F1F1F1F0000003F3F3F1F
        1F1F0000003F3F3F9F9F9FFFFFFF3F3F3F9F9F9FFFFFFF0000007F7F7FFF00FF
        0000FF00FF7F7F7F000000FFFFFF7F7F7F000000FFFFFF7F7F7F000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFF00FF0000FF00FF7F7F7F
        0000003F3F3F1F1F1F0000003F3F3F1F1F1F0000003F3F3F9F9F9FFFFFFF3F3F
        3F9F9F9FFFFFFF0000007F7F7FFF00FF0000FF00FF7F7F7F0000003F3F3F1F1F
        1F0000003F3F3F1F1F1F0000003F3F3F9F9F9FFFFFFF3F3F3F9F9F9FFFFFFF00
        00007F7F7FFF00FF0000FF00FF7F7F7F000000FFFFFF7F7F7F000000FFFFFF7F
        7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000007F7F7FFF00FF
        0000FF00FF7F7F7F0000003F3F3F1F1F1F0000003F3F3F1F1F1F0000003F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F0000007F7F7FFF00FF0000FF00FF7F7F7F
        0000003F3F3F1F1F1F0000003F3F3F1F1F1F0000003F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F9F9F9FFF00FF0000FF00FF7F7F7F000000FFFFFF7F7F
        7F000000FFFFFF7F7F7F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000FF00FF7F7F7F0000003F3F3F1F1F1F0000003F3F3F1F
        1F1F000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0000FF00FF9F9F9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnConsCodFabricanteClick
    end
    inherited btnConsultar: TBitBtn [1]
      Tag = 1
      Left = 880
      Width = 28
      Enabled = False
      Visible = False
      ExplicitLeft = 880
      ExplicitWidth = 28
    end
    inherited btnIncluir: TBitBtn [2]
      Left = 245
      ExplicitLeft = 245
    end
    inherited btnExcluir: TBitBtn [3]
      Left = 346
      ExplicitLeft = 346
    end
    inherited btnAlterar: TBitBtn [4]
      Left = 447
      ExplicitLeft = 447
    end
    inherited btnConfirmar: TBitBtn
      Left = 548
      ExplicitLeft = 548
    end
    inherited btnCancelar: TBitBtn
      Left = 648
      ExplicitLeft = 648
    end
  end
  object gpbDescricao: TGroupBox [1]
    Left = 403
    Top = 8
    Width = 400
    Height = 45
    Caption = 'Descri'#231#227'o'
    TabOrder = 3
    object dbeNome: TDBEdit
      Left = 6
      Top = 16
      Width = 388
      Height = 21
      DataField = 'DS_NOME'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbFabricante: TGroupBox [2]
    Left = 6
    Top = 58
    Width = 259
    Height = 45
    Caption = 'Fabricante'
    TabOrder = 4
    object dbeFabricante: TDBEdit
      Left = 6
      Top = 16
      Width = 247
      Height = 21
      DataField = 'DS_FABRICANTE'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbFornecedor: TGroupBox [3]
    Left = 268
    Top = 58
    Width = 318
    Height = 45
    Caption = 'Fornecedor'
    TabOrder = 5
    object dblFornecedor: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 304
      Height = 21
      DataField = 'CD_FORNECEDOR'
      DataSource = dtsCadPadrao
      KeyField = 'CD_FORNECEDOR'
      ListField = 'DS_NOME'
      ListSource = dtsConsFornecedor
      TabOrder = 0
      OnKeyDown = dblFornecedorKeyDown
    end
  end
  object qpbPrecoCompra: TGroupBox [4]
    Left = 102
    Top = 124
    Width = 131
    Height = 45
    Caption = 'Pre'#231'o de Compra'
    TabOrder = 8
    object dbePrecoCompra: TDBEdit
      Left = 6
      Top = 16
      Width = 118
      Height = 21
      DataField = 'VR_PRECOCOMPRA'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbPrecoVenda: TGroupBox [5]
    Left = 239
    Top = 108
    Width = 276
    Height = 68
    Caption = 'Pre'#231'o de Venda'
    TabOrder = 9
    object gpbPrecoPrincipal: TGroupBox
      Left = 10
      Top = 15
      Width = 125
      Height = 45
      Caption = 'Principal'
      TabOrder = 0
      object dbePrecoVenda: TDBEdit
        Left = 8
        Top = 16
        Width = 110
        Height = 21
        DataField = 'VR_PRECOVENDA01'
        DataSource = dtsCadPadrao
        Enabled = False
        TabOrder = 0
      end
    end
    object gpbPrecoMinimo: TGroupBox
      Left = 142
      Top = 15
      Width = 125
      Height = 45
      Caption = 'M'#237'nimo'
      TabOrder = 1
      object dbePrecoMinimo: TDBEdit
        Left = 8
        Top = 16
        Width = 110
        Height = 21
        DataField = 'VR_PRECOVENDA03'
        DataSource = dtsCadPadrao
        Enabled = False
        TabOrder = 0
      end
    end
  end
  object gpbProdutos: TGroupBox [6]
    Left = 6
    Top = 179
    Width = 984
    Height = 345
    Caption = 'Produtos/Mercadorias'
    TabOrder = 10
    object dbgProdutos: TDBGrid
      Left = 9
      Top = 41
      Width = 966
      Height = 295
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_FABRICANTE'
          Title.Caption = 'C'#243'digo do Fabricante'
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 385
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_PRECOVENDA01'
          Title.Caption = 'Pre'#231'o Principal'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_PRECOVENDA03'
          Title.Caption = 'Pre'#231'o M'#237'nimo'
          Width = 120
          Visible = True
        end>
    end
    object edtConsCodigo: TEdit
      Tag = 10
      Left = 9
      Top = 17
      Width = 219
      Height = 21
      MaxLength = 20
      TabOrder = 1
      TextHint = 'Digite o C'#243'digo do Produto/Mercadoria'
      OnChange = edtConsCodigoChange
    end
    object edtConsdescricao: TEdit
      Tag = 10
      Left = 531
      Top = 17
      Width = 444
      Height = 21
      MaxLength = 50
      TabOrder = 3
      TextHint = 'Digite a Descri'#231#227'o'
      OnChange = edtConsdescricaoChange
    end
    object edtConsCodigoFabricante: TEdit
      Tag = 10
      Left = 233
      Top = 17
      Width = 293
      Height = 21
      MaxLength = 20
      TabOrder = 2
      TextHint = 'Digite o C'#243'digo do Fabricante'
      OnChange = edtConsCodigoFabricanteChange
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 632
    Top = 335
    Strings.Strings = (
      'dbeCodigo=C'#243'digo do Produto deve ser informado'
      'dbeNome=Descri'#231#227'o do Produto deve ser informada'
      '=')
    TabOrder = 11
    ExplicitLeft = 632
    ExplicitTop = 335
  end
  object gpbCodigo: TGroupBox [8]
    Left = 6
    Top = 8
    Width = 183
    Height = 45
    Caption = 'C'#243'digo'
    TabOrder = 1
    object dbeCodigo: TDBEdit
      Left = 6
      Top = 16
      Width = 170
      Height = 21
      DataField = 'CD_PRODUTO'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbCategoria: TGroupBox [9]
    Left = 589
    Top = 58
    Width = 214
    Height = 45
    Caption = 'Categoria'
    TabOrder = 6
    object dblCategoria: TDBLookupComboBox
      Left = 7
      Top = 16
      Width = 201
      Height = 21
      DataField = 'ID_PRODUTOCATEGORIA'
      DataSource = dtsCadPadrao
      KeyField = 'ID_PRODUTOCATEGORIA'
      ListField = 'DS_PRODUTOCATEGORIA'
      ListSource = dtsConsCategoria
      TabOrder = 0
    end
  end
  object gpbUnidade: TGroupBox [10]
    Left = 6
    Top = 124
    Width = 91
    Height = 45
    Caption = 'Unidade'
    TabOrder = 7
    object dblUnidade: TDBLookupComboBox
      Left = 7
      Top = 16
      Width = 77
      Height = 21
      DataField = 'FG_UNIDADEMEDIDA'
      DataSource = dtsCadPadrao
      KeyField = 'FG_UNIDADEMEDIDA'
      ListField = 'FG_UNIDADEMEDIDA'
      ListSource = dtsConsunidade
      TabOrder = 0
      OnKeyDown = dblUnidadeKeyDown
    end
  end
  object gpbCodigoFabricante: TGroupBox [11]
    Left = 192
    Top = 8
    Width = 208
    Height = 45
    Caption = 'C'#243'digo do Frabricante'
    TabOrder = 2
    object dbeCodigoFabricante: TDBEdit
      Left = 7
      Top = 16
      Width = 194
      Height = 21
      DataField = 'CD_FABRICANTE'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbFoto: TGroupBox [12]
    Left = 806
    Top = 8
    Width = 184
    Height = 168
    Caption = 'Foto'
    TabOrder = 12
    object btnCapturarFotoArquivo: TSpeedButton
      Left = 149
      Top = 97
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
      Top = 126
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
    object dbiFotoProduto: TDBImage
      Left = 6
      Top = 22
      Width = 140
      Height = 132
      DataField = 'FT_PRODUTO'
      DataSource = dtsCadPadrao
      ReadOnly = True
      Stretch = True
      TabOrder = 0
      TabStop = False
      OnDblClick = dbiFotoProdutoDblClick
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 104
    Top = 337
  end
  inherited qryCadPadrao: TIBOQuery
    Params = <
      item
        DataType = ftFixedChar
        Name = 'FG_PESQUISACODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'FG_PESQUISAFABRICANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_FABRICANTE'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'FG_PESQUISADESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DS_NOME'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM CAD_PRODUTO CAD_PRODUTO'
      'WHERE'
      '   ID_PRODUTO = :OLD_ID_PRODUTO')
    EditSQL.Strings = (
      'UPDATE CAD_PRODUTO CAD_PRODUTO SET'
      '   CAD_PRODUTO.ID_PRODUTO = :ID_PRODUTO, /*PK*/'
      '   CAD_PRODUTO.CD_PRODUTO = :CD_PRODUTO,'
      '   CAD_PRODUTO.DS_NOME = :DS_NOME,'
      '   CAD_PRODUTO.DS_FABRICANTE = :DS_FABRICANTE,'
      '   CAD_PRODUTO.CD_FORNECEDOR = :CD_FORNECEDOR,'
      '   CAD_PRODUTO.ID_PRODUTOCATEGORIA = :ID_PRODUTOCATEGORIA,'
      '   CAD_PRODUTO.FG_UNIDADEMEDIDA = :FG_UNIDADEMEDIDA,'
      '   CAD_PRODUTO.VR_PRECOCOMPRA = :VR_PRECOCOMPRA,'
      '   CAD_PRODUTO.VR_PRECOVENDA01 = :VR_PRECOVENDA01,'
      '   CAD_PRODUTO.VR_PRECOVENDA02 = :VR_PRECOVENDA02,'
      '   CAD_PRODUTO.VR_PRECOVENDA03 = :VR_PRECOVENDA03,'
      '   CAD_PRODUTO.CD_FABRICANTE = :CD_FABRICANTE,'
      '   CAD_PRODUTO.FT_PRODUTO = :FT_PRODUTO'
      'WHERE'
      '   ID_PRODUTO = :OLD_ID_PRODUTO')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_PRODUTO('
      '   ID_PRODUTO, /*PK*/'
      '   CD_PRODUTO,'
      '   DS_NOME,'
      '   DS_FABRICANTE,'
      '   CD_FORNECEDOR,'
      '   ID_PRODUTOCATEGORIA,'
      '   FG_UNIDADEMEDIDA,'
      '   VR_PRECOCOMPRA,'
      '   VR_PRECOVENDA01,'
      '   VR_PRECOVENDA02,'
      '   VR_PRECOVENDA03,'
      '   CD_FABRICANTE,'
      '   FT_PRODUTO)'
      'VALUES ('
      '   :ID_PRODUTO,'
      '   :CD_PRODUTO,'
      '   :DS_NOME,'
      '   :DS_FABRICANTE,'
      '   :CD_FORNECEDOR,'
      '   :ID_PRODUTOCATEGORIA,'
      '   :FG_UNIDADEMEDIDA,'
      '   :VR_PRECOCOMPRA,'
      '   :VR_PRECOVENDA01,'
      '   :VR_PRECOVENDA02,'
      '   :VR_PRECOVENDA03,'
      '   :CD_FABRICANTE,'
      '   :FT_PRODUTO)')
    KeyLinks.Strings = (
      'CAD_PRODUTO.ID_PRODUTO')
    SQL.Strings = (
      'SELECT CAD_PRODUTO.ID_PRODUTO,'
      '       CAD_PRODUTO.CD_PRODUTO,'
      '       CAD_PRODUTO.DS_NOME,'
      '       CAD_PRODUTO.DS_FABRICANTE,'
      '       CAD_PRODUTO.CD_FORNECEDOR,'
      '       CAD_PRODUTO.ID_PRODUTOCATEGORIA,'
      '       CAD_PRODUTO.FG_UNIDADEMEDIDA,'
      '       CAD_PRODUTO.VR_PRECOCOMPRA,'
      '       CAD_PRODUTO.VR_PRECOVENDA01,'
      '       CAD_PRODUTO.VR_PRECOVENDA02,'
      '       CAD_PRODUTO.VR_PRECOVENDA03,'
      '       CAD_PRODUTO.CD_FABRICANTE,'
      '       CAD_PRODUTO.FT_PRODUTO'
      'FROM CAD_PRODUTO'
      'WHERE CAD_PRODUTO.ID_PRODUTO IS NOT NULL AND'
      '      ('
      
        '        ( :FG_PESQUISACODIGO = '#39'NAO'#39' OR UPPER(CAD_PRODUTO.CD_PRO' +
        'DUTO) LIKE UPPER(:CD_PRODUTO) || '#39'%'#39' ) AND'
      
        '        ( :FG_PESQUISAFABRICANTE = '#39'NAO'#39' OR UPPER(CAD_PRODUTO.CD' +
        '_FABRICANTE) LIKE UPPER(:CD_FABRICANTE) || '#39'%'#39' ) AND'
      
        '        ( :FG_PESQUISADESCRICAO = '#39'NAO'#39' OR UPPER(CAD_PRODUTO.DS_' +
        'NOME) LIKE '#39'%'#39' || UPPER(:DS_NOME) || '#39'%'#39' )'
      '      )'
      'ORDER BY CAD_PRODUTO.DS_NOME')
    Left = 136
    Top = 337
  end
  inherited dtsCadPadrao: TDataSource
    Left = 136
    Top = 305
  end
  object qryConsProduto: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTO.CD_PRODUTO'
      'FROM CAD_PRODUTO'
      'WHERE CAD_PRODUTO.CD_PRODUTO = :CD_PRODUTO')
    Left = 262
    Top = 337
  end
  object qryConsFornecedor: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_FORNECEDOR.CD_FORNECEDOR,'
      '       CAD_FORNECEDOR.DS_NOME'
      'FROM CAD_FORNECEDOR')
    Left = 168
    Top = 337
  end
  object qryConsCategoria: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTOCATEGORIA.ID_PRODUTOCATEGORIA,'
      '       CAD_PRODUTOCATEGORIA.DS_PRODUTOCATEGORIA'
      'FROM CAD_PRODUTOCATEGORIA')
    Left = 200
    Top = 337
  end
  object qryConsunidade: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_UNIDADEMEDIDA.FG_UNIDADEMEDIDA,'
      '       CAD_UNIDADEMEDIDA.DS_UNIDADEMEDIDA'
      'FROM CAD_UNIDADEMEDIDA')
    Left = 231
    Top = 337
  end
  object dtsConsFornecedor: TDataSource
    DataSet = qryConsFornecedor
    OnStateChange = dtsCadPadraoStateChange
    Left = 168
    Top = 305
  end
  object dtsConsCategoria: TDataSource
    DataSet = qryConsCategoria
    OnStateChange = dtsCadPadraoStateChange
    Left = 200
    Top = 305
  end
  object dtsConsunidade: TDataSource
    DataSet = qryConsunidade
    OnStateChange = dtsCadPadraoStateChange
    Left = 231
    Top = 305
  end
  object qryNumProdutos: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT COUNT( CAD_PRODUTO.ID_PRODUTO ) NR_PRODUTO'
      'FROM CAD_PRODUTO')
    Left = 262
    Top = 305
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Title = 'Selecione a foto do Cliente'
    Left = 104
    Top = 305
  end
end
