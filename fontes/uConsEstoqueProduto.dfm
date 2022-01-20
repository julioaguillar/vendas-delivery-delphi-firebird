inherited frmConsEstoqueProduto: TfrmConsEstoqueProduto
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta - Estoque dos Produtos/Mercadorias'
  ClientHeight = 572
  ClientWidth = 798
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 804
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 529
    Width = 798
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    TabOrder = 3
    ExplicitWidth = 876
    object btnRetornar: TBitBtn
      Left = 349
      Top = 7
      Width = 100
      Height = 30
      Caption = '&Retornar'
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF8E26DFFFFFFFFFFFFF46000000
        00007FFF0000FF830055FFFFFFFFFFFFFF45000000007FFF0000FFFF21007BFF
        FFFFFFFFFFFF2E0000007FFF0000FFFFCF100040BCFFFFFFCF5E000000007FFF
        0000FFFFFFD62E0000081D0E000016AA45007FFF0000FFFFFFFFFFA44B15010C
        398CFFFFFF467FFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = btnRetornarClick
    end
  end
  object gpbConsulta: TGroupBox
    Left = 6
    Top = 4
    Width = 558
    Height = 44
    Align = alCustom
    Caption = 'Consulta por Descri'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object edtConsulta: TEdit
      Left = 10
      Top = 16
      Width = 540
      Height = 21
      TabOrder = 0
      OnChange = edtConsultaChange
    end
  end
  object gpbProdutos: TGroupBox
    Left = 6
    Top = 51
    Width = 785
    Height = 405
    Caption = 'Produtos'
    TabOrder = 2
    object dbgRegistros: TDBGrid
      Left = 8
      Top = 16
      Width = 769
      Height = 381
      DataSource = dtsConsulta
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgRegistrosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'P_OU_CD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_DS_NOME'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = 12213021
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 450
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_OU_FG_UNIDADEMEDIDA'
          Title.Caption = 'Unidade'
          Width = 60
          Visible = True
        end
        item
          Color = 16773345
          Expanded = False
          FieldName = 'P_OU_NR_QUANTIDADEESTOQUE'
          Title.Caption = 'Qtde.Atual'
          Width = 100
          Visible = True
        end>
    end
  end
  object gpbFiltro: TGroupBox
    Left = 569
    Top = 4
    Width = 222
    Height = 44
    Caption = 'Filtro'
    TabOrder = 1
    object ckbEmEstoque: TCheckBox
      Left = 16
      Top = 18
      Width = 169
      Height = 17
      Caption = '&Somente Produtos em Estoque'
      TabOrder = 0
      OnClick = ckbEmEstoqueClick
    end
  end
  object gpbDetalhamento: TGroupBox
    Left = 6
    Top = 462
    Width = 785
    Height = 64
    Enabled = False
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 55
      Height = 16
      AutoSize = False
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 638
      Top = 4
      Width = 135
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'Quantidade Atual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbtDescricao: TDBText
      Left = 8
      Top = 22
      Width = 609
      Height = 35
      DataField = 'P_OU_DS_NOME'
      DataSource = dtsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object dbtQtdeAtual: TDBText
      Left = 638
      Top = 22
      Width = 135
      Height = 35
      Alignment = taCenter
      DataField = 'P_OU_NR_QUANTIDADEESTOQUE'
      DataSource = dtsConsulta
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
  object qryConsulta: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'P_IN_FG_PRODUTOEMESTOQUE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_IN_FG_TODOS'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'P_IN_DS_NOME'
        ParamType = ptInput
      end>
    FieldsDisplayFormat.Strings = (
      'P_OU_VR_PRECOCOMPRA=#,###,###,##0.00'
      'P_OU_VR_PRECOVENDA=#,###,###,##0.00'
      'P_OU_NR_QUANTIDADEESTOQUE=#,###,###,##0.000')
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT STRDPRC_RETORNATABELAPRECO.P_OU_ID_PRODUTO,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_CD_PRODUTO,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_DS_NOME,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_DS_FABRICANTE,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_CD_FORNECEDOR,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_FG_UNIDADEMEDIDA,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_VR_PRECOCOMPRA,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_VR_PRECOVENDA,'
      '       STRDPRC_RETORNATABELAPRECO.P_OU_NR_QUANTIDADEESTOQUE'
      'FROM STRDPRC_RETORNATABELAPRECO(:P_IN_FG_PRODUTOEMESTOQUE)'
      'WHERE STRDPRC_RETORNATABELAPRECO.P_OU_ID_PRODUTO IS NOT NULL AND'
      '      ('
      '        ( :P_IN_FG_TODOS = '#39'SIM'#39' ) OR'
      
        '        ( UPPER(STRDPRC_RETORNATABELAPRECO.P_OU_DS_NOME) LIKE '#39'%' +
        #39' || UPPER(:P_IN_DS_NOME) || '#39'%'#39' )'
      '      )'
      'ORDER BY STRDPRC_RETORNATABELAPRECO.P_OU_DS_NOME')
    Left = 618
    Top = 167
  end
  object dtsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 652
    Top = 167
  end
end
