unit uCadEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DBCtrls, StdCtrls, Mask, Buttons, DB, IBODataset,
  IB_Components, Grids, ValEdit, DBGrids, ExtDlgs, Clipbrd, AonProcessBar;

type
  TfrmCadEmpresa = class(TfrmPadrao)
    gpbEndereco: TGroupBox;
    gpbLogradouro: TGroupBox;
    dbeLogradouro: TDBEdit;
    gpbNumero: TGroupBox;
    dbeNumero: TDBEdit;
    gpbComplemento: TGroupBox;
    dbeComplemento: TDBEdit;
    gpbBairro: TGroupBox;
    dbeBairro: TDBEdit;
    gpbCEP: TGroupBox;
    dbeCEP: TDBEdit;
    gpbUF: TGroupBox;
    dbcUF: TDBLookupComboBox;
    gpbCidade: TGroupBox;
    dbcCidade: TDBLookupComboBox;
    gpbNomeEmpresarial: TGroupBox;
    dbeNomeEmpresarial: TDBEdit;
    gpbNomeFantasia: TGroupBox;
    dbeNomeFantasia: TDBEdit;
    gpbTipoDocumento: TGroupBox;
    gpbCNPJCPF: TGroupBox;
    dbeCNPJCPF: TDBEdit;
    gpbProprietario: TGroupBox;
    dbeProprietario: TDBEdit;
    gpbTelefone: TGroupBox;
    dbeTelefone: TDBEdit;
    gpbFax: TGroupBox;
    dbeFax: TDBEdit;
    gpbHomePage: TGroupBox;
    dbeHomePage: TDBEdit;
    gpbCorreioEletronico: TGroupBox;
    dbeCorreioEletronico: TDBEdit;
    gpbBotoes: TGroupBox;
    btnAlterar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    CamposObrigatorios: TValueListEditor;
    trnsPadrao: TIB_Transaction;
    qryEmpresa: TIBOQuery;
    dtsEmpresa: TDataSource;
    qryUF: TIBOQuery;
    qryMunicipio: TIBOQuery;
    dtsMunicipio: TDataSource;
    dtsUF: TDataSource;
    dbTipoDocumento: TDBComboBox;
    procedure dbcUFClick(Sender: TObject);
    procedure dbcUFEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryEmpresaAfterScroll(DataSet: TDataSet);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryEmpresaAfterOpen(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbTipoDocumentoExit(Sender: TObject);
    procedure dbTipoDocumentoEnter(Sender: TObject);
    procedure dbeCNPJCPFExit(Sender: TObject);
    procedure dbTipoDocumentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbcCidadeEnter(Sender: TObject);
    procedure dbeCEPEnter(Sender: TObject);
    procedure dbeCEPExit(Sender: TObject);
  private
    { Private declarations }

    fgTipoDocumento, CEP: String;

    procedure HabilitarComponentes(Value: Boolean);

  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadEmpresa.HabilitarComponentes(Value: Boolean);
var index: Integer;
begin

  for index := 0 to Self.ComponentCount-1 do
  begin

    if ( Self.Components[index].Tag = 0 ) then
    begin

      if ( Self.Components[index] is TEdit ) then
        TEdit(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TMemo ) then
        TMemo(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TComboBox ) then
        TComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TCheckBox ) then
        TCheckBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBEdit ) then
        TDBEdit(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBComboBox ) then
        TDBComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBLookupComboBox ) then
        TDBLookupComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBCheckBox ) then
        TDBCheckBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBMemo ) then
        TDBMemo(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBGrid ) then
        TDBGrid(Self.Components[index]).Enabled := not ( Value );

    end;

  end;

  btnAlterar.Enabled   := not ( Value );
  btnConfirmar.Enabled := Value;
  btnCancelar.Enabled  := Value;


end;

procedure TfrmCadEmpresa.btnAlterarClick(Sender: TObject);
begin
  inherited;

  qryEmpresa.Edit;

  HabilitarComponentes(true);
  dbeNomeEmpresarial.SetFocus;

end;

procedure TfrmCadEmpresa.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryEmpresa.Cancel;
  HabilitarComponentes(false);

end;

procedure TfrmCadEmpresa.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    qryEmpresa.Post;
    trnsPadrao.Commit;

    HabilitarComponentes(false);

  except

    on e: exception do
    begin
      trnsPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+e.Message, MB_OK+MB_ICONERROR);
    end;

  end;

end;

procedure TfrmCadEmpresa.dbcCidadeEnter(Sender: TObject);
begin
  inherited;

  dbcCidade.DropDown;

end;

procedure TfrmCadEmpresa.dbcUFClick(Sender: TObject);
begin
  inherited;

  if ( dbcUF.Text <> '' ) then
  begin
    qryMunicipio.Close;
    qryMunicipio.ParamByName('CD_UF').AsString := dbcUF.Text;
    qryMunicipio.Open;
  end;

end;

procedure TfrmCadEmpresa.dbcUFEnter(Sender: TObject);
begin
  inherited;

  dbcUF.DropDown;

end;

procedure TfrmCadEmpresa.dbeCEPEnter(Sender: TObject);
begin
  inherited;

  CEP := dbeCEP.Text;

end;

procedure TfrmCadEmpresa.dbeCEPExit(Sender: TObject);
var endereco: TEndereco;
    Wait    : TProcessamento;
begin
  inherited;

  if ( dbeCEP.Text <> '' ) and ( dbeCEP.Text <> '  .   -   ' ) and ( CEP <> dbeCEP.Text ) and
     ( dbeCEP.DataSource.DataSet.State in [dsInsert, dsEdit] ) then
  begin

    Wait.CreateProcess;
    Wait.NumProcess := 2;
    Wait.SetMinMax(0, 2);
    Wait.StartProcess;

    try

      Wait.PositionBar     := Wait.PositionBar + 1;
      Wait.PositionProcess := Wait.PositionProcess + 1;

      endereco := RetornarEndereco( dbeCEP.Text );

      Wait.PositionBar     := Wait.PositionBar + 1;
      Wait.PositionProcess := Wait.PositionProcess + 1;

      if ( endereco.Cep <> '' ) then
      begin

        dbeCEP.DataSource.DataSet.FieldByName('DS_LOGRADOURO').AsString  := endereco.TipoLogradouro + ' ' + endereco.Logradouro;
        dbeCEP.DataSource.DataSet.FieldByName('DS_COMPLEMENTO').AsString := endereco.Complemento;
        dbeCEP.DataSource.DataSet.FieldByName('DS_BAIRRO').AsString      := endereco.Bairro;
        dbeCEP.DataSource.DataSet.FieldByName('CD_UF').AsString          := endereco.UF;

        dbcUFClick(dbcUF);

        if ( endereco.CodigoMunicipio > 0 ) then
          dbeCEP.DataSource.DataSet.FieldByName('CD_MUNICIPIO').AsInteger := endereco.CodigoMunicipio;

      end;

    finally
      Wait.CloseProcess;
    end;

  end;

end;

procedure TfrmCadEmpresa.dbeCNPJCPFExit(Sender: TObject);
begin
  inherited;

  if ( dbeCNPJCPF.Text <> '' ) and ( dbeCNPJCPF.Text <> '   .   .   -  ' ) and ( dbeCNPJCPF.Text <> '  .   .   /    -  ' ) then
  begin

    if ( not ( fncValidaCPFCNPJ(dbeCNPJCPF.Text) ) ) then
    begin
      MsgBox('"Prezado Cliente:"'#13'Número do '+dbTipoDocumento.Text+' inválido.', MB_OK+MB_ICONWARNING);
      dbeCNPJCPF.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadEmpresa.dbTipoDocumentoEnter(Sender: TObject);
begin
  inherited;

  fgTipoDocumento := dbTipoDocumento.Text;
  dbTipoDocumento.DroppedDown := true;

end;

procedure TfrmCadEmpresa.dbTipoDocumentoExit(Sender: TObject);
begin
  inherited;

  if ( fgTipoDocumento <> dbTipoDocumento.Text ) then
  begin

    qryEmpresa.FieldByName('NR_CNPJCPF').Clear;

    if ( dbTipoDocumento.Text = 'CPF' ) then
      qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '999.999.999-99;1;_'
    else
      qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '99.999.999/9999-99;1;_';

  end;

end;

procedure TfrmCadEmpresa.dbTipoDocumentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( qryEmpresa.State in [dsInsert,dsEdit] ) and ( Key = VK_DELETE ) then
  begin

    dbTipoDocumento.DroppedDown := false;
    dbTipoDocumento.ItemIndex   := -1;
    fgTipoDocumento             := '';

    qryEmpresa.FieldByName('FG_TIPODOCUMENTO').Clear;
    qryEmpresa.FieldByName('NR_CNPJCPF').Clear;
    qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '';

  end;

end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  inherited;

  CEP := '';

  qryEmpresa.Close;
  qryEmpresa.Open;

  qryUF.Close;
  qryUF.Open;

  fgTipoDocumento := '';

end;

procedure TfrmCadEmpresa.qryEmpresaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if ( qryEmpresa.FieldByName('FG_TIPODOCUMENTO').AsString = 'CPF' ) then
    qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '999.999.999-99;1;_'
  else if ( qryEmpresa.FieldByName('FG_TIPODOCUMENTO').AsString = 'CNPJ' ) then
    qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '99.999.999/9999-99;1;_'
  else
    qryEmpresa.FieldByName('NR_CNPJCPF').EditMask := '';

  qryEmpresa.FieldByName('NR_CEP').EditMask      := '!99.999-999;1;_';
  qryEmpresa.FieldByName('NR_TELEFONE').EditMask := '!\(99\) 9999-9999;1;_';
  qryEmpresa.FieldByName('NR_CELULAR').EditMask  := '!\(99\) 99999-9999;1;_';

end;

procedure TfrmCadEmpresa.qryEmpresaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ( not ( qryEmpresa.IsEmpty ) ) and ( qryEmpresa.FieldByName('CD_UF').AsString <> '' ) then
  begin
    qryMunicipio.Close;
    qryMunicipio.ParamByName('CD_UF').AsString := qryEmpresa.FieldByName('CD_UF').AsString;
    qryMunicipio.Open;
  end;

end;

end.
