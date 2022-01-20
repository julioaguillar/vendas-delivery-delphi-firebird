inherited frmCadEnderecoCEP: TfrmCadEnderecoCEP
  Caption = 'Cadastro - Endere'#231'o por CEP'
  ClientHeight = 466
  ClientWidth = 657
  ExplicitWidth = 663
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 426
    Width = 657
    ExplicitTop = 426
    ExplicitWidth = 657
    inherited btnConsultar: TBitBtn [0]
      Left = 5
      ExplicitLeft = 5
    end
    inherited btnIncluir: TBitBtn [1]
      Left = 129
      ExplicitLeft = 129
    end
    inherited btnExcluir: TBitBtn [2]
      Left = 229
      ExplicitLeft = 229
    end
    inherited btnAlterar: TBitBtn [3]
      Left = 329
      ExplicitLeft = 329
    end
    inherited btnConfirmar: TBitBtn
      Left = 429
      ExplicitLeft = 429
    end
    inherited btnCancelar: TBitBtn
      Left = 529
      ExplicitLeft = 529
    end
  end
  object gpbTipoLogradouro: TGroupBox [1]
    Left = 5
    Top = 46
    Width = 210
    Height = 44
    Caption = 'Tipo Logradouro'
    TabOrder = 4
    object dbeTipoLogradouro: TDBEdit
      Left = 6
      Top = 16
      Width = 195
      Height = 21
      DataField = 'DS_TIPOLOGRADOURO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbComplemento: TGroupBox [2]
    Left = 5
    Top = 92
    Width = 310
    Height = 44
    Caption = 'Complemento'
    TabOrder = 6
    object dbeComplemento: TDBEdit
      Left = 6
      Top = 16
      Width = 297
      Height = 21
      DataField = 'DS_COMPLEMENTO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbBairro: TGroupBox [3]
    Left = 318
    Top = 92
    Width = 332
    Height = 44
    Caption = 'Bairro'
    TabOrder = 7
    object dbeBairro: TDBEdit
      Left = 6
      Top = 16
      Width = 318
      Height = 21
      DataField = 'DS_BAIRRO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbEndereco: TGroupBox [4]
    Left = 5
    Top = 141
    Width = 645
    Height = 281
    Caption = 'Endere'#231'os'
    TabOrder = 8
    object dbgEndereco: TDBGrid
      Left = 6
      Top = 14
      Width = 633
      Height = 260
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
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_CEP'
          Title.Caption = 'CEP'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TIPOLOGRADOURO'
          Title.Caption = 'Tipo Logradouro'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_LOGRADOURO'
          Title.Caption = 'Logradouro'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_BAIRRO'
          Title.Caption = 'Bairro'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_UF'
          Title.Caption = 'UF'
          Width = 30
          Visible = True
        end>
    end
    object pnlAguarde: TPanel
      Left = 244
      Top = 80
      Width = 156
      Height = 41
      BevelInner = bvLowered
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 37
        Top = 14
        Width = 57
        Height = 13
        Caption = 'Aguarde...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 371
    Top = 302
    Strings.Strings = (
      'dbeCEP=Campo CEP n'#227'o informado')
    TabOrder = 9
    ExplicitLeft = 371
    ExplicitTop = 302
  end
  object gpbLogradouro: TGroupBox [6]
    Left = 218
    Top = 46
    Width = 432
    Height = 44
    Caption = 'gpbLogradouro'
    TabOrder = 5
    object dbeLogradouro: TDBEdit
      Left = 6
      Top = 16
      Width = 418
      Height = 21
      DataField = 'DS_LOGRADOURO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbCEP: TGroupBox [7]
    Left = 5
    Top = 3
    Width = 99
    Height = 41
    Caption = 'CEP'
    TabOrder = 1
    object dbeCEP: TDBEdit
      Left = 6
      Top = 13
      Width = 86
      Height = 21
      DataField = 'DS_CEP'
      DataSource = dtsCadPadrao
      MaxLength = 16
      TabOrder = 0
      OnExit = dbeCEPExit
      OnKeyPress = dbeCEPKeyPress
    end
  end
  object gpbUF: TGroupBox [8]
    Left = 107
    Top = 3
    Width = 57
    Height = 41
    Caption = 'UF'
    TabOrder = 2
    object dbcUF: TDBLookupComboBox
      Left = 6
      Top = 13
      Width = 44
      Height = 21
      DataField = 'CD_UF'
      DataSource = dtsCadPadrao
      KeyField = 'CD_UF'
      ListField = 'CD_UF'
      ListSource = dtsConsUF
      NullValueKey = 46
      TabOrder = 0
      OnEnter = dbcUFEnter
    end
  end
  object gpbCidade: TGroupBox [9]
    Left = 169
    Top = 3
    Width = 481
    Height = 41
    Caption = 'Cidade'
    TabOrder = 3
    object dbeCidade: TDBEdit
      Left = 6
      Top = 13
      Width = 467
      Height = 21
      DataField = 'DS_MUNICIPIO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 507
    Top = 336
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_ENDERECO CAD_ENDERECO'
      'WHERE'
      '   CD_ENDERECO = :OLD_CD_ENDERECO')
    EditSQL.Strings = (
      'UPDATE CAD_ENDERECO CAD_ENDERECO SET'
      '   CAD_ENDERECO.CD_ENDERECO = :CD_ENDERECO, /*PK*/'
      '   CAD_ENDERECO.CD_UF = :CD_UF,'
      '   CAD_ENDERECO.DS_TIPOLOGRADOURO = :DS_TIPOLOGRADOURO,'
      '   CAD_ENDERECO.DS_LOGRADOURO = :DS_LOGRADOURO,'
      '   CAD_ENDERECO.DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '   CAD_ENDERECO.DS_CEP = :DS_CEP,'
      '   CAD_ENDERECO.DS_BAIRRO = :DS_BAIRRO,'
      '   CAD_ENDERECO.DS_MUNICIPIO = :DS_MUNICIPIO'
      'WHERE'
      '   CD_ENDERECO = :OLD_CD_ENDERECO')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_ENDERECO('
      '   CD_ENDERECO, /*PK*/'
      '   CD_UF,'
      '   DS_TIPOLOGRADOURO,'
      '   DS_LOGRADOURO,'
      '   DS_COMPLEMENTO,'
      '   DS_CEP,'
      '   DS_BAIRRO,'
      '   DS_MUNICIPIO)'
      'VALUES ('
      '   :CD_ENDERECO,'
      '   :CD_UF,'
      '   :DS_TIPOLOGRADOURO,'
      '   :DS_LOGRADOURO,'
      '   :DS_COMPLEMENTO,'
      '   :DS_CEP,'
      '   :DS_BAIRRO,'
      '   :DS_MUNICIPIO)')
    SQL.Strings = (
      'SELECT CAD_ENDERECO.CD_ENDERECO,'
      '       CAD_ENDERECO.CD_UF,'
      '       CAD_ENDERECO.DS_TIPOLOGRADOURO,'
      '       CAD_ENDERECO.DS_LOGRADOURO,'
      '       CAD_ENDERECO.DS_COMPLEMENTO,'
      '       CAD_ENDERECO.DS_CEP,'
      '       CAD_ENDERECO.DS_BAIRRO,'
      '       CAD_ENDERECO.DS_MUNICIPIO'
      'FROM CAD_ENDERECO')
    Left = 539
    Top = 336
  end
  inherited dtsCadPadrao: TDataSource
    Left = 539
    Top = 304
  end
  object qryConsUF: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_UNIDADEFEDERAL.CD_UF,'
      '       CAD_UNIDADEFEDERAL.DS_ESTADO'
      'FROM CAD_UNIDADEFEDERAL')
    Left = 571
    Top = 336
  end
  object dtsConsUF: TDataSource
    DataSet = qryConsUF
    Left = 571
    Top = 303
  end
  object qryConsID: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT MAX(CAD_ENDERECO.CD_ENDERECO) ID'
      'FROM CAD_ENDERECO')
    Left = 603
    Top = 336
  end
  object qryConsCEP: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_CEP'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_ENDERECO.CD_ENDERECO'
      'FROM CAD_ENDERECO'
      'WHERE CAD_ENDERECO.DS_CEP = :DS_CEP')
    Left = 603
    Top = 304
  end
end
