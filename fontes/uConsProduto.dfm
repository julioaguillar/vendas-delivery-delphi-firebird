inherited frmConsProduto: TfrmConsProduto
  Caption = 'Consulta - Produto/Mercadoria'
  ClientHeight = 489
  ClientWidth = 737
  OnCreate = FormCreate
  ExplicitWidth = 743
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 447
    Width = 737
    TabOrder = 2
    ExplicitTop = 447
    ExplicitWidth = 737
    inherited btnConfirmar: TBitBtn
      Left = 267
      Width = 100
      OnClick = btnConfirmarClick
      ExplicitLeft = 267
      ExplicitWidth = 100
    end
    inherited btnRetornar: TBitBtn
      Left = 369
      Width = 100
      OnClick = btnRetornarClick
      ExplicitLeft = 369
      ExplicitWidth = 100
    end
  end
  inherited gpbPesquisa: TGroupBox
    Width = 727
    TabOrder = 0
    ExplicitWidth = 727
    inherited edtPesquisa: TEdit
      Width = 709
      OnChange = edtPesquisaChange
      ExplicitWidth = 709
    end
  end
  inherited gpbRegistros: TGroupBox
    Width = 727
    Height = 377
    TabOrder = 1
    ExplicitWidth = 727
    ExplicitHeight = 377
    inherited dbgRegistros: TDBGrid
      Width = 712
      Height = 354
      OnDblClick = dbgRegistrosDblClick
      OnTitleClick = dbgRegistrosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 295
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOME_1'
          Title.Caption = 'Fornecedor'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited dtsRegistros: TDataSource
    DataSet = qryConsProduto
    Left = 48
    Top = 208
  end
  object qryConsProduto: TIBOQuery
    Params = <>
    DatabaseName = '127.0.0.1/3050:C:\Aon\Nutri\fdb\AONNUTRI.FDB'
    IB_Connection = dmPrincipal.IB_Connection
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_PRODUTO.ID_PRODUTO,'
      '       CAD_PRODUTO.CD_PRODUTO,'
      '       CAD_PRODUTO.DS_NOME,'
      '       CAD_FORNECEDOR.DS_NOME'
      'FROM CAD_PRODUTO'
      
        'LEFT JOIN CAD_FORNECEDOR ON(CAD_FORNECEDOR.CD_FORNECEDOR = CAD_P' +
        'RODUTO.CD_FORNECEDOR)'
      'WHERE UPPER( CAD_PRODUTO.DS_NOME ) LIKE  UPPER( '#39'%%'#39' )'
      'ORDER BY CAD_PRODUTO.DS_NOME')
    FieldOptions = []
    Left = 79
    Top = 208
  end
end
