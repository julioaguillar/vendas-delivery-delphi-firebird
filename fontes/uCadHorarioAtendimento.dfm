inherited frmCadHorarioAtendimento: TfrmCadHorarioAtendimento
  Caption = 'Cadastro - Hor'#225'rio de Atendimento'
  ClientHeight = 305
  ClientWidth = 449
  OnShow = FormShow
  ExplicitWidth = 455
  ExplicitHeight = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 265
    Width = 449
    TabOrder = 3
    ExplicitTop = 253
    ExplicitWidth = 449
    inherited btnIncluir: TBitBtn
      Tag = 1
      Left = 3
      Top = 3
      Enabled = False
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 3
    end
    inherited btnExcluir: TBitBtn
      Tag = 1
      Left = 12
      Top = 3
      Enabled = False
      Visible = False
      ExplicitLeft = 12
      ExplicitTop = 3
    end
    inherited btnAlterar: TBitBtn
      Tag = 1
      Left = 25
      Top = 3
      Enabled = False
      Visible = False
      ExplicitLeft = 25
      ExplicitTop = 3
    end
    inherited btnConsultar: TBitBtn
      Tag = 1
      Left = 36
      Top = 3
      Enabled = False
      Visible = False
      ExplicitLeft = 36
      ExplicitTop = 3
    end
    inherited btnConfirmar: TBitBtn
      Tag = 1
      Left = 125
      Enabled = True
      ExplicitLeft = 125
    end
    inherited btnCancelar: TBitBtn
      Tag = 1
      Left = 225
      Enabled = True
      ExplicitLeft = 225
    end
  end
  object gpbHorarioAtendimento: TGroupBox [1]
    Left = 4
    Top = 3
    Width = 441
    Height = 205
    Caption = 'Hor'#225'rio Atendimento'
    TabOrder = 0
    object btnRepetirHorario: TSpeedButton
      Left = 296
      Top = 168
      Width = 139
      Height = 29
      Caption = 'Repetir &hor'#225'rio'
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
      OnClick = btnRepetirHorarioClick
    end
    object dbgHorarioAtendimento: TDBGrid
      Tag = 1
      Left = 7
      Top = 16
      Width = 428
      Height = 148
      DataSource = dtsCadPadrao
      DrawingStyle = gdsGradient
      Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgHorarioAtendimentoCellClick
      OnColEnter = dbgHorarioAtendimentoColEnter
      OnEnter = dbgHorarioAtendimentoEnter
      OnKeyDown = dbgHorarioAtendimentoKeyDown
      OnKeyPress = dbgHorarioAtendimentoKeyPress
      Columns = <
        item
          Color = 15658734
          Expanded = False
          FieldName = 'DS_DIASEMANA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Caption = 'Dia da Semana'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HR_ENTRADA'
          Title.Caption = 'Entrada'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HR_SAIDAINTERVALO'
          Title.Caption = 'Saida'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HR_ENTRADAINTERVALO'
          Title.Caption = 'Entrada'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HR_SAIDA'
          Title.Caption = 'Saida'
          Width = 80
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 168
    Top = 84
    TabOrder = 2
    ExplicitLeft = 168
    ExplicitTop = 84
  end
  object gpbIntervalo: TGroupBox [3]
    Left = 4
    Top = 214
    Width = 178
    Height = 45
    Caption = 'Intervalo entre os Atendimento'
    TabOrder = 1
    object cbbIntervalo: TComboBox
      Tag = 1
      Left = 8
      Top = 16
      Width = 162
      Height = 21
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 0
      Text = '15 minutos'
      Items.Strings = (
        '5 minutos'
        '10 minutos'
        '15 minutos'
        '30 minutos'
        '45 minutos'
        '1 hora')
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 304
    Top = 118
  end
  inherited qryCadPadrao: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_PROFISSIONAL'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'DELETE FROM CAD_PROFISSIONALHORARIO CAD_PROFISSIONALHORARIO'
      'WHERE'
      '   CD_PROFISSIONAL = :OLD_CD_PROFISSIONAL AND'
      '   ID_DIASEMANA = :OLD_ID_DIASEMANA')
    EditSQL.Strings = (
      'UPDATE CAD_PROFISSIONALHORARIO CAD_PROFISSIONALHORARIO SET'
      
        '   CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL = :CD_PROFISSIONAL, /' +
        '*PK*/'
      '   CAD_PROFISSIONALHORARIO.ID_DIASEMANA = :ID_DIASEMANA, /*PK*/'
      '   CAD_PROFISSIONALHORARIO.DS_DIASEMANA = :DS_DIASEMANA,'
      '   CAD_PROFISSIONALHORARIO.HR_ENTRADA = :HR_ENTRADA,'
      
        '   CAD_PROFISSIONALHORARIO.HR_SAIDAINTERVALO = :HR_SAIDAINTERVAL' +
        'O,'
      
        '   CAD_PROFISSIONALHORARIO.HR_ENTRADAINTERVALO = :HR_ENTRADAINTE' +
        'RVALO,'
      '   CAD_PROFISSIONALHORARIO.HR_SAIDA = :HR_SAIDA'
      'WHERE'
      '   CD_PROFISSIONAL = :OLD_CD_PROFISSIONAL AND'
      '   ID_DIASEMANA = :OLD_ID_DIASEMANA')
    FieldsDisplayFormat.Strings = (
      'HR_SAIDA=hh:mm'
      'HR_ENTRADAINTERVALO=hh:mm'
      'HR_SAIDAINTERVALO=hh:mm'
      'HR_ENTRADA=hh:mm')
    FieldsEditMask.Strings = (
      'HR_ENTRADA=!99:99;1;_'
      'HR_SAIDAINTERVALO=!99:99;1;_'
      'HR_ENTRADAINTERVALO=!99:99;1;_'
      'HR_SAIDA=!99:99;1;_')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_PROFISSIONALHORARIO('
      '   CD_PROFISSIONAL, /*PK*/'
      '   ID_DIASEMANA, /*PK*/'
      '   DS_DIASEMANA,'
      '   HR_ENTRADA,'
      '   HR_SAIDAINTERVALO,'
      '   HR_ENTRADAINTERVALO,'
      '   HR_SAIDA)'
      'VALUES ('
      '   :CD_PROFISSIONAL,'
      '   :ID_DIASEMANA,'
      '   :DS_DIASEMANA,'
      '   :HR_ENTRADA,'
      '   :HR_SAIDAINTERVALO,'
      '   :HR_ENTRADAINTERVALO,'
      '   :HR_SAIDA)')
    AfterInsert = qryCadPadraoAfterInsert
    AfterOpen = qryCadPadraoAfterOpen
    SQL.Strings = (
      'SELECT CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL,'
      '       CAD_PROFISSIONALHORARIO.ID_DIASEMANA,'
      '       CAD_PROFISSIONALHORARIO.DS_DIASEMANA,'
      '       CAD_PROFISSIONALHORARIO.HR_ENTRADA,'
      '       CAD_PROFISSIONALHORARIO.HR_SAIDAINTERVALO,'
      '       CAD_PROFISSIONALHORARIO.HR_ENTRADAINTERVALO,'
      '       CAD_PROFISSIONALHORARIO.HR_SAIDA'
      'FROM CAD_PROFISSIONALHORARIO'
      'WHERE CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL = :CD_PROFISSIONAL')
    Left = 336
    Top = 118
  end
  inherited dtsCadPadrao: TDataSource
    Left = 336
    Top = 86
  end
  object qryAtualizaIntervalo: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'FG_INTERVALOATENDIMENTO'
        ParamType = ptInput
      end
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
      'UPDATE CAD_PROFISSIONAL'
      'SET FG_INTERVALOATENDIMENTO = :FG_INTERVALOATENDIMENTO'
      'WHERE CD_PROFISSIONAL = :CD_PROFISSIONAL')
    Left = 366
    Top = 118
  end
end
