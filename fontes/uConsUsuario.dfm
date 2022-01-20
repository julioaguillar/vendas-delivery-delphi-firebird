inherited frmConsUsuario: TfrmConsUsuario
  Caption = 'Cosnulta - Usu'#225'rio'
  ClientHeight = 433
  ClientWidth = 554
  OnCreate = FormCreate
  ExplicitWidth = 560
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 391
    Width = 554
    ExplicitTop = 391
    ExplicitWidth = 554
    inherited btnConfirmar: TBitBtn
      Left = 177
      OnClick = btnConfirmarClick
      ExplicitLeft = 177
    end
    inherited btnRetornar: TBitBtn
      Left = 277
      OnClick = btnRetornarClick
      ExplicitLeft = 277
    end
  end
  inherited gpbPesquisa: TGroupBox
    Width = 544
    ExplicitWidth = 544
    inherited edtPesquisa: TEdit
      Width = 526
      ExplicitWidth = 526
    end
  end
  inherited gpbRegistros: TGroupBox
    Width = 544
    Height = 329
    ExplicitWidth = 544
    ExplicitHeight = 329
    inherited dbgRegistros: TDBGrid
      Width = 529
      Height = 306
      OnDblClick = dbgRegistrosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOMEUSUARIO'
          Title.Caption = 'Nome'
          Width = 315
          Visible = True
        end>
    end
  end
  inherited dtsRegistros: TDataSource
    DataSet = qryConsulta
  end
  object qryConsulta: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_USUARIO.DS_USUARIO,'
      '       CAD_USUARIO.DS_NOMEUSUARIO'
      'FROM CAD_USUARIO'
      'ORDER BY CAD_USUARIO.DS_USUARIO')
    Left = 56
    Top = 256
  end
end
