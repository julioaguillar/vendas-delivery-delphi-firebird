inherited frmCopiaSeguranca: TfrmCopiaSeguranca
  BorderIcons = [biSystemMenu]
  Caption = 'C'#243'pia de Seguran'#231'a'
  ClientHeight = 233
  ClientWidth = 434
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 440
  ExplicitHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCopiaSeguranca: TPageControl
    Left = 2
    Top = 74
    Width = 430
    Height = 151
    ActivePage = tbsCopiar
    TabOrder = 0
    object tbsCopiar: TTabSheet
      Caption = '&Copiar'
      object lblProgressoCopia: TLabel
        Left = 5
        Top = 107
        Width = 407
        Height = 13
        AutoSize = False
      end
      object gpbDestinoCopia: TGroupBox
        Left = 5
        Top = 15
        Width = 409
        Height = 43
        Caption = 'Destino da c'#243'pia'
        TabOrder = 0
        object btnDestinoCopia: TSpeedButton
          Left = 383
          Top = 14
          Width = 23
          Height = 21
          Caption = '...'
          OnClick = btnDestinoCopiaClick
        end
        object edtDestinoCopia: TEdit
          Left = 6
          Top = 14
          Width = 375
          Height = 21
          TabOrder = 0
        end
      end
      object btnIniciarCopia: TBitBtn
        Left = 284
        Top = 64
        Width = 130
        Height = 30
        Caption = '&Iniciar C'#243'pia'
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD2D2D24D4D4D3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F4E4E4ED5D5D5FFFFFFFFFFFF
          0000FFFFFFFFFFFF4C4C4C0000000000000000000000000000002A2A2A2A2A2A
          0000000000000000000000000000004E4E4EFFFFFFFFFFFF0000FFFFFFFFFFFF
          3F3F3F0000000000000000000000009F9F9FFFFFFFFFFFFF9C9C9C0000000000
          000000000000003F3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF3F3F3F0000000000
          000000002C2C2CFFFFFFFFFFFFFFFFFFFFFFFF2A2A2A0000000000000000003F
          3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF3F3F3F0000000000000000002D2D2DFF
          FFFFFFFFFFFFFFFFFFFFFF2A2A2A0000000000000000003F3F3FFFFFFFFFFFFF
          0000FFFFFFFFFFFF3F3F3F000000000000000000000000A3A3A3FFFFFFFFFFFF
          9F9F9F0000000000000000000000003F3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF
          3F3F3F0000000000000000000000000000002D2D2D2C2C2C0000000000000000
          000000000000003F3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF3F3F3F0000000000
          000000000000000000000000000000000000000000000000000000000000003F
          3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF3F3F3F00000000000000000000000000
          00000000000000000000000000000000000000000000003F3F3FFFFFFFFFFFFF
          0000FFFFFFFFFFFF3F3F3F2F2F2FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBF2F2F2F0000000000000000003F3F3FFFFFFFFFFFFF0000FFFFFFFFFFFF
          3F3F3F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F0000
          00000000000000474747FFFFFFFFFFFF0000FFFFFFFFFFFF3F3F3F3F3F3FFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F0000000000001F1F1FDF
          DFDFFFFFFFFFFFFF0000FFFFFFFFFFFF4C4C4C0F0F0F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F0F0F0F0000001F1F1FDFDFDFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFD1D1D14C4C4C3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
          3F3F3F3F3F3F474747DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
        TabOrder = 1
        OnClick = btnIniciarCopiaClick
      end
      object ProgressBarCopia: TProgressBar
        Left = 5
        Top = 98
        Width = 408
        Height = 8
        Smooth = True
        TabOrder = 2
      end
    end
    object tbsRestaurar: TTabSheet
      Caption = '&Restaurar'
      ImageIndex = 1
      object lblProgressoRestaurar: TLabel
        Left = 5
        Top = 107
        Width = 407
        Height = 13
        AutoSize = False
      end
      object gpbLocalCopia: TGroupBox
        Left = 5
        Top = 15
        Width = 409
        Height = 43
        Caption = 'Arquivo de backup'
        TabOrder = 0
        object btnLocalCopia: TSpeedButton
          Left = 383
          Top = 14
          Width = 23
          Height = 21
          Caption = '...'
          OnClick = btnLocalCopiaClick
        end
        object edtLocalCopia: TEdit
          Left = 6
          Top = 14
          Width = 375
          Height = 21
          TabOrder = 0
        end
      end
      object btnIniciarRestauracao: TBitBtn
        Left = 284
        Top = 64
        Width = 130
        Height = 30
        Caption = 'I&niciar Restaura'#231#227'o'
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
          FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF
          0000FFFFFFFFFFFF000000000000FFFFFFFFFFFF0000FFFFFFFFFFFFFF7F0000
          7FFFFFFFFFFFFFFF0000FFBD807F7F7F7F3F00003F7F7F7F7F80BFFF0000DC02
          000000000000000000000000000003DD0000BF00BFFFFFFFFFFFFFFFFFFFFFFF
          FFBF00BF0000BF00BFFFFFFFFFFFFFFFFFFFFFFFFFBF00BF0000BF00BFFFFFFF
          FFFFFFFFFFFFFFFFFFBF00BF0000BF00BFFFFFFFFFFFFFFFFFFFFFFFFFBF00BF
          0000BF00BFFFFFFFFFFFFFFFFFFFFFFFFFBF00BF0000BF00BFFFFFFFFFFFFFFF
          FFFFFFFFFFBF00BF0000BF00BFFFFFFFFFFFFFFFFFFFFFFFFFBF00BF0000BF00
          BFFFFFFFFFFFFFFFFFFFFFFFFFBF00BF0000BF00BFFFFFFFFFFFFFFFFFFFFFFF
          FFBF00BF0000DC02000000000000000000000000000002DC0000FFBC807F7F7F
          7F7F7F7F7F7F7F7F7F80BCFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000}
        TabOrder = 1
        OnClick = btnIniciarRestauracaoClick
      end
      object ProgressBarRestaurar: TProgressBar
        Left = 5
        Top = 98
        Width = 408
        Height = 8
        Smooth = True
        TabOrder = 2
      end
    end
  end
  object gpbConfiguracaoBanco: TGroupBox
    Left = 2
    Top = 5
    Width = 430
    Height = 65
    Caption = 'Configura'#231#245'es de Conex'#227'o'
    TabOrder = 1
    object lblServidor: TLabel
      Left = 10
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Servidor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCamino: TLabel
      Left = 10
      Top = 40
      Width = 52
      Height = 13
      Caption = 'Caminho:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescServidor: TLabel
      Left = 70
      Top = 18
      Width = 263
      Height = 13
      AutoSize = False
    end
    object lblDescCaminho: TLabel
      Left = 68
      Top = 37
      Width = 351
      Height = 13
      AutoSize = False
    end
    object lblPorta: TLabel
      Left = 341
      Top = 18
      Width = 34
      Height = 13
      Caption = 'Porta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescPorta: TLabel
      Left = 381
      Top = 18
      Width = 41
      Height = 13
      AutoSize = False
    end
  end
  object CamposObrigatorios: TValueListEditor
    Left = 155
    Top = 128
    Width = 129
    Height = 63
    TabStop = False
    DisplayOptions = [doColumnTitles, doKeyColFixed]
    Enabled = False
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
    ScrollBars = ssNone
    Strings.Strings = (
      '=')
    TabOrder = 2
    TitleCaptions.Strings = (
      'Componente'
      'Mensagem')
    Visible = False
    ColWidths = (
      67
      56)
  end
  object OpenDialogRestaurar: TOpenDialog
    DefaultExt = '*.BCK'
    Left = 41
    Top = 168
  end
  object IBOBackupService: TIBOBackupService
    Protocol = cpTCP_IP
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    BlockingFactor = 0
    Options = []
    Left = 70
    Top = 168
  end
  object IBORestoreService: TIBORestoreService
    Protocol = cpTCP_IP
    LoginPrompt = False
    TraceFlags = []
    Verbose = True
    PageBuffers = 0
    Options = [Replace]
    Left = 99
    Top = 168
  end
end
