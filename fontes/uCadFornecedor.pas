unit uCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, Menus, DB, IBODataset, IB_Components, Grids, ValEdit,
  StdCtrls, Buttons, DBGrids, Mask, DBCtrls, AonProcessbar;

type
  TfrmCadFornecedor = class(TfrmCadPadrao)
    gpbNomeEmpresarial: TGroupBox;
    gpbTelefone: TGroupBox;
    gpbFax: TGroupBox;
    gpbEmail: TGroupBox;
    gpbContato: TGroupBox;
    gpbRamal: TGroupBox;
    gpbObservacao: TGroupBox;
    gpbConvenios: TGroupBox;
    dbgConvenios: TDBGrid;
    dbeNomeEmpresarial: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeFax: TDBEdit;
    dbeEmail: TDBEdit;
    dbeContato: TDBEdit;
    dbeRamal: TDBEdit;
    dbeObservacao: TDBEdit;
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
    qryConsUF: TIBOQuery;
    qryConsMunicipio: TIBOQuery;
    dtsConsUF: TDataSource;
    dtsConsMunicipio: TDataSource;
    gpbCNPJ: TGroupBox;
    dbeCNPJ: TDBEdit;
    qryValidaExclusao: TIBOQuery;
    gpbCPF: TGroupBox;
    dbeCPF: TDBEdit;
    btnExportar: TBitBtn;
    qryConsAgenda: TIBOQuery;
    qryCadAgenda: TIBOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbcUFClick(Sender: TObject);
    procedure qryCadPadraoAfterScroll(DataSet: TDataSet);
    procedure dbcUFEnter(Sender: TObject);
    procedure dbcCidadeEnter(Sender: TObject);
    procedure dbeCNPJExit(Sender: TObject);
    procedure dbgConveniosTitleClick(Column: TColumn);
    procedure dbeCPFExit(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure dtsCadPadraoStateChange(Sender: TObject);
    procedure dbeCEPEnter(Sender: TObject);
    procedure dbeCEPExit(Sender: TObject);
  private
    { Private declarations }

    CEP: String;

  public
    { Public declarations }
  end;

var
  frmCadFornecedor: TfrmCadFornecedor;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadFornecedor.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeNomeEmpresarial.SetFocus;

  end;

end;

procedure TfrmCadFornecedor.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadFornecedor.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    if ( qryCadPadrao.State = dsInsert ) then
      qryCadPadrao.FieldByName('CD_FORNECEDOR').AsInteger := 0;

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

procedure TfrmCadFornecedor.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    (*
    qryValidaExclusao.Close;
    qryValidaExclusao.ParamByName('CD_FORNECEDOR').AsInteger := qryCadPadrao.FieldByName('CD_FORNECEDOR').AsInteger;
    qryValidaExclusao.Open;

    if ( not ( qryValidaExclusao.IsEmpty ) ) and ( qryValidaExclusao.FieldByName('NR_PACIENTE').AsInteger > 0 ) then
    begin
      MsgBox('"Prezado Cliente"'+#13+'Não é possível excluir o registro. Existe(m) Paciente(s) vinculado(s) a Operadora.'+#13+
             'Para excluir é necessário desvincular o(s) Paciente(s).', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;
    *)

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

procedure TfrmCadFornecedor.btnExportarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    if ( ( Trim(qryCadPadrao.FieldByName('NR_TELEFONE').AsString) = '' ) or ( Trim(qryCadPadrao.FieldByName('NR_TELEFONE').AsString) = '(  )     -' ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Para fazer a exportação é necessário informar o Telefone', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

    if ( MsgBox('"Prezado Cliente:"'#13'Confirma a exportação do registro?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    begin

      qryConsAgenda.Close;
      qryConsAgenda.ParamByName('DS_CONTATO').AsString           := qryCadPadrao.FieldByName('DS_NOME').AsString;
      qryConsAgenda.ParamByName('NR_TELEFONECOMERCIAL').AsString := qryCadPadrao.FieldByName('NR_TELEFONE').AsString;
      qryConsAgenda.Open;

      if ( not ( qryConsAgenda.IsEmpty ) ) and
         ( MsgBox('"Prezado Cliente:"'#13'Existe um contato na Agenda com as informações deste Fornecedor.'+#13#13+'Deseja continuar?', MB_YESNO+MB_ICONQUESTION) = IDNO ) then
        Exit;

      try

        qryCadAgenda.Close;
        qryCadAgenda.ParamByName('ID_AGENDATELEFONE').AsInteger   := 0;
        qryCadAgenda.ParamByName('DS_CONTATO').AsString           := qryCadPadrao.FieldByName('DS_NOME').AsString;
        qryCadAgenda.ParamByName('NR_TELEFONECOMERCIAL').AsString := qryCadPadrao.FieldByName('NR_TELEFONE').AsString;
        qryCadAgenda.ParamByName('DS_EMAIL').AsString             := qryCadPadrao.FieldByName('DS_EMAIL').AsString;
        qryCadAgenda.ExecSQL;

        trnsCadPadrao.Commit;

        MsgBox('"Prezado Cliente"'#13'Registro exportado com sucesso!', MB_OK+MB_ICONINFORMATION);

      except
        on e: Exception do
        begin
          trnsCadPadrao.Rollback;
          MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exportação do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
        end;
      end;

    end;

  end;

end;

procedure TfrmCadFornecedor.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  dbeNomeEmpresarial.SetFocus;

end;

procedure TfrmCadFornecedor.dbcCidadeEnter(Sender: TObject);
begin
  inherited;

  dbcCidade.DropDown;

end;

procedure TfrmCadFornecedor.dbcUFClick(Sender: TObject);
begin
  inherited;

  if ( dbcUF.Text <> '' ) then
  begin
    qryConsMunicipio.Close;
    qryConsMunicipio.ParamByName('CD_UF').AsString := dbcUF.Text;
    qryConsMunicipio.Open;
  end;

end;

procedure TfrmCadFornecedor.dbcUFEnter(Sender: TObject);
begin
  inherited;

  dbcUF.DropDown;

end;

procedure TfrmCadFornecedor.dbeCEPEnter(Sender: TObject);
begin
  inherited;

  CEP := dbeCEP.Text;

end;

procedure TfrmCadFornecedor.dbeCEPExit(Sender: TObject);
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

procedure TfrmCadFornecedor.dbeCNPJExit(Sender: TObject);
begin
  inherited;

  if ( dbeCNPJ.Text <> '  .   .   /    -  ' ) and ( dbeCNPJ.Text <> '' ) then
  begin

    if ( not ( fncValidaCPFCNPJ(dbeCNPJ.Text) ) ) then
    begin

      MsgBox('"Prezado Cliente:"'#13'Número do CNPJ inválido.', MB_OK + MB_ICONWARNING);
      dbeCNPJ.SetFocus;
      Abort;

    end;

  end;

end;

procedure TfrmCadFornecedor.dbeCPFExit(Sender: TObject);
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

procedure TfrmCadFornecedor.dbgConveniosTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgConvenios, Column, 'CAD_FORNECEDOR');

end;

procedure TfrmCadFornecedor.dtsCadPadraoStateChange(Sender: TObject);
begin
  inherited;

  btnExportar.Enabled := ( not ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] ) );

end;

procedure TfrmCadFornecedor.FormCreate(Sender: TObject);
begin
  inherited;

  CEP := '';

  qryCadPadrao.Close;
  qryCadPadrao.Open;

  qryConsUF.Close;
  qryConsUF.Open;

end;

procedure TfrmCadFornecedor.qryCadPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ( not ( qryCadPadrao.State in [dsInsert,dsEdit] ) ) and ( qryCadPadrao.FieldByName('CD_UF').AsString <> '' ) then
  begin
    qryConsMunicipio.Close;
    qryConsMunicipio.ParamByName('CD_UF').AsString := qryCadPadrao.FieldByName('CD_UF').AsString;
    qryConsMunicipio.Open;
  end;

end;

end.
