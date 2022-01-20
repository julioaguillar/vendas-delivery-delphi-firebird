inherited frmLctEntradaDetalhe: TfrmLctEntradaDetalhe
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amento - Entrada de Produto/Mercadoria (Item)'
  ClientHeight = 438
  ClientWidth = 794
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 800
  ExplicitHeight = 467
  PixelsPerInch = 96
  TextHeight = 13
  object gpbData: TGroupBox
    Left = 5
    Top = 5
    Width = 88
    Height = 44
    Caption = 'Data'
    TabOrder = 0
    object dbeData: TDBEdit
      Left = 9
      Top = 16
      Width = 70
      Height = 21
      DataField = 'DT_ENTRADA'
      DataSource = dtsEntrada
      TabOrder = 0
    end
  end
  object gpbNumero: TGroupBox
    Left = 187
    Top = 5
    Width = 130
    Height = 44
    Caption = 'N'#250'mero'
    TabOrder = 2
    object dbeNumero: TDBEdit
      Tag = 4
      Left = 9
      Top = 16
      Width = 113
      Height = 21
      DataField = 'NR_ENTRADA'
      DataSource = dtsEntrada
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbFornecedor: TGroupBox
    Left = 320
    Top = 5
    Width = 466
    Height = 44
    Caption = 'Fornecedor'
    TabOrder = 3
    object dblFabrica: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 449
      Height = 21
      DataField = 'CD_FORNECEDOR'
      DataSource = dtsEntrada
      KeyField = 'CD_FORNECEDOR'
      ListField = 'DS_NOME'
      ListSource = dtsFornecedor
      TabOrder = 0
      OnEnter = dblFabricaEnter
    end
  end
  object gpbProdutos: TGroupBox
    Left = 5
    Top = 105
    Width = 781
    Height = 287
    Caption = 'Produtos/Mercadorias'
    TabOrder = 5
    object dbgProdutos: TDBGrid
      Left = 6
      Top = 15
      Width = 661
      Height = 243
      DataSource = dtsEntradaItem
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Produto/Mercadoria'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_UNITARIO'
          Title.Caption = 'Pre'#231'o Unit'#225'rio'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_QUANTIDADEPRODUTO'
          Title.Caption = 'Quantidade'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_DESCONTO'
          Title.Caption = 'Desconto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_TOTAL'
          Title.Caption = 'Total'
          Width = 100
          Visible = True
        end>
    end
    object btnIncluir: TBitBtn
      Left = 673
      Top = 185
      Width = 100
      Height = 30
      Caption = '&Incluir'
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
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFCFCF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF3F3FFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFFFFCF3F3F
        3F3F0F0F3F3F3F3FCFFFFFFF0000FFFFFFCF3F3F3F3F0F0F3F3F3F3FCFFFFFFF
        0000FFFFFFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF3F3F
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFF3F3FFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFCFCFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnExcluir: TBitBtn
      Left = 673
      Top = 218
      Width = 100
      Height = 30
      Caption = 'E&xcluir'
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
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFCF3F3F
        3F3F3F3F3F3F3F3FCFFFFFFF0000FFFFFFCF3F3F3F3F3F3F3F3F3F3FCFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAlterar: TBitBtn
      Left = 673
      Top = 251
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
        0000FFFF00000065FFFFFFFFFFFFFFFFFFFFFFFF0000FFFF0000000065FFFFFF
        FFFFFFFFFFFFFFFF0000FFFF000000000065FFFFFFFFFFFFFFFFFFFF0000FFFF
        61000000000065FFFFFFFFFFFFFFFFFF0000FFFFFF61000000000065FFFFFFFF
        FFFFFFFF0000FFFFFFFF61000000000065FFFFFFFFFFFFFF0000FFFFFFFFFF61
        000000000065FFFFFFFFFFFF0000FFFFFFFFFFFF61000000000065FFFFFFFFFF
        0000FFFFFFFFFFFFFF61000000000067FFFFFFFF0000FFFFFFFFFFFFFFFF6100
        0000019BFFFFFFFF0000FFFFFFFFFFFFFFFFFF6100019CFF9B67FFFF0000FFFF
        FFFFFFFFFFFFFFFF639DFF9C010069FF0000FFFFFFFFFFFFFFFFFFFFFFFF9D01
        00001EFF0000FFFFFFFFFFFFFFFFFFFFFFFF62000018D7FF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFF601BD7FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object Panel1: TPanel
      Left = 6
      Top = 258
      Width = 290
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 288
        Height = 20
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Total:  '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 251
        ExplicitWidth = 38
        ExplicitHeight = 13
      end
    end
    object Panel2: TPanel
      Left = 296
      Top = 258
      Width = 91
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 5
      object lblTotalUnitario: TLabel
        Left = 1
        Top = 1
        Width = 89
        Height = 20
        Align = alClient
        Alignment = taRightJustify
        Caption = '0,00 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 63
        ExplicitWidth = 27
        ExplicitHeight = 13
      end
    end
    object Panel3: TPanel
      Left = 387
      Top = 258
      Width = 66
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 6
      object lblTotalQuantidade: TLabel
        Left = 1
        Top = 1
        Width = 64
        Height = 20
        Align = alClient
        Alignment = taRightJustify
        Caption = '0 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 55
        ExplicitWidth = 10
        ExplicitHeight = 13
      end
    end
    object Panel4: TPanel
      Left = 453
      Top = 258
      Width = 91
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 7
      object lblTotalDesconto: TLabel
        Left = 1
        Top = 1
        Width = 89
        Height = 20
        Align = alClient
        Alignment = taRightJustify
        Caption = '0,00 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 63
        ExplicitWidth = 27
        ExplicitHeight = 13
      end
    end
    object Panel5: TPanel
      Left = 644
      Top = 258
      Width = 23
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 8
    end
    object Panel6: TPanel
      Left = 544
      Top = 258
      Width = 102
      Height = 22
      Color = clWhite
      ParentBackground = False
      TabOrder = 9
      object lblTotalGeral: TLabel
        Left = 1
        Top = 1
        Width = 100
        Height = 20
        Align = alClient
        Alignment = taRightJustify
        Caption = '0,00 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 74
        ExplicitWidth = 27
        ExplicitHeight = 13
      end
    end
    object dbeProduto: TDBEdit
      Left = 689
      Top = 56
      Width = 0
      Height = 21
      DataField = 'ID_PRODUTO'
      DataSource = dtsEntradaItem
      TabOrder = 10
      OnEnter = dbeProdutoEnter
    end
  end
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 398
    Width = 794
    Height = 40
    Align = alBottom
    TabOrder = 6
    object btnConfirmar: TBitBtn
      Left = 296
      Top = 4
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
      Left = 397
      Top = 4
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
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 406
    Top = 151
    Width = 251
    Height = 90
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'dbeData=Campo data deve ser informado'
      'dbeHora=Campo hora deve ser informado'
      'dbeProduto=Nenhum produto foi informado')
    TabOrder = 7
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      90
      136)
  end
  object gpbHora: TGroupBox
    Left = 96
    Top = 5
    Width = 88
    Height = 44
    Caption = 'Hora'
    TabOrder = 1
    object dbeHora: TDBEdit
      Left = 9
      Top = 16
      Width = 70
      Height = 21
      DataField = 'HR_ENTRADA'
      DataSource = dtsEntrada
      TabOrder = 0
    end
  end
  object gpbDescricao: TGroupBox
    Left = 5
    Top = 53
    Width = 781
    Height = 44
    Caption = 'Descri'#231#227'o'
    TabOrder = 4
    object dbeDescricao: TDBEdit
      Left = 9
      Top = 16
      Width = 763
      Height = 21
      DataField = 'DS_ENTRADA'
      DataSource = dtsEntrada
      TabOrder = 0
    end
  end
  object cdsEntradaItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 199
    object cdsEntradaItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsEntradaItemVR_UNITARIO: TFloatField
      FieldName = 'VR_UNITARIO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object cdsEntradaItemNR_QUANTIDADEPRODUTO: TFloatField
      FieldName = 'NR_QUANTIDADEPRODUTO'
      DisplayFormat = '#,###,###,##0.000'
    end
    object cdsEntradaItemVR_DESCONTO: TFloatField
      FieldName = 'VR_DESCONTO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object cdsEntradaItemVR_TOTAL: TFloatField
      FieldName = 'VR_TOTAL'
      DisplayFormat = '#,###,###,##0.00'
    end
    object cdsEntradaItemDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 50
    end
  end
  object dtsEntradaItem: TDataSource
    DataSet = cdsEntradaItem
    Left = 504
    Top = 199
  end
  object cdsEntrada: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsEntradaAfterOpen
    Left = 376
    Top = 257
    object cdsEntradaDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsEntradaHR_ENTRADA: TTimeField
      FieldName = 'HR_ENTRADA'
      DisplayFormat = 'hh:mm:ss'
      EditMask = '99:99;1'
    end
    object cdsEntradaNR_ENTRADA: TStringField
      FieldName = 'NR_ENTRADA'
    end
    object cdsEntradaDS_ENTRADA: TStringField
      FieldName = 'DS_ENTRADA'
      Size = 50
    end
    object cdsEntradaNR_QUANTIDADEPRODUTOS: TFloatField
      FieldName = 'NR_QUANTIDADEPRODUTOS'
    end
    object cdsEntradaVR_TOTALENTRADA: TFloatField
      FieldName = 'VR_TOTALENTRADA'
      DisplayFormat = '#,###,###,##0.00'
    end
    object cdsEntradaCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
    end
    object cdsEntradaDS_NOME: TStringField
      FieldName = 'DS_NOME'
      Size = 70
    end
    object cdsEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
    end
  end
  object dtsEntrada: TDataSource
    DataSet = cdsEntrada
    Left = 504
    Top = 247
  end
  object trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Isolation = tiCommitted
    Left = 168
    Top = 225
  end
  object qryLctPedido: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DT_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_QUANTIDADEPRODUTOS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_TOTALPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_REPRESENTANTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_FABRICA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRAZOPAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_COMISSAOFABRICA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_COMISSAOREPRESENTANTE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_CALCCOMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_CALCCOMISSAOREPRESENTANTE'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'INSERT INTO LCT_PEDIDO ('
      '  ID_PEDIDO,'
      '  DT_PEDIDO,'
      '  NR_PEDIDO,'
      '  NR_QUANTIDADEPRODUTOS,'
      '  VR_TOTALPEDIDO,'
      '  CD_CLIENTE,'
      '  CD_REPRESENTANTE,'
      '  CD_FABRICA,'
      '  CD_PRAZOPAGAMENTO,'
      '  VR_COMISSAOFABRICA,'
      '  VR_COMISSAOREPRESENTANTE,'
      '  VR_CALCCOMISSAO,'
      '  VR_CALCCOMISSAOREPRESENTANTE)'
      'VALUES ('
      '  :ID_PEDIDO,'
      '  :DT_PEDIDO,'
      '  :NR_PEDIDO,'
      '  :NR_QUANTIDADEPRODUTOS,'
      '  :VR_TOTALPEDIDO,'
      '  :CD_CLIENTE,'
      '  :CD_REPRESENTANTE,'
      '  :CD_FABRICA,'
      '  :CD_PRAZOPAGAMENTO,'
      '  :VR_COMISSAOFABRICA,'
      '  :VR_COMISSAOREPRESENTANTE,'
      '  :VR_CALCCOMISSAO,'
      '  :VR_CALCCOMISSAOREPRESENTANTE)')
    Left = 62
    Top = 225
  end
  object qryDeletaProdutos: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_ENTRADA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'DELETE FROM LCT_ENTRADAITEM'
      'WHERE LCT_ENTRADAITEM.ID_ENTRADA = :ID_ENTRADA')
    Left = 60
    Top = 273
  end
  object qryLctPedidoProduto: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_ENTRADAITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_UNITARIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_QUANTIDADEPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_DESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'VR_TOTAL'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'INSERT INTO LCT_ENTRADAITEM('
      '       ID_ENTRADA,'
      '       ID_ENTRADAITEM,'
      '       ID_PRODUTO,'
      '       VR_UNITARIO,'
      '       NR_QUANTIDADEPRODUTO,'
      '       VR_DESCONTO,'
      '       VR_TOTAL)'
      'VALUES('
      '       :ID_ENTRADA,'
      '       :ID_ENTRADAITEM,'
      '       :ID_PRODUTO,'
      '       :VR_UNITARIO,'
      '       :NR_QUANTIDADEPRODUTO,'
      '       :VR_DESCONTO,'
      '       :VR_TOTAL'
      ')')
    Left = 65
    Top = 169
  end
  object qryConsulta: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT GEN_ID(GEN_ID_LCT_ENTRADAPRODUTO, 1) AS ID '
      'FROM RDB$DATABASE')
    Left = 169
    Top = 168
  end
  object qryFornecedor: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    KeyLinks.Strings = (
      'CAD_FORNECEDOR.CD_FORNECEDOR')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_FORNECEDOR.CD_FORNECEDOR,'
      '       CAD_FORNECEDOR.DS_NOME'
      'FROM CAD_FORNECEDOR'
      'ORDER BY CAD_FORNECEDOR.DS_NOME')
    Left = 259
    Top = 183
  end
  object dtsFornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 259
    Top = 237
  end
end
