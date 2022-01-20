inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro - Usu'#225'rio'
  ClientHeight = 397
  ClientWidth = 628
  OnActivate = FormActivate
  ExplicitWidth = 634
  ExplicitHeight = 426
  PixelsPerInch = 96
  TextHeight = 13
  inherited gpbBotoes: TGroupBox
    Top = 357
    Width = 628
    ExplicitTop = 357
    ExplicitWidth = 628
    inherited btnConsultar: TBitBtn [0]
      Left = 219
      Enabled = False
      Visible = False
      ExplicitLeft = 219
    end
    inherited btnIncluir: TBitBtn [1]
    end
    inherited btnExcluir: TBitBtn [2]
    end
    inherited btnAlterar: TBitBtn [3]
    end
    inherited btnConfirmar: TBitBtn
      Left = 364
      ExplicitLeft = 364
    end
    inherited btnCancelar: TBitBtn
      Left = 464
      ExplicitLeft = 464
    end
  end
  object gpbUsuarios: TGroupBox [1]
    Left = 4
    Top = 108
    Width = 620
    Height = 239
    Caption = 'Usu'#225'rios'
    TabOrder = 6
    object dbgUsuarios: TDBGrid
      Left = 7
      Top = 15
      Width = 606
      Height = 216
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
      OnTitleClick = dbgUsuariosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DS_USUARIO'
          Title.Caption = 'Usu'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_NOMEUSUARIO'
          Title.Caption = 'Nome'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FG_ADMINISTRADOR'
          Title.Caption = 'Administrador'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FG_BLOQUEADO'
          Title.Caption = 'Bloqueado'
          Width = 72
          Visible = True
        end>
    end
  end
  inherited CamposObrigatorios: TValueListEditor
    Left = 354
    Top = 238
    Strings.Strings = (
      'dbeUsuario=O campo Usu'#225'rio '#233' de preenchimento obrigat'#243'rio'
      'edtSenha=O Campo Senha '#233' de preenchimento obrigat'#243'rio'
      
        'edtConfirmarSenha=O campo Confirmar Senha '#233' de preenchimento obr' +
        'igat'#243'rio')
    TabOrder = 7
    ExplicitLeft = 354
    ExplicitTop = 238
  end
  object gpbUsuario: TGroupBox [3]
    Left = 7
    Top = 8
    Width = 185
    Height = 45
    Caption = 'Usu'#225'rio'
    TabOrder = 1
    object dbeUsuario: TDBEdit
      Left = 8
      Top = 16
      Width = 169
      Height = 21
      DataField = 'DS_USUARIO'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbNome: TGroupBox [4]
    Left = 198
    Top = 8
    Width = 425
    Height = 45
    Caption = 'Nome'
    TabOrder = 2
    object dbeNome: TDBEdit
      Left = 8
      Top = 16
      Width = 409
      Height = 21
      DataField = 'DS_NOMEUSUARIO'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
    end
  end
  object gpbSenha: TGroupBox [5]
    Left = 7
    Top = 56
    Width = 185
    Height = 45
    Caption = 'Senha'
    TabOrder = 3
    object edtSenha: TEdit
      Left = 8
      Top = 16
      Width = 169
      Height = 21
      Enabled = False
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 0
      OnEnter = edtSenhaEnter
      OnExit = edtSenhaExit
    end
  end
  object gpbConfirmarSenha: TGroupBox [6]
    Left = 198
    Top = 56
    Width = 185
    Height = 45
    Caption = 'Confirmar Senha'
    TabOrder = 4
    object edtConfirmarSenha: TEdit
      Left = 8
      Top = 16
      Width = 169
      Height = 21
      Enabled = False
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 0
      OnExit = edtConfirmarSenhaExit
    end
  end
  object gpbParametros: TGroupBox [7]
    Left = 389
    Top = 56
    Width = 234
    Height = 45
    Caption = 'Par'#226'metros'
    TabOrder = 5
    object dbckAdministrador: TDBCheckBox
      Left = 16
      Top = 19
      Width = 97
      Height = 17
      Caption = '&Administrador'
      DataField = 'FG_ADMINISTRADOR'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 0
      ValueChecked = 'SIM'
      ValueUnchecked = 'NAO'
    end
    object dbckUsuarioBloqueado: TDBCheckBox
      Left = 116
      Top = 19
      Width = 117
      Height = 17
      Caption = '&Usu'#225'rio Bloqueado'
      DataField = 'FG_BLOQUEADO'
      DataSource = dtsCadPadrao
      Enabled = False
      TabOrder = 1
      ValueChecked = 'SIM'
      ValueUnchecked = 'NAO'
    end
  end
  inherited trnsCadPadrao: TIB_Transaction
    IB_Connection = dmPrincipal.IB_Connection
    Left = 488
    Top = 273
  end
  inherited qryCadPadrao: TIBOQuery
    DeleteSQL.Strings = (
      'DELETE FROM CAD_USUARIO CAD_USUARIO'
      'WHERE'
      '   DS_USUARIO = :OLD_DS_USUARIO')
    EditSQL.Strings = (
      'UPDATE CAD_USUARIO CAD_USUARIO SET'
      '   CAD_USUARIO.DS_USUARIO = :DS_USUARIO, /*PK*/'
      '   CAD_USUARIO.DS_NOMEUSUARIO = :DS_NOMEUSUARIO,'
      '   CAD_USUARIO.DS_SENHA = :DS_SENHA,'
      '   CAD_USUARIO.FG_ADMINISTRADOR = :FG_ADMINISTRADOR,'
      '   CAD_USUARIO.FG_BLOQUEADO = :FG_BLOQUEADO,'
      '   CAD_USUARIO.ID_GRUPOUSUARIO = :ID_GRUPOUSUARIO'
      'WHERE'
      '   DS_USUARIO = :OLD_DS_USUARIO')
    IB_Connection = dmPrincipal.IB_Connection
    InsertSQL.Strings = (
      'INSERT INTO CAD_USUARIO('
      '   DS_USUARIO, /*PK*/'
      '   DS_NOMEUSUARIO,'
      '   DS_SENHA,'
      '   FG_ADMINISTRADOR,'
      '   FG_BLOQUEADO,'
      '   ID_GRUPOUSUARIO)'
      'VALUES ('
      '   :DS_USUARIO,'
      '   :DS_NOMEUSUARIO,'
      '   :DS_SENHA,'
      '   :FG_ADMINISTRADOR,'
      '   :FG_BLOQUEADO,'
      '   :ID_GRUPOUSUARIO)')
    AfterScroll = qryCadPadraoAfterScroll
    SQL.Strings = (
      'SELECT CAD_USUARIO.DS_USUARIO,'
      '       CAD_USUARIO.DS_NOMEUSUARIO,'
      '       CAD_USUARIO.DS_SENHA,'
      '       CAD_USUARIO.FG_ADMINISTRADOR,'
      '       CAD_USUARIO.FG_BLOQUEADO,'
      '       CAD_USUARIO.ID_GRUPOUSUARIO'
      'FROM CAD_USUARIO'
      'ORDER BY CAD_USUARIO.DS_USUARIO')
    Left = 520
    Top = 273
  end
  inherited dtsCadPadrao: TDataSource
    Left = 520
    Top = 241
  end
  object qryConsGrupo: TIBOQuery
    IB_Connection = dmPrincipal.IB_Connection
    IB_Transaction = trnsCadPadrao
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_GRUPOUSUARIO.ID_GRUPOUSUARIO,'
      '       CAD_GRUPOUSUARIO.DS_GRUPOUSUARIO'
      'FROM CAD_GRUPOUSUARIO')
    Left = 552
    Top = 272
  end
  object dstConsGrupo: TDataSource
    DataSet = qryConsGrupo
    Left = 552
    Top = 240
  end
  object qryConsUsuario: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_USUARIO'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_USUARIO.DS_USUARIO'
      'FROM CAD_USUARIO'
      'WHERE UPPER( CAD_USUARIO.DS_USUARIO ) = UPPER( :DS_USUARIO )')
    Left = 488
    Top = 304
  end
  object qryConsAdministrador: TIBOQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'DS_USUARIO'
        ParamType = ptInput
      end>
    IB_Connection = dmPrincipal.IB_Connection
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT CAD_USUARIO.DS_USUARIO'
      'FROM CAD_USUARIO'
      'WHERE CAD_USUARIO.DS_USUARIO <> :DS_USUARIO AND'
      '      CAD_USUARIO.FG_ADMINISTRADOR = '#39'SIM'#39)
    Left = 488
    Top = 240
  end
end
