inherited frmCadContasPagar: TfrmCadContasPagar
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amento - Conta a Pagar (Conta)'
  ClientHeight = 299
  ClientWidth = 393
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 399
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 259
    Width = 393
    Height = 40
    Align = alBottom
    TabOrder = 0
    object btnConfirmar: TBitBtn
      Left = 97
      Top = 5
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
      Left = 197
      Top = 5
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
  object gpbDataVencimento: TGroupBox
    Left = 8
    Top = 8
    Width = 141
    Height = 41
    Caption = 'Data de Vencimento'
    TabOrder = 1
    object dbeDataVencimento: TDBEdit
      Left = 8
      Top = 15
      Width = 125
      Height = 21
      DataField = 'DT_VENCIMENTO'
      DataSource = dtsContasAPagar
      TabOrder = 0
    end
  end
  object gpbValor: TGroupBox
    Left = 8
    Top = 55
    Width = 141
    Height = 41
    Caption = 'Valor'
    TabOrder = 2
    object dbeValor: TDBEdit
      Left = 8
      Top = 15
      Width = 125
      Height = 21
      DataField = 'VR_CONTAPAGAR'
      DataSource = dtsContasAPagar
      TabOrder = 0
    end
  end
  object gpbPagarA: TGroupBox
    Left = 8
    Top = 102
    Width = 376
    Height = 41
    Caption = 'Pagar a'
    TabOrder = 3
    object dbePagarA: TDBEdit
      Left = 8
      Top = 15
      Width = 360
      Height = 21
      DataField = 'DS_PAGARA'
      DataSource = dtsContasAPagar
      TabOrder = 0
    end
  end
  object gpbDescricao: TGroupBox
    Left = 8
    Top = 149
    Width = 376
    Height = 41
    Caption = 'Descri'#231#227'o'
    TabOrder = 4
    object dbeDescricao: TDBEdit
      Left = 8
      Top = 15
      Width = 360
      Height = 21
      DataField = 'DS_DESCRICAO'
      DataSource = dtsContasAPagar
      TabOrder = 0
    end
  end
  object gpbObservacao: TGroupBox
    Left = 8
    Top = 205
    Width = 376
    Height = 41
    Caption = 'Observa'#231#227'o'
    TabOrder = 5
    object dbeObservacao: TDBEdit
      Left = 8
      Top = 15
      Width = 360
      Height = 21
      DataField = 'DS_OBSERVACAO'
      DataSource = dtsContasAPagar
      TabOrder = 0
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 188
    Top = 23
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      'dbeDataVencimento=O campo Data de Vencimento deve ser informado'
      'dbeValor=O campo Valor deve ser informado'
      'dbeDescricao=O campo Descri'#231#227'o deve ser informado')
    TabOrder = 6
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object dtsContasAPagar: TDataSource
    DataSet = frmLctContasPagar.qryCadPadrao
    Left = 323
    Top = 58
  end
end
