inherited frmCadVendedor: TfrmCadVendedor
  Caption = 'Cadastro - Vendedor'
  ClientHeight = 479
  ClientWidth = 746
  ExplicitWidth = 752
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 439
    Width = 746
    ExplicitTop = 439
    ExplicitWidth = 746
    inherited btnConsultar: TBitBtn [0]
      Tag = 1
      Left = 433
      Enabled = False
      Visible = False
      ExplicitLeft = 433
    end
    inherited btnIncluir: TBitBtn [1]
      Left = 123
      ExplicitLeft = 123
    end
    inherited btnExcluir: TBitBtn [2]
      Left = 223
      ExplicitLeft = 223
    end
    inherited btnAlterar: TBitBtn [3]
      Left = 323
      ExplicitLeft = 323
    end
    inherited btnConfirmar: TBitBtn
      Left = 423
      ExplicitLeft = 423
    end
    inherited btnCancelar: TBitBtn
      Left = 523
      ExplicitLeft = 523
    end
  end
  object gpbCodigo: TGroupBox [1]
    Left = 3
    Top = 2
    Width = 93
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 1
    object dbeCodigo: TDBEdit
      Left = 6
      Top = 13
      Width = 80
      Height = 21
      DataField = 'CD_PROFISSIONAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbNome: TGroupBox [2]
    Left = 101
    Top = 2
    Width = 637
    Height = 41
    Caption = 'Nome'
    TabOrder = 2
    object dbeNome: TDBEdit
      Left = 8
      Top = 13
      Width = 622
      Height = 21
      DataField = 'DS_NOME'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbRG: TGroupBox [3]
    Left = 3
    Top = 48
    Width = 113
    Height = 41
    Caption = 'RG'
    TabOrder = 3
    object dbeRG: TDBEdit
      Left = 6
      Top = 13
      Width = 101
      Height = 21
      DataField = 'NR_RG'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbCPF: TGroupBox [4]
    Left = 122
    Top = 48
    Width = 120
    Height = 41
    Caption = 'CPF'
    TabOrder = 4
    object dbeCPF: TDBEdit
      Left = 6
      Top = 13
      Width = 108
      Height = 21
      DataField = 'NR_CPF'
      DataSource = dtsCadPadrao
      TabOrder = 0
      OnExit = dbeCPFExit
    end
  end
  object gpbNascimento: TGroupBox [5]
    Left = 246
    Top = 48
    Width = 492
    Height = 41
    Caption = 'Data Nascimento'
    TabOrder = 5
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
      Width = 405
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object gpbEndereco: TGroupBox [6]
    Left = 3
    Top = 96
    Width = 735
    Height = 107
    Caption = 'Endere'#231'o'
    TabOrder = 6
    object gpbLogradouro: TGroupBox
      Left = 101
      Top = 15
      Width = 304
      Height = 41
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dbeLogradouro: TDBEdit
        Left = 6
        Top = 13
        Width = 291
        Height = 21
        DataField = 'DS_LOGRADOURO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbNumero: TGroupBox
      Left = 407
      Top = 15
      Width = 86
      Height = 41
      Caption = 'N'#250'mero'
      TabOrder = 2
      object dbeNumero: TDBEdit
        Left = 6
        Top = 13
        Width = 74
        Height = 21
        DataField = 'NR_NUMERO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbComplemento: TGroupBox
      Left = 494
      Top = 15
      Width = 233
      Height = 41
      Caption = 'Complemento'
      TabOrder = 3
      object dbeComplemento: TDBEdit
        Left = 6
        Top = 13
        Width = 220
        Height = 21
        DataField = 'DS_COMPLEMENTO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbBairro: TGroupBox
      Left = 9
      Top = 58
      Width = 309
      Height = 41
      Caption = 'Bairro'
      TabOrder = 4
      object dbeBairro: TDBEdit
        Left = 6
        Top = 13
        Width = 296
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
        Width = 77
        Height = 21
        DataField = 'NR_CEP'
        DataSource = dtsCadPadrao
        TabOrder = 0
        OnEnter = dbeCEPEnter
        OnExit = dbeCEPExit
      end
    end
    object gpbUF: TGroupBox
      Left = 320
      Top = 58
      Width = 52
      Height = 41
      Caption = 'UF'
      TabOrder = 5
      object dbcUF: TDBLookupComboBox
        Left = 6
        Top = 13
        Width = 39
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
      Left = 374
      Top = 58
      Width = 353
      Height = 41
      Caption = 'Cidade'
      TabOrder = 6
      object dbcCidade: TDBLookupComboBox
        Left = 6
        Top = 13
        Width = 340
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
  object gpbTelefoneResidencial: TGroupBox [7]
    Left = 3
    Top = 205
    Width = 115
    Height = 41
    Caption = 'Telefone Resid'#234'ncial'
    TabOrder = 7
    object dbeTelefoneResidencial: TDBEdit
      Left = 6
      Top = 13
      Width = 102
      Height = 21
      DataField = 'NR_TELEFONERESIDENCIAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbCelular: TGroupBox [8]
    Left = 121
    Top = 205
    Width = 115
    Height = 41
    Caption = 'Celular'
    TabOrder = 8
    object dbeCelular: TDBEdit
      Left = 6
      Top = 13
      Width = 103
      Height = 21
      DataField = 'NR_CELULAR'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbEmail: TGroupBox [9]
    Left = 241
    Top = 205
    Width = 497
    Height = 41
    Caption = 'E-mail'
    TabOrder = 9
    object dbeEmail: TDBEdit
      Left = 6
      Top = 13
      Width = 483
      Height = 21
      DataField = 'DS_EMAIL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbProfissionais: TGroupBox [10]
    Left = 3
    Top = 247
    Width = 735
    Height = 188
    Caption = 'Vendedores'
    TabOrder = 10
    object dbgProfissionais: TDBGrid
      Left = 6
      Top = 14
      Width = 721
      Height = 167
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbgProfissionaisTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PROFISSIONAL'
          Title.Caption = 'C'#243'digo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_RG'
          Title.Caption = 'RG'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CPF'
          Title.Caption = 'CPF'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TELEFONERESIDENCIAL'
          Title.Caption = 'Tel.Resid'#234'ncial'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CELULAR'
          Title.Caption = 'Celular'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 170
    Top = 330
    Strings.Strings = (
      'dbeCodigo=Campo C'#243'digo deve ser informado'
      'dbeNome=Campo Nome deve ser informado')
    TabOrder = 11
    ExplicitLeft = 170
    ExplicitTop = 330
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 302
    Top = 364
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_PROFISSIONAL CAD_PROFISSIONAL'
      'WHERE'
      '   CD_PROFISSIONAL = :OLD_CD_PROFISSIONAL')
    EditSQL.Strings = (
      'UPDATE CAD_PROFISSIONAL CAD_PROFISSIONAL SET'
      '   CAD_PROFISSIONAL.CD_PROFISSIONAL = :CD_PROFISSIONAL, /*PK*/'
      '   CAD_PROFISSIONAL.DS_NOME = :DS_NOME,'
      
        '   CAD_PROFISSIONAL.DS_CONSELHOPROFISSIONAL = :DS_CONSELHOPROFIS' +
        'SIONAL,'
      
        '   CAD_PROFISSIONAL.NR_CONSELHOPROFISSIONAL = :NR_CONSELHOPROFIS' +
        'SIONAL,'
      '   CAD_PROFISSIONAL.NR_RG = :NR_RG,'
      '   CAD_PROFISSIONAL.NR_CPF = :NR_CPF,'
      '   CAD_PROFISSIONAL.DT_NASCIMENTO = :DT_NASCIMENTO,'
      '   CAD_PROFISSIONAL.DS_LOGRADOURO = :DS_LOGRADOURO,'
      '   CAD_PROFISSIONAL.NR_NUMERO = :NR_NUMERO,'
      '   CAD_PROFISSIONAL.DS_COMPLEMENTO = :DS_COMPLEMENTO,'
      '   CAD_PROFISSIONAL.DS_BAIRRO = :DS_BAIRRO,'
      '   CAD_PROFISSIONAL.NR_CEP = :NR_CEP,'
      '   CAD_PROFISSIONAL.CD_UF = :CD_UF,'
      '   CAD_PROFISSIONAL.CD_MUNICIPIO = :CD_MUNICIPIO,'
      
        '   CAD_PROFISSIONAL.NR_TELEFONERESIDENCIAL = :NR_TELEFONERESIDEN' +
        'CIAL,'
      
        '   CAD_PROFISSIONAL.NR_TELEFONECOMERCIAL = :NR_TELEFONECOMERCIAL' +
        ','
      '   CAD_PROFISSIONAL.NR_CELULAR = :NR_CELULAR,'
      '   CAD_PROFISSIONAL.DS_EMAIL = :DS_EMAIL,'
      '   CAD_PROFISSIONAL.DS_OBSERVACAO = :DS_OBSERVACAO,'
      
        '   CAD_PROFISSIONAL.FG_INTERVALOATENDIMENTO = :FG_INTERVALOATEND' +
        'IMENTO,'
      '   CAD_PROFISSIONAL.FG_PUBLICAR = :FG_PUBLICAR'
      'WHERE'
      '   CD_PROFISSIONAL = :OLD_CD_PROFISSIONAL')
    FieldsEditMask.Strings = (
      'NR_TELEFONERESIDENCIAL=!\(99\) 9999-9999;1;_'
      'NR_TELEFONECOMERCIAL=!\(99\) 9999-9999;1;_'
      'NR_CELULAR=!\(99\) 99999-9999;1;_'
      'NR_CEP=!99\.999\-999;1;_'
      'NR_CPF=!999\.999\.999\-99;1;_')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_PROFISSIONAL('
      '   CD_PROFISSIONAL, /*PK*/'
      '   DS_NOME,'
      '   DS_CONSELHOPROFISSIONAL,'
      '   NR_CONSELHOPROFISSIONAL,'
      '   NR_RG,'
      '   NR_CPF,'
      '   DT_NASCIMENTO,'
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
      '   DS_OBSERVACAO,'
      '   FG_INTERVALOATENDIMENTO,'
      '   FG_PUBLICAR)'
      'VALUES ('
      '   :CD_PROFISSIONAL,'
      '   :DS_NOME,'
      '   :DS_CONSELHOPROFISSIONAL,'
      '   :NR_CONSELHOPROFISSIONAL,'
      '   :NR_RG,'
      '   :NR_CPF,'
      '   :DT_NASCIMENTO,'
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
      '   :DS_OBSERVACAO,'
      '   :FG_INTERVALOATENDIMENTO,'
      '   :FG_PUBLICAR)')
    AfterOpen = qryCadPadraoAfterOpen
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'SELECT CAD_PROFISSIONAL.CD_PROFISSIONAL,'
      '       CAD_PROFISSIONAL.DS_NOME,'
      '       CAD_PROFISSIONAL.DS_CONSELHOPROFISSIONAL,'
      '       CAD_PROFISSIONAL.NR_CONSELHOPROFISSIONAL,'
      '       CAD_PROFISSIONAL.NR_RG,'
      '       CAD_PROFISSIONAL.NR_CPF,'
      '       CAD_PROFISSIONAL.DT_NASCIMENTO,'
      '       CAD_PROFISSIONAL.DS_LOGRADOURO,'
      '       CAD_PROFISSIONAL.NR_NUMERO,'
      '       CAD_PROFISSIONAL.DS_COMPLEMENTO,'
      '       CAD_PROFISSIONAL.DS_BAIRRO,'
      '       CAD_PROFISSIONAL.NR_CEP,'
      '       CAD_PROFISSIONAL.CD_UF,'
      '       CAD_PROFISSIONAL.CD_MUNICIPIO,'
      '       CAD_PROFISSIONAL.NR_TELEFONERESIDENCIAL,'
      '       CAD_PROFISSIONAL.NR_TELEFONECOMERCIAL,'
      '       CAD_PROFISSIONAL.NR_CELULAR,'
      '       CAD_PROFISSIONAL.DS_EMAIL,'
      '       CAD_PROFISSIONAL.DS_OBSERVACAO,'
      '       CAD_PROFISSIONAL.FG_INTERVALOATENDIMENTO,'
      '       CAD_PROFISSIONAL.FG_PUBLICAR'
      'FROM CAD_PROFISSIONAL'
      'ORDER BY CAD_PROFISSIONAL.DS_NOME')
    Left = 334
    Top = 364
  end
  inherited dtsCadPadrao: TDataSource
    OnDataChange = dtsCadPadraoDataChange
    Left = 334
    Top = 332
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
    Left = 476
    Top = 307
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
    Left = 508
    Top = 307
  end
  object qryConsProfissional: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFISSIONAL'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PROFISSIONAL.CD_PROFISSIONAL'
      'FROM CAD_PROFISSIONAL'
      'WHERE CAD_PROFISSIONAL.CD_PROFISSIONAL = :CD_PROFISSIONAL')
    Left = 303
    Top = 333
  end
  object qryConsCodigo: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT MAX( CAD_PROFISSIONAL.CD_PROFISSIONAL ) CD_PROFISSIONAL'
      'FROM CAD_PROFISSIONAL')
    Left = 334
    Top = 301
  end
  object dtsUF: TDataSource
    DataSet = qryUF
    Left = 477
    Top = 339
  end
  object dtsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 508
    Top = 339
  end
end
