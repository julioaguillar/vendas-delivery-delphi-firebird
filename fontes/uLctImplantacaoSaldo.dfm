inherited frmLctImplantacaoSaldo: TfrmLctImplantacaoSaldo
  BorderIcons = [biSystemMenu]
  Caption = 'Lan'#231'amento - Implanta'#231#227'o de Saldo'
  ClientHeight = 459
  ClientWidth = 717
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 723
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  object gpbBotoes: TGroupBox
    Left = 0
    Top = 419
    Width = 717
    Height = 40
    Align = alBottom
    TabOrder = 0
    object btnAlterar: TBitBtn
      Left = 208
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
      TabOrder = 0
      OnClick = btnAlterarClick
    end
    object btnConfirmar: TBitBtn
      Left = 309
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
      Left = 410
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
  object gpbProdutos: TGroupBox
    Left = 6
    Top = 6
    Width = 705
    Height = 407
    Caption = 'Produtos'
    TabOrder = 1
    object dbgSituacoes: TDBGrid
      Left = 7
      Top = 65
      Width = 691
      Height = 335
      DataSource = dtsConsProduto
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgSituacoesCellClick
      OnColEnter = dbgSituacoesColEnter
      OnEnter = dbgSituacoesEnter
      OnExit = dbgSituacoesExit
      OnKeyDown = dbgSituacoesKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FG_UNIDADEMEDIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Unid.Medida'
          Width = 80
          Visible = True
        end
        item
          Color = 16773345
          Expanded = False
          FieldName = 'VR_SALDOINICIAL'
          Title.Caption = 'Saldo Inicial'
          Width = 122
          Visible = True
        end>
    end
    object gpbPesquisa: TGroupBox
      Left = 7
      Top = 17
      Width = 691
      Height = 44
      Caption = 'Pesquisa'
      TabOrder = 1
      object edtPesquisa: TEdit
        Left = 248
        Top = 17
        Width = 435
        Height = 21
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TextHint = 'Digite a Descri'#231#227'o'
        OnChange = edtPesquisaChange
      end
      object edtConsCodigo: TEdit
        Tag = 10
        Left = 8
        Top = 17
        Width = 233
        Height = 21
        MaxLength = 50
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TextHint = 'Digite o C'#243'digo'
        OnChange = edtConsCodigoChange
      end
    end
  end
  object dtsConsProduto: TDataSource
    DataSet = qryConsProduto
    Left = 96
    Top = 152
  end
  object qryConsProduto: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_PRODUTO CAD_PRODUTO'
      'WHERE'
      '   ID_PRODUTO = :OLD_ID_PRODUTO')
    EditSQL.Strings = (
      'UPDATE CAD_PRODUTO CAD_PRODUTO SET'
      '   CAD_PRODUTO.ID_PRODUTO = :ID_PRODUTO, /*PK*/'
      '   CAD_PRODUTO.CD_PRODUTO = :CD_PRODUTO,'
      '   CAD_PRODUTO.DS_NOME = :DS_NOME,'
      '   CAD_PRODUTO.FG_UNIDADEMEDIDA = :FG_UNIDADEMEDIDA,'
      '   CAD_PRODUTO.VR_SALDOINICIAL = :VR_SALDOINICIAL'
      'WHERE'
      '   ID_PRODUTO = :OLD_ID_PRODUTO')
    FieldsDisplayFormat.Strings = (
      'VR_SALDOINICIAL=#,###,###,##0.00')
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    InsertSQL.Strings = (
      'INSERT INTO CAD_PRODUTO('
      '   ID_PRODUTO, /*PK*/'
      '   CD_PRODUTO,'
      '   DS_NOME,'
      '   FG_UNIDADEMEDIDA,'
      '   VR_SALDOINICIAL)'
      'VALUES ('
      '   :ID_PRODUTO,'
      '   :CD_PRODUTO,'
      '   :DS_NOME,'
      '   :FG_UNIDADEMEDIDA,'
      '   :VR_SALDOINICIAL)')
    KeyLinks.Strings = (
      'CAD_PRODUTO.ID_PRODUTO')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTO.ID_PRODUTO,'
      '       CAD_PRODUTO.CD_PRODUTO,'
      '       UPPER(CAD_PRODUTO.DS_NOME)AS DS_NOME,'
      '       CAD_PRODUTO.FG_UNIDADEMEDIDA,'
      '       CAD_PRODUTO.VR_SALDOINICIAL'
      'FROM CAD_PRODUTO')
    Left = 126
    Top = 152
  end
  object trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Isolation = tiCommitted
    Left = 156
    Top = 152
  end
end
