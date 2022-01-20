inherited frmLctContasPagar: TfrmLctContasPagar
  Caption = 'Lan'#231'amento - Contas a Pagar'
  ClientHeight = 492
  ClientWidth = 894
  ExplicitWidth = 900
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 452
    Width = 894
    ExplicitTop = 452
    ExplicitWidth = 894
    inherited btnCancelar: TBitBtn [0]
      Tag = 1
      Left = 865
      Top = 3
      Width = 14
      Visible = False
      ExplicitLeft = 865
      ExplicitTop = 3
      ExplicitWidth = 14
    end
    inherited btnConfirmar: TBitBtn [1]
      Tag = 1
      Left = 848
      Top = 3
      Width = 16
      Visible = False
      ExplicitLeft = 848
      ExplicitTop = 3
      ExplicitWidth = 16
    end
    inherited btnIncluir: TBitBtn [2]
      Left = 247
      ExplicitLeft = 247
    end
    inherited btnExcluir: TBitBtn [3]
      Left = 347
      ExplicitLeft = 347
    end
    inherited btnAlterar: TBitBtn [4]
      Left = 447
      ExplicitLeft = 447
    end
    inherited btnConsultar: TBitBtn [5]
      Left = 547
      ExplicitLeft = 547
    end
  end
  object gpbContas: TGroupBox [1]
    Left = 4
    Top = 5
    Width = 884
    Height = 441
    Caption = 'Contas'
    TabOrder = 2
    object lblDe: TLabel
      Left = 102
      Top = 21
      Width = 12
      Height = 13
      Caption = 'de'
    end
    object dbgContas: TDBGrid
      Left = 7
      Top = 43
      Width = 869
      Height = 391
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
      OnTitleClick = dbgContasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DT_VENCIMENTO'
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_PAGARA'
          Title.Caption = 'Pagar a'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_OBSERVACAO'
          Title.Caption = 'Observa'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VR_CONTAPAGAR'
          Title.Caption = 'Valor'
          Width = 90
          Visible = True
        end>
    end
    object cbbMes: TComboBox
      Tag = 1
      Left = 7
      Top = 17
      Width = 88
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      TabStop = False
      OnChange = cbbMesChange
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object edtAno: TEdit
      Tag = 1
      Left = 121
      Top = 17
      Width = 43
      Height = 21
      TabStop = False
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 2
      OnExit = edtAnoExit
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 612
    Top = 344
    ExplicitLeft = 612
    ExplicitTop = 344
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 748
    Top = 378
  end
  inherited qryCadPadrao: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM LCT_CONTASPAGAR LCT_CONTASPAGAR'
      'WHERE'
      '   ID_CONTAPAGAR = :OLD_ID_CONTAPAGAR')
    EditSQL.Strings = (
      'UPDATE LCT_CONTASPAGAR LCT_CONTASPAGAR SET'
      '   LCT_CONTASPAGAR.ID_CONTAPAGAR = :ID_CONTAPAGAR, /*PK*/'
      '   LCT_CONTASPAGAR.DT_VENCIMENTO = :DT_VENCIMENTO,'
      '   LCT_CONTASPAGAR.VR_CONTAPAGAR = :VR_CONTAPAGAR,'
      '   LCT_CONTASPAGAR.DS_PAGARA = :DS_PAGARA,'
      '   LCT_CONTASPAGAR.DS_DESCRICAO = :DS_DESCRICAO,'
      '   LCT_CONTASPAGAR.DS_OBSERVACAO = :DS_OBSERVACAO,'
      '   LCT_CONTASPAGAR.FG_STATUS = :FG_STATUS'
      'WHERE'
      '   ID_CONTAPAGAR = :OLD_ID_CONTAPAGAR')
    FieldsDisplayFormat.Strings = (
      'DT_VENCIMENTO=dd/MM/yyyy'
      'VR_CONTAPAGAR=,0.00')
    GeneratorLinks.Strings = (
      'ID_CONTAPAGAR=GEN_ID_LCT_CONTASPAGAR')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO LCT_CONTASPAGAR('
      '   ID_CONTAPAGAR, /*PK*/'
      '   DT_VENCIMENTO,'
      '   VR_CONTAPAGAR,'
      '   DS_PAGARA,'
      '   DS_DESCRICAO,'
      '   DS_OBSERVACAO,'
      '   FG_STATUS)'
      'VALUES ('
      '   :ID_CONTAPAGAR,'
      '   :DT_VENCIMENTO,'
      '   :VR_CONTAPAGAR,'
      '   :DS_PAGARA,'
      '   :DS_DESCRICAO,'
      '   :DS_OBSERVACAO,'
      '   :FG_STATUS)')
    KeyLinks.Strings = (
      'LCT_CONTASPAGAR.ID_CONTAPAGAR')
    AfterOpen = qryCadPadraoAfterOpen
    SQL.Strings = (
      'SELECT LCT_CONTASPAGAR.ID_CONTAPAGAR,'
      '       LCT_CONTASPAGAR.DT_VENCIMENTO,'
      '       LCT_CONTASPAGAR.VR_CONTAPAGAR,'
      '       LCT_CONTASPAGAR.DS_PAGARA,'
      '       LCT_CONTASPAGAR.DS_DESCRICAO,'
      '       LCT_CONTASPAGAR.DS_OBSERVACAO,'
      '       LCT_CONTASPAGAR.FG_STATUS'
      'FROM LCT_CONTASPAGAR'
      
        'WHERE LCT_CONTASPAGAR.DT_VENCIMENTO BETWEEN :DT_INICIO AND :DT_F' +
        'IM'
      'ORDER BY LCT_CONTASPAGAR.DT_VENCIMENTO ASC')
    Left = 780
    Top = 378
  end
  inherited dtsCadPadrao: TDataSource
    Left = 780
    Top = 346
  end
end
