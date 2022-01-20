unit uCadVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, Menus, DB, IBODataset, IB_Components, Grids, ValEdit,
  StdCtrls, Buttons, DBGrids, DBCtrls, Mask, AonProcessBar;

type
  TfrmCadVendedor = class(TfrmCadPadrao)
    gpbCodigo: TGroupBox;
    dbeCodigo: TDBEdit;
    gpbNome: TGroupBox;
    dbeNome: TDBEdit;
    gpbRG: TGroupBox;
    dbeRG: TDBEdit;
    gpbCPF: TGroupBox;
    dbeCPF: TDBEdit;
    gpbNascimento: TGroupBox;
    dbeNascimento: TDBEdit;
    edtIdade: TEdit;
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
    gpbTelefoneResidencial: TGroupBox;
    dbeTelefoneResidencial: TDBEdit;
    gpbCelular: TGroupBox;
    dbeCelular: TDBEdit;
    gpbEmail: TGroupBox;
    dbeEmail: TDBEdit;
    gpbProfissionais: TGroupBox;
    dbgProfissionais: TDBGrid;
    qryUF: TIBOQuery;
    qryMunicipio: TIBOQuery;
    qryConsProfissional: TIBOQuery;
    qryConsCodigo: TIBOQuery;
    dtsUF: TDataSource;
    dtsMunicipio: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure dbcUFClick(Sender: TObject);
    procedure dbcUFEnter(Sender: TObject);
    procedure qryCadPadraoAfterScroll(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsCadPadraoDataChange(Sender: TObject; Field: TField);
    procedure dbmDadosDiversosEnter(Sender: TObject);
    procedure dbmDadosDiversosExit(Sender: TObject);
    procedure dbcCidadeEnter(Sender: TObject);
    procedure dbgProfissionaisTitleClick(Column: TColumn);
    procedure qryCadPadraoAfterOpen(DataSet: TDataSet);
    procedure dbeCEPEnter(Sender: TObject);
    procedure dbeCEPExit(Sender: TObject);
  private
    { Private declarations }

    CEP: String;

  public
    { Public declarations }
  end;

var
  frmCadVendedor: TfrmCadVendedor;

const
  DiaSemana: array[1..7] of String = ('Domingo','Segunda','Terca','Quarta','Quinta','Sexta','Sabado');

implementation

uses udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmCadVendedor.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeCodigo.Enabled := false;
    dbeNome.SetFocus;

  end;

end;

procedure TfrmCadVendedor.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadVendedor.btnConfirmarClick(Sender: TObject);
var index: Integer;
begin
  inherited;

  if ( qryCadPadrao.State = dsInsert ) then
  begin

    qryConsProfissional.Close;
    qryConsProfissional.ParamByName('CD_PROFISSIONAL').AsString := qryCadPadrao.FieldByName('CD_PROFISSIONAL').AsString;
    qryConsProfissional.Open;

    if ( not ( qryConsProfissional.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Profissional já cadastrado!', MB_OK+MB_ICONINFORMATION);
      dbeCodigo.SetFocus;
      Abort;
    end;

  end;

  try

    qryCadPadrao.Post;
    trnsCadPadrao.Commit;

    qryCadPadrao.Refresh;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadVendedor.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryCadPadrao.Delete;
      trnsCadPadrao.Commit;

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmCadVendedor.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;

  qryConsCodigo.Close;
  qryConsCodigo.Open;

  if ( qryConsCodigo.FieldByName('CD_PROFISSIONAL').AsInteger > 0 ) then
    qryCadPadrao.FieldByName('CD_PROFISSIONAL').AsInteger := qryConsCodigo.FieldByName('CD_PROFISSIONAL').AsInteger + 1
  else
    qryCadPadrao.FieldByName('CD_PROFISSIONAL').AsInteger := 1;

  qryCadPadrao.FieldByName('FG_INTERVALOATENDIMENTO').AsInteger := 15;

  dbeCodigo.SetFocus;

end;

procedure TfrmCadVendedor.dbcCidadeEnter(Sender: TObject);
begin
  inherited;

  dbcCidade.DropDown;

end;

procedure TfrmCadVendedor.dbcUFClick(Sender: TObject);
begin
  inherited;

  if ( dbcUF.Text <> '' ) then
  begin
    qryMunicipio.Close;
    qryMunicipio.ParamByName('CD_UF').AsString := dbcUF.Text;
    qryMunicipio.Open;
  end;

end;

procedure TfrmCadVendedor.dbcUFEnter(Sender: TObject);
begin
  inherited;

  dbcUF.DropDown;

end;

procedure TfrmCadVendedor.dbeCEPEnter(Sender: TObject);
begin
  inherited;

  CEP := dbeCEP.Text;

end;

procedure TfrmCadVendedor.dbeCEPExit(Sender: TObject);
var endereco: TEndereco;
    Wait    : TProcessamento;
begin
  inherited;

  if ( dbeCEP.Text <> '' ) and ( dbeCEP.Text <> '  .   -   ' ) and ( CEP <> dbeCEP.Text ) and ( dbeCEP.DataSource.DataSet.State in [dsInsert, dsEdit] ) then
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

procedure TfrmCadVendedor.dbeCPFExit(Sender: TObject);
begin
  inherited;

  if ( dbeCPF.Text <> '   .   .   -  ' ) and ( dbeCPF.Text <> '' ) then
  begin

    if ( not ( fncValidaCPFCNPJ(dbeCPF.Text) ) ) then
    begin
      MsgBox('"Prezado Cliente:"'#13'Número do CPF inválido.', MB_OK + MB_ICONWARNING);
      dbeCPF.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadVendedor.dbgProfissionaisTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgProfissionais, Column, 'CAD_PROFISSIONAL');

end;

procedure TfrmCadVendedor.dbmDadosDiversosEnter(Sender: TObject);
begin
  inherited;

  KeyPreview := false;

end;

procedure TfrmCadVendedor.dbmDadosDiversosExit(Sender: TObject);
begin
  inherited;

  KeyPreview := true;

end;

procedure TfrmCadVendedor.dtsCadPadraoDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  if ( qryCadPadrao.FieldByName('DT_NASCIMENTO').AsDateTime <> 0 ) then
    edtIdade.Text := fncCalcIdade(qryCadPadrao.FieldByName('DT_NASCIMENTO').AsDateTime).Extenso
  else
    edtIdade.Text := '';

end;

procedure TfrmCadVendedor.FormCreate(Sender: TObject);
begin
  inherited;

  CEP := '';

  qryCadPadrao.Close;
  qryCadPadrao.Open;

  qryUF.Close;
  qryUF.Open;

end;

procedure TfrmCadVendedor.qryCadPadraoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with qryCadPadrao do
  begin

    ( qryCadPadrao.FieldByName('DT_NASCIMENTO') as TDateField ).OnSetText := dmPrincipal.ValidaData;

  end;

end;

procedure TfrmCadVendedor.qryCadPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and ( qryCadPadrao.FieldByName('CD_UF').AsString <> '' ) then
  begin
    qryMunicipio.Close;
    qryMunicipio.ParamByName('CD_UF').AsString := qryCadPadrao.FieldByName('CD_UF').AsString;
    qryMunicipio.Open;
  end;

end;

end.
