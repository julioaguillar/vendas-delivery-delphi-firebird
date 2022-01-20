inherited frmCadFeriado: TfrmCadFeriado
  Caption = 'Cadastro - Feriado'
  ClientHeight = 326
  ClientWidth = 545
  ExplicitWidth = 551
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 286
    Width = 545
    ExplicitTop = 286
    ExplicitWidth = 545
    inherited btnIncluir: TBitBtn
      Left = 22
      ExplicitLeft = 22
    end
    inherited btnExcluir: TBitBtn
      Left = 122
      ExplicitLeft = 122
    end
    inherited btnAlterar: TBitBtn
      Left = 222
      ExplicitLeft = 222
    end
    inherited btnConsultar: TBitBtn
      Tag = 1
      Left = 7
      Width = 14
      Visible = False
      ExplicitLeft = 7
      ExplicitWidth = 14
    end
    inherited btnConfirmar: TBitBtn
      Left = 322
      ExplicitLeft = 322
    end
    inherited btnCancelar: TBitBtn
      Left = 422
      ExplicitLeft = 422
    end
  end
  object gpbDescricao: TGroupBox [1]
    Left = 8
    Top = 8
    Width = 291
    Height = 44
    Caption = 'Descri'#231#227'o'
    TabOrder = 1
    object dbeDescricao: TDBEdit
      Left = 8
      Top = 16
      Width = 275
      Height = 21
      DataField = 'DS_FERIADO'
      DataSource = dtsCadPadrao
      TabOrder = 0
    end
  end
  object gpbDia: TGroupBox [2]
    Left = 305
    Top = 8
    Width = 66
    Height = 44
    Caption = 'Dia'
    TabOrder = 2
    object cbbDia: TComboBox
      Left = 8
      Top = 16
      Width = 50
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30'
        '31')
    end
  end
  object gpbMes: TGroupBox [3]
    Left = 377
    Top = 8
    Width = 161
    Height = 44
    Caption = 'M'#234's'
    TabOrder = 3
    object cbbMes: TComboBox
      Left = 8
      Top = 16
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
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
  end
  object gpbFeriados: TGroupBox [4]
    Left = 8
    Top = 57
    Width = 529
    Height = 223
    Caption = 'Feriados'
    TabOrder = 4
    object dbgFeriados: TDBGrid
      Left = 8
      Top = 17
      Width = 512
      Height = 199
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbgFeriadosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_FERIADO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_DIAFERIADO'
          Title.Caption = 'Dia'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_MESFERIADO'
          Title.Caption = 'M'#234's'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 330
    Top = 200
    Strings.Strings = (
      'dbeDescricao=Campo Descri'#231#227'o deve ser informado'
      'cbbDia=Campo Dia deve ser informado'
      'cbbMes=Campo M'#234's deve ser informado')
    TabOrder = 5
    ExplicitLeft = 330
    ExplicitTop = 200
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 466
    Top = 234
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_FERIADO CAD_FERIADO'
      'WHERE'
      '   ID_FERIADO = :OLD_ID_FERIADO')
    EditSQL.Strings = (
      'UPDATE CAD_FERIADO CAD_FERIADO SET'
      '   CAD_FERIADO.ID_FERIADO = :ID_FERIADO, /*PK*/'
      '   CAD_FERIADO.DS_FERIADO = :DS_FERIADO,'
      '   CAD_FERIADO.DT_DIAFERIADO = :DT_DIAFERIADO,'
      '   CAD_FERIADO.DT_MESFERIADO = :DT_MESFERIADO'
      'WHERE'
      '   ID_FERIADO = :OLD_ID_FERIADO')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_FERIADO('
      '   ID_FERIADO, /*PK*/'
      '   DS_FERIADO,'
      '   DT_DIAFERIADO,'
      '   DT_MESFERIADO)'
      'VALUES ('
      '   :ID_FERIADO,'
      '   :DS_FERIADO,'
      '   :DT_DIAFERIADO,'
      '   :DT_MESFERIADO)')
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'SELECT CAD_FERIADO.ID_FERIADO,'
      '       CAD_FERIADO.DS_FERIADO,'
      '       CAD_FERIADO.DT_DIAFERIADO,'
      '       CAD_FERIADO.DT_MESFERIADO'
      'FROM CAD_FERIADO'
      'ORDER BY CAD_FERIADO.DS_FERIADO')
    Left = 498
    Top = 234
  end
  inherited dtsCadPadrao: TDataSource
    Left = 498
    Top = 202
  end
end
