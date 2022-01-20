inherited frmConsCliente: TfrmConsCliente
  Caption = 'Consulta - Cliente'
  ClientHeight = 572
  ClientWidth = 903
  OnCreate = FormCreate
  ExplicitWidth = 909
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 530
    Width = 903
    ExplicitTop = 530
    ExplicitWidth = 894
    inherited btnConfirmar: TBitBtn
      Left = 351
      OnClick = btnConfirmarClick
      ExplicitLeft = 351
    end
    inherited btnRetornar: TBitBtn
      Left = 451
      ModalResult = 4
      ExplicitLeft = 451
    end
  end
  inherited gpbPesquisa: TGroupBox
    Left = 7
    Top = 2
    Width = 889
    Height = 40
    Caption = 
      'Pesquisa por Nome ( Clique no t'#237'tulo para mudar o campo de pesqu' +
      'isa )'
    ExplicitLeft = 7
    ExplicitTop = 2
    ExplicitWidth = 889
    ExplicitHeight = 40
    inherited edtPesquisa: TEdit
      Left = 8
      Top = 14
      Width = 872
      MaxLength = 70
      OnChange = edtPesquisaChange
      ExplicitLeft = 8
      ExplicitTop = 14
      ExplicitWidth = 867
    end
  end
  inherited gpbRegistros: TGroupBox
    Left = 7
    Top = 43
    Width = 889
    Height = 343
    ExplicitLeft = 7
    ExplicitTop = 43
    ExplicitWidth = 889
    ExplicitHeight = 343
    inherited dbgRegistros: TDBGrid
      Width = 873
      Height = 321
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      OnDblClick = dbgRegistrosDblClick
      OnEnter = dbgRegistrosEnter
      OnExit = dbgRegistrosExit
      OnTitleClick = dbgRegistrosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_CLIENTE'
          Title.Caption = 'C'#243'digo'
          Width = 60
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
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_NASCIMENTO'
          Title.Caption = 'Dt.Nascimento'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_RG'
          Title.Caption = 'RG'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CPF'
          Title.Caption = 'CPF'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TELEFONERESIDENCIAL'
          Title.Caption = 'Tel.Resid'#234'ncial'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_TELEFONECOMERCIAL'
          Title.Caption = 'Tel.Comercial'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_CELULAR'
          Title.Caption = 'Celular'
          Width = 90
          Visible = True
        end>
    end
  end
  object gpbRG: TGroupBox [3]
    Left = 7
    Top = 389
    Width = 108
    Height = 39
    Caption = 'RG'
    Enabled = False
    TabOrder = 3
    object dbeRG: TDBEdit
      Left = 6
      Top = 13
      Width = 96
      Height = 21
      DataField = 'NR_RG'
      DataSource = dtsRegistros
      TabOrder = 0
    end
  end
  object gpbCPF: TGroupBox [4]
    Left = 119
    Top = 389
    Width = 108
    Height = 39
    Caption = 'CPF'
    Enabled = False
    TabOrder = 4
    object dbeCPF: TDBEdit
      Left = 6
      Top = 13
      Width = 96
      Height = 21
      DataField = 'NR_CPF'
      DataSource = dtsRegistros
      TabOrder = 0
    end
  end
  object gpbEstadoCivil: TGroupBox [5]
    Left = 230
    Top = 389
    Width = 186
    Height = 39
    Caption = 'Estado Civil'
    Enabled = False
    TabOrder = 5
    object dbeEstadoCivil: TDBEdit
      Left = 7
      Top = 13
      Width = 172
      Height = 21
      DataField = 'DS_ESTADOCIVIL'
      DataSource = dtsRegistros
      TabOrder = 0
    end
  end
  object gpbProfissao: TGroupBox [6]
    Left = 420
    Top = 389
    Width = 289
    Height = 39
    Caption = 'Profiss'#227'o'
    Enabled = False
    TabOrder = 6
    DesignSize = (
      289
      39)
    object dbeProfissao: TDBEdit
      Left = 6
      Top = 13
      Width = 277
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DS_PROFISSAO'
      DataSource = dtsRegistros
      TabOrder = 0
    end
  end
  object gpbEndereco: TGroupBox [7]
    Left = 7
    Top = 431
    Width = 702
    Height = 96
    Caption = 'Endere'#231'o'
    Enabled = False
    TabOrder = 7
    object gpbLogradouro: TGroupBox
      Left = 7
      Top = 13
      Width = 352
      Height = 39
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object dbeLogradouro: TDBEdit
        Left = 6
        Top = 13
        Width = 340
        Height = 21
        DataField = 'DS_LOGRADOURO'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbNumero: TGroupBox
      Left = 364
      Top = 13
      Width = 90
      Height = 39
      Caption = 'N'#250'mero'
      TabOrder = 1
      object dbeNumero: TDBEdit
        Left = 7
        Top = 13
        Width = 77
        Height = 21
        DataField = 'NR_NUMERO'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbComplemento: TGroupBox
      Left = 460
      Top = 13
      Width = 234
      Height = 39
      Caption = 'Complemento'
      TabOrder = 2
      DesignSize = (
        234
        39)
      object dbeComplemento: TDBEdit
        Left = 6
        Top = 13
        Width = 221
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DS_COMPLEMENTO'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbBairro: TGroupBox
      Left = 7
      Top = 52
      Width = 211
      Height = 39
      Caption = 'Bairro'
      TabOrder = 3
      object dbeBairro: TDBEdit
        Left = 6
        Top = 13
        Width = 198
        Height = 21
        DataField = 'DS_BAIRRO'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbCEP: TGroupBox
      Left = 225
      Top = 52
      Width = 107
      Height = 39
      Caption = 'CEP'
      TabOrder = 4
      object dbeCEP: TDBEdit
        Left = 7
        Top = 13
        Width = 94
        Height = 21
        DataField = 'NR_CEP'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbUF: TGroupBox
      Left = 338
      Top = 52
      Width = 45
      Height = 39
      Caption = 'UF'
      TabOrder = 5
      object dbeUf: TDBEdit
        Left = 6
        Top = 13
        Width = 31
        Height = 21
        DataField = 'CD_UF'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
    object gpbCidade: TGroupBox
      Left = 390
      Top = 52
      Width = 304
      Height = 39
      Caption = 'Cidade'
      TabOrder = 6
      DesignSize = (
        304
        39)
      object dbeCidade: TDBEdit
        Left = 6
        Top = 13
        Width = 292
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DS_MUNICIPIO'
        DataSource = dtsRegistros
        TabOrder = 0
      end
    end
  end
  object gpbFoto: TGroupBox [8]
    Left = 716
    Top = 388
    Width = 180
    Height = 139
    Caption = 'Foto'
    Enabled = False
    TabOrder = 8
    object dbiFoto: TDBImage
      Left = 28
      Top = 14
      Width = 123
      Height = 119
      DataField = 'FT_CLIENTE'
      DataSource = dtsRegistros
      ReadOnly = True
      Stretch = True
      TabOrder = 0
    end
  end
  inherited dtsRegistros: TDataSource
    DataSet = qryConsCliente
    Left = 32
    Top = 152
  end
  object qryConsCliente: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    KeyLinks.Strings = (
      'CAD_CLIENTE.CD_CLIENTE')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_CLIENTE.*,'
      '       CAD_MUNICIPIO.DS_MUNICIPIO'
      'FROM CAD_CLIENTE'
      
        'LEFT JOIN CAD_MUNICIPIO ON(CAD_MUNICIPIO.CD_MUNICIPIO = CAD_CLIE' +
        'NTE.CD_MUNICIPIO)'
      'WHERE UPPER( CAD_CLIENTE.DS_NOME ) LIKE  UPPER( '#39'%%'#39' )'
      '      AND CAD_CLIENTE.CD_CLIENTE <> 0'
      'ORDER BY CAD_CLIENTE.DS_NOME, CAD_CLIENTE.CD_CLIENTE')
    Left = 62
    Top = 152
  end
end
