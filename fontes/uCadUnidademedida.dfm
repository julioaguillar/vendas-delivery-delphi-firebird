inherited frmCadUnidademedida: TfrmCadUnidademedida
  Caption = 'Cadastro - Categoria Produto'
  ClientHeight = 355
  ClientWidth = 510
  ExplicitWidth = 516
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 315
    Width = 510
    ExplicitTop = 315
    ExplicitWidth = 510
    inherited btnConsultar: TBitBtn [0]
      Tag = 1
      Left = 246
      Enabled = False
      Visible = False
      ExplicitLeft = 246
    end
    inherited btnIncluir: TBitBtn [1]
      Left = 5
      ExplicitLeft = 5
    end
    inherited btnExcluir: TBitBtn [2]
      Left = 105
      ExplicitLeft = 105
    end
    inherited btnAlterar: TBitBtn [3]
      Left = 205
      ExplicitLeft = 205
    end
    inherited btnConfirmar: TBitBtn
      Left = 305
      ExplicitLeft = 305
    end
    inherited btnCancelar: TBitBtn
      Left = 405
      ExplicitLeft = 405
    end
  end
  object gpbNome: TGroupBox [1]
    Left = 156
    Top = 1
    Width = 297
    Height = 40
    Caption = 'Descri'#231#227'o'
    TabOrder = 2
    object dbeDescricao: TDBEdit
      Left = 6
      Top = 14
      Width = 283
      Height = 21
      DataField = 'DS_UNIDADEMEDIDA'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbProdutos: TGroupBox [2]
    Left = 57
    Top = 47
    Width = 396
    Height = 262
    Caption = 'Categorias'
    TabOrder = 3
    object dbgProdutos: TDBGrid
      Left = 7
      Top = 16
      Width = 381
      Height = 239
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FG_UNIDADEMEDIDA'
          Title.Caption = 'Unidade'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_UNIDADEMEDIDA'
          Title.Caption = 'Descri'#231#227'o'
          Width = 270
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 85
    Top = 152
    Strings.Strings = (
      'dbeUnidade=Unidade deve ser informada'
      'dbedescricao=descri'#231#227'o deve ser informada')
    TabOrder = 4
    ExplicitLeft = 85
    ExplicitTop = 152
  end
  object GroupBox1: TGroupBox [4]
    Left = 57
    Top = 1
    Width = 94
    Height = 40
    Caption = 'Unidade'
    TabOrder = 1
    object dbeUnidade: TDBEdit
      Left = 6
      Top = 14
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FG_UNIDADEMEDIDA'
      DataSource = dtsCadPadrao
      Enabled = False
      MaxLength = 5
      TabOrder = 0
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 244
    Top = 218
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_UNIDADEMEDIDA CAD_UNIDADEMEDIDA'
      'WHERE'
      '   FG_UNIDADEMEDIDA = :OLD_FG_UNIDADEMEDIDA'
      '')
    EditSQL.Strings = (
      'UPDATE CAD_UNIDADEMEDIDA CAD_UNIDADEMEDIDA SET'
      
        '   CAD_UNIDADEMEDIDA.FG_UNIDADEMEDIDA = :FG_UNIDADEMEDIDA, /*PK*' +
        '/'
      '   CAD_UNIDADEMEDIDA.DS_UNIDADEMEDIDA = :DS_UNIDADEMEDIDA'
      'WHERE'
      '   FG_UNIDADEMEDIDA = :OLD_FG_UNIDADEMEDIDA'
      '')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_UNIDADEMEDIDA('
      '   FG_UNIDADEMEDIDA, /*PK*/'
      '   DS_UNIDADEMEDIDA)'
      'VALUES ('
      '   :FG_UNIDADEMEDIDA,'
      '   :DS_UNIDADEMEDIDA)')
    SQL.Strings = (
      'SELECT CAD_UNIDADEMEDIDA.FG_UNIDADEMEDIDA,'
      '       CAD_UNIDADEMEDIDA.DS_UNIDADEMEDIDA'
      'FROM CAD_UNIDADEMEDIDA')
    Left = 348
    Top = 218
  end
  inherited dtsCadPadrao: TDataSource
    Left = 351
    Top = 155
  end
  object qryConsUnidade: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'FG_UNIDADEMEDIDA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_UNIDADEMEDIDA.FG_UNIDADEMEDIDA'
      'FROM CAD_UNIDADEMEDIDA'
      
        'WHERE UPPER(CAD_UNIDADEMEDIDA.FG_UNIDADEMEDIDA) = UPPER(:FG_UNID' +
        'ADEMEDIDA)')
    Left = 261
    Top = 155
  end
end
