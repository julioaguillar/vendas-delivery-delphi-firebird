inherited frmCadCategoriaProduto: TfrmCadCategoriaProduto
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
      Left = 406
      Enabled = False
      Visible = False
      ExplicitLeft = 406
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
      Left = 306
      ExplicitLeft = 306
    end
    inherited btnCancelar: TBitBtn
      Left = 406
      ExplicitLeft = 406
    end
  end
  object gpbNome: TGroupBox [1]
    Left = 57
    Top = 1
    Width = 396
    Height = 40
    Caption = 'Descri'#231#227'o'
    TabOrder = 1
    object dbeDescricao: TDBEdit
      Left = 6
      Top = 14
      Width = 382
      Height = 21
      DataField = 'DS_PRODUTOCATEGORIA'
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
    TabOrder = 2
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
          FieldName = 'DS_PRODUTOCATEGORIA'
          Title.Caption = 'Descri'#231#227'o'
          Width = 345
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 85
    Top = 152
    Strings.Strings = (
      'dbeDescricao=Descri'#231#227'o da Categoria deve ser informada'
      '=')
    TabOrder = 3
    ExplicitLeft = 85
    ExplicitTop = 152
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 244
    Top = 218
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_PRODUTOCATEGORIA CAD_PRODUTOCATEGORIA'
      'WHERE'
      '   ID_PRODUTOCATEGORIA = :OLD_ID_PRODUTOCATEGORIA')
    EditSQL.Strings = (
      'UPDATE CAD_PRODUTOCATEGORIA CAD_PRODUTOCATEGORIA SET'
      
        '   CAD_PRODUTOCATEGORIA.ID_PRODUTOCATEGORIA = :ID_PRODUTOCATEGOR' +
        'IA, /*PK*/'
      
        '   CAD_PRODUTOCATEGORIA.DS_PRODUTOCATEGORIA = :DS_PRODUTOCATEGOR' +
        'IA'
      'WHERE'
      '   ID_PRODUTOCATEGORIA = :OLD_ID_PRODUTOCATEGORIA')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_PRODUTOCATEGORIA('
      '   ID_PRODUTOCATEGORIA, /*PK*/'
      '   DS_PRODUTOCATEGORIA)'
      'VALUES ('
      '   :ID_PRODUTOCATEGORIA,'
      '   :DS_PRODUTOCATEGORIA)')
    SQL.Strings = (
      'SELECT CAD_PRODUTOCATEGORIA.ID_PRODUTOCATEGORIA,'
      '       CAD_PRODUTOCATEGORIA.DS_PRODUTOCATEGORIA'
      'FROM CAD_PRODUTOCATEGORIA')
    Left = 332
    Top = 218
  end
  inherited dtsCadPadrao: TDataSource
    Left = 351
    Top = 155
  end
  object qryConsCategoria: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_PRODUTOCATEGORIA'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTOCATEGORIA.ID_PRODUTOCATEGORIA'
      'FROM CAD_PRODUTOCATEGORIA'
      
        'WHERE UPPER(CAD_PRODUTOCATEGORIA.DS_PRODUTOCATEGORIA) = UPPER(:D' +
        'S_PRODUTOCATEGORIA)')
    Left = 261
    Top = 155
  end
end
