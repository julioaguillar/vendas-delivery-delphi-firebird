inherited frmLctContasReceber: TfrmLctContasReceber
  Caption = 'Lan'#231'amento - Contas a Receber'
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
      Left = 840
      Top = 7
      Width = 18
      Visible = False
      ExplicitLeft = 840
      ExplicitTop = 7
      ExplicitWidth = 18
    end
    inherited btnConfirmar: TBitBtn [1]
      Tag = 1
      Left = 861
      Top = 7
      Width = 18
      Visible = False
      ExplicitLeft = 861
      ExplicitTop = 7
      ExplicitWidth = 18
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
  object gpbContas: TGroupBox [2]
    Left = 4
    Top = 5
    Width = 884
    Height = 442
    Caption = 'Contas'
    TabOrder = 2
    object lblDe: TLabel
      Left = 104
      Top = 21
      Width = 12
      Height = 13
      Caption = 'de'
    end
    object dbgContas: TDBGrid
      Left = 7
      Top = 42
      Width = 870
      Height = 393
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
          FieldName = 'DT_RECEBIMENTO'
          Title.Caption = 'Recebimento'
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
          FieldName = 'DS_RECEBERDE'
          Title.Caption = 'Receber de'
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
          FieldName = 'VR_CONTARECEBER'
          Title.Caption = 'Valor'
          Width = 90
          Visible = True
        end>
    end
    object cbbMes: TComboBox
      Tag = 1
      Left = 9
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
      Left = 123
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
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 768
    Top = 322
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
      'DELETE FROM LCT_CONTASRECEBER LCT_CONTASRECEBER'
      'WHERE'
      '   ID_CONTARECEBER = :OLD_ID_CONTARECEBER')
    EditSQL.Strings = (
      'UPDATE LCT_CONTASRECEBER LCT_CONTASRECEBER SET'
      '   LCT_CONTASRECEBER.ID_CONTARECEBER = :ID_CONTARECEBER, /*PK*/'
      '   LCT_CONTASRECEBER.DT_RECEBIMENTO = :DT_RECEBIMENTO,'
      '   LCT_CONTASRECEBER.VR_CONTARECEBER = :VR_CONTARECEBER,'
      '   LCT_CONTASRECEBER.DS_RECEBERDE = :DS_RECEBERDE,'
      '   LCT_CONTASRECEBER.DS_DESCRICAO = :DS_DESCRICAO,'
      '   LCT_CONTASRECEBER.DS_OBSERVACAO = :DS_OBSERVACAO,'
      '   LCT_CONTASRECEBER.FG_STATUS = :FG_STATUS'
      'WHERE'
      '   ID_CONTARECEBER = :OLD_ID_CONTARECEBER')
    FieldsDisplayFormat.Strings = (
      'DT_RECEBIMENTO=dd/MM/yyyy'
      'VR_CONTARECEBER=,0.00')
    GeneratorLinks.Strings = (
      'ID_CONTARECEBER=GEN_ID_LCT_CONTASRECEBER')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO LCT_CONTASRECEBER('
      '   ID_CONTARECEBER, /*PK*/'
      '   DT_RECEBIMENTO,'
      '   VR_CONTARECEBER,'
      '   DS_RECEBERDE,'
      '   DS_DESCRICAO,'
      '   DS_OBSERVACAO,'
      '   FG_STATUS)'
      'VALUES ('
      '   :ID_CONTARECEBER,'
      '   :DT_RECEBIMENTO,'
      '   :VR_CONTARECEBER,'
      '   :DS_RECEBERDE,'
      '   :DS_DESCRICAO,'
      '   :DS_OBSERVACAO,'
      '   :FG_STATUS)')
    KeyLinks.Strings = (
      'LCT_CONTASRECEBER.ID_CONTARECEBER')
    AfterOpen = qryCadPadraoAfterOpen
    SQL.Strings = (
      'SELECT LCT_CONTASRECEBER.ID_CONTARECEBER,'
      '       LCT_CONTASRECEBER.DT_RECEBIMENTO,'
      '       LCT_CONTASRECEBER.VR_CONTARECEBER,'
      '       LCT_CONTASRECEBER.DS_RECEBERDE,'
      '       LCT_CONTASRECEBER.DS_DESCRICAO,'
      '       LCT_CONTASRECEBER.DS_OBSERVACAO,'
      '       LCT_CONTASRECEBER.FG_STATUS'
      'FROM LCT_CONTASRECEBER'
      
        'WHERE LCT_CONTASRECEBER.DT_RECEBIMENTO BETWEEN :DT_INICIO AND :D' +
        'T_FIM'
      'ORDER BY LCT_CONTASRECEBER.DT_RECEBIMENTO ASC')
    Left = 800
    Top = 322
  end
  inherited dtsCadPadrao: TDataSource
    Left = 800
    Top = 290
  end
end
