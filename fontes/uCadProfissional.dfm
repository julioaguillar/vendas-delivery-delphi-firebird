inherited frmCadProfissional: TfrmCadProfissional
  Caption = 'Cadastro - Profissional'
  ClientHeight = 445
  ClientWidth = 843
  ExplicitWidth = 849
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 405
    Width = 843
    TabOrder = 11
    ExplicitTop = 439
    ExplicitWidth = 843
    object btnHorario: TSpeedButton [0]
      Left = 3
      Top = 5
      Width = 140
      Height = 30
      Caption = '&Hor'#225'rio atendimento'
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBCBCBC8C8C8C808080A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808004040400
        00000000000000000000000808087C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFF343434000000606060D7D7D7FFFFFFFFFFFF
        BCBCBC4C4C4C0000004C4C4CFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFF505050040404B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494
        940000008C8C8CFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFC3C3C30000007474
        74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFF545454080808E3
        E3E3FFFFFFFFFFFF0000FFFFFFFFFFFF707070000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA4A4A4181818484848FFFFFFE3E3E3000000ACACACFFFFFFFFFFFF
        0000FFFFFFFFFFFF4040402C2C2CFFFFFFFFFFFFFFFFFFFFFFFF606060242424
        B8B8B8FFFFFFFFFFFFFFFFFF1C1C1C747474FFFFFFFFFFFF0000FFFFFFFFFFFF
        484848404040FFFFFFFFFFFFFFFFFFFFFFFF404040A0A0A0FFFFFFFFFFFFFFFF
        FFFFFFFF1C1C1C5C5C5CFFFFFFFFFFFF0000FFFFFFFFFFFF747474202020FFFF
        FFFFFFFFFFFFFFFFFFFF404040A0A0A0FFFFFFFFFFFFFFFFFFFFFFFF00000078
        7878FFFFFFFFFFFF0000FFFFFFFFFFFFACACAC000000B4B4B4FFFFFFFFFFFFFF
        FFFF404040A0A0A0FFFFFFFFFFFFFFFFFF909090000000BCBCBCFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFF3030301C1C1CFFFFFFFFFFFFFFFFFF404040A0A0A0
        FFFFFFFFFFFFDFDFDF0C0C0C383838FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        BFBFBFCFCFCF080808202020BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFACACAC1414
        14101010D7D7D7BFBFBFFFFFFFFFFFFF0000FFFFFFB0B0B00000006C6C6CBCBC
        BC1818180000002424245454546060602C2C2C000000383838CFCFCF50505000
        0000CFCFCFFFFFFF0000FFFFFFFFFFFF787878000000484848E3E3E388888840
        4040202020303030646464A0A0A0E3E3E3303030040404909090FFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFA0A0A0040404646464FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4040400C0C0CB8B8B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDF
        DFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      OnClick = btnHorarioClick
    end
    inherited btnConsultar: TBitBtn [1]
      Tag = 1
      Left = 822
      Width = 16
      Enabled = False
      Visible = False
      ExplicitLeft = 822
      ExplicitWidth = 16
    end
    inherited btnIncluir: TBitBtn [2]
      Left = 206
      Width = 101
      ExplicitLeft = 206
      ExplicitWidth = 101
    end
    inherited btnExcluir: TBitBtn [3]
      Left = 307
      Width = 101
      ExplicitLeft = 307
      ExplicitWidth = 101
    end
    inherited btnAlterar: TBitBtn [4]
      Left = 408
      ExplicitLeft = 408
    end
    inherited btnConfirmar: TBitBtn
      Left = 509
      ExplicitLeft = 509
    end
    inherited btnCancelar: TBitBtn
      Left = 609
      ExplicitLeft = 609
    end
  end
  object gpbCodigo: TGroupBox [1]
    Left = 4
    Top = 2
    Width = 109
    Height = 41
    Caption = 'C'#243'digo'
    TabOrder = 0
    object dbeCodigo: TDBEdit
      Left = 8
      Top = 13
      Width = 93
      Height = 21
      DataField = 'CD_PROFISSIONAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbNome: TGroupBox [2]
    Left = 117
    Top = 2
    Width = 445
    Height = 41
    Caption = 'Nome'
    TabOrder = 1
    object dbeNome: TDBEdit
      Left = 8
      Top = 13
      Width = 429
      Height = 21
      DataField = 'DS_NOME'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbRG: TGroupBox [3]
    Left = 567
    Top = 2
    Width = 130
    Height = 41
    Caption = 'RG'
    TabOrder = 2
    object dbeRG: TDBEdit
      Left = 8
      Top = 13
      Width = 115
      Height = 21
      DataField = 'NR_RG'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbCPF: TGroupBox [4]
    Left = 703
    Top = 2
    Width = 135
    Height = 41
    Caption = 'CPF'
    TabOrder = 3
    object dbeCPF: TDBEdit
      Left = 8
      Top = 13
      Width = 119
      Height = 21
      DataField = 'NR_CPF'
      DataSource = dtsCadPadrao
      TabOrder = 0
      OnExit = dbeCPFExit
    end
  end
  object gpbNascimento: TGroupBox [5]
    Left = 4
    Top = 49
    Width = 370
    Height = 41
    Caption = 'Data Nascimento'
    TabOrder = 4
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
      Width = 282
      Height = 21
      Enabled = False
      TabOrder = 1
    end
  end
  object gpbEndereco: TGroupBox [6]
    Left = 4
    Top = 96
    Width = 834
    Height = 107
    Caption = 'Endere'#231'o'
    TabOrder = 8
    object gpbLogradouro: TGroupBox
      Left = 108
      Top = 15
      Width = 359
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
        Top = 14
        Width = 345
        Height = 21
        DataField = 'DS_LOGRADOURO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbNumero: TGroupBox
      Left = 478
      Top = 15
      Width = 96
      Height = 41
      Caption = 'N'#250'mero'
      TabOrder = 2
      object dbeNumero: TDBEdit
        Left = 7
        Top = 14
        Width = 82
        Height = 21
        DataField = 'NR_NUMERO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbComplemento: TGroupBox
      Left = 586
      Top = 15
      Width = 240
      Height = 41
      Caption = 'Complemento'
      TabOrder = 3
      object dbeComplemento: TDBEdit
        Left = 7
        Top = 14
        Width = 226
        Height = 21
        DataField = 'DS_COMPLEMENTO'
        DataSource = dtsCadPadrao
        TabOrder = 0
      end
    end
    object gpbBairro: TGroupBox
      Left = 9
      Top = 58
      Width = 334
      Height = 41
      Caption = 'Bairro'
      TabOrder = 4
      object dbeBairro: TDBEdit
        Left = 6
        Top = 14
        Width = 320
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
        Top = 14
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
      Left = 353
      Top = 58
      Width = 59
      Height = 41
      Caption = 'UF'
      TabOrder = 5
      object dbcUF: TDBLookupComboBox
        Left = 6
        Top = 14
        Width = 47
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
      Left = 423
      Top = 58
      Width = 403
      Height = 41
      Caption = 'Cidade'
      TabOrder = 6
      object dbcCidade: TDBLookupComboBox
        Left = 6
        Top = 14
        Width = 390
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
    Left = 379
    Top = 49
    Width = 150
    Height = 41
    Caption = 'Telefone Resid'#234'ncial'
    TabOrder = 5
    object dbeTelefoneResidencial: TDBEdit
      Left = 8
      Top = 13
      Width = 134
      Height = 21
      DataField = 'NR_TELEFONERESIDENCIAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbCelular: TGroupBox [8]
    Left = 688
    Top = 49
    Width = 150
    Height = 41
    Caption = 'Celular'
    TabOrder = 7
    object dbeCelular: TDBEdit
      Left = 8
      Top = 13
      Width = 135
      Height = 21
      DataField = 'NR_CELULAR'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbTelefoneComercial: TGroupBox [9]
    Left = 534
    Top = 49
    Width = 150
    Height = 41
    Caption = 'Telefone Comercial'
    TabOrder = 6
    object dbeTelefoneComercial: TDBEdit
      Left = 8
      Top = 13
      Width = 135
      Height = 21
      DataField = 'NR_TELEFONECOMERCIAL'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbProfissionais: TGroupBox [10]
    Left = 4
    Top = 209
    Width = 834
    Height = 188
    Caption = 'Profissionais'
    TabOrder = 9
    object dbgProfissionais: TDBGrid
      Left = 6
      Top = 14
      Width = 821
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
          FieldName = 'NR_TELEFONECOMERCIAL'
          Title.Caption = 'Tel.Comercial'
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
    Left = 615
    Top = 346
    Strings.Strings = (
      'dbeCodigo=Campo C'#243'digo deve ser informado'
      'dbeNome=Campo Nome deve ser informado')
    TabOrder = 10
    ExplicitLeft = 615
    ExplicitTop = 346
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 747
    Top = 380
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
        'IMENTO'
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
      '   FG_INTERVALOATENDIMENTO)'
      'VALUES ('
      '   :CD_PROFISSIONAL,'
      '   :DS_NOME,'
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
      '   :FG_INTERVALOATENDIMENTO)')
    AfterOpen = qryCadPadraoAfterOpen
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'SELECT CAD_PROFISSIONAL.CD_PROFISSIONAL,'
      '       CAD_PROFISSIONAL.DS_NOME,'
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
      '       CAD_PROFISSIONAL.FG_INTERVALOATENDIMENTO'
      'FROM CAD_PROFISSIONAL'
      'ORDER BY CAD_PROFISSIONAL.DS_NOME')
    Left = 779
    Top = 380
  end
  inherited dtsCadPadrao: TDataSource
    OnDataChange = dtsCadPadraoDataChange
    Left = 779
    Top = 348
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
    Left = 747
    Top = 318
  end
  object qryConsCodigo: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT MAX( CAD_PROFISSIONAL.CD_PROFISSIONAL ) CD_PROFISSIONAL'
      'FROM CAD_PROFISSIONAL')
    Left = 779
    Top = 317
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
  object qryInsertHorario: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFISSIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_DIASEMANA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DS_DIASEMANA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HR_ENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HR_SAIDAINTERVALO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HR_ENTRADAINTERVALO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'HR_SAIDA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'INSERT INTO CAD_PROFISSIONALHORARIO ('
      '  CD_PROFISSIONAL, ID_DIASEMANA, DS_DIASEMANA,'
      '  HR_ENTRADA, HR_SAIDAINTERVALO, HR_ENTRADAINTERVALO, HR_SAIDA)'
      'VALUES ('
      '  :CD_PROFISSIONAL, :ID_DIASEMANA, :DS_DIASEMANA,'
      
        '  :HR_ENTRADA, :HR_SAIDAINTERVALO, :HR_ENTRADAINTERVALO, :HR_SAI' +
        'DA)')
    Left = 779
    Top = 288
  end
  object qryConsHorario: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFISSIONAL'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT DISTINCT CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL'
      'FROM CAD_PROFISSIONALHORARIO'
      'WHERE CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL = :CD_PROFISSIONAL')
    Left = 747
    Top = 349
  end
end
