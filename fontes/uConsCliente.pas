unit uConsCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsPadrao, DB, Grids, DBGrids, StdCtrls, Buttons, IBODataset,
  DBCtrls, Mask;

type
  TfrmConsCliente = class(TfrmConsPadrao)
    qryConsCliente: TIBOQuery;
    gpbRG: TGroupBox;
    dbeRG: TDBEdit;
    gpbCPF: TGroupBox;
    dbeCPF: TDBEdit;
    gpbEstadoCivil: TGroupBox;
    gpbProfissao: TGroupBox;
    dbeProfissao: TDBEdit;
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
    gpbCidade: TGroupBox;
    dbeEstadoCivil: TDBEdit;
    dbeUf: TDBEdit;
    dbeCidade: TDBEdit;
    gpbFoto: TGroupBox;
    dbiFoto: TDBImage;
    procedure FormCreate(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgRegistrosTitleClick(Column: TColumn);
    procedure dbgRegistrosEnter(Sender: TObject);
    procedure dbgRegistrosExit(Sender: TObject);
  private
    { Private declarations }

    filtro: String;

  public
    { Public declarations }
  end;

var
  frmConsCliente: TfrmConsCliente;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmConsCliente.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsCliente.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsCliente.dbgRegistrosEnter(Sender: TObject);
begin
  inherited;

  dbgRegistros.Color := $00EAFFFF;

end;

procedure TfrmConsCliente.dbgRegistrosExit(Sender: TObject);
begin
  inherited;

  dbgRegistros.Color := clWindow;

end;

procedure TfrmConsCliente.dbgRegistrosTitleClick(Column: TColumn);
begin
  inherited;

  edtPesquisa.Clear;

  if ( Column.FieldName = 'CD_CLIENTE' ) then
  begin
    filtro := 'CD_CLIENTE';
    edtPesquisa.MaxLength   := 9;
    edtPesquisa.NumbersOnly := True;
    gpbPesquisa.Caption     := 'Pesquisa por Código (Clique no título para mudar o campo de pesquisa)';
  end
  else if ( Column.FieldName = 'DT_NASCIMENTO' ) then
  begin
    filtro := 'DT_NASCIMENTO';
    edtPesquisa.MaxLength   := 10;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por Dt.Nascimento (Clique no título para mudar o campo de pesquisa)';
  end
  else if ( Column.FieldName = 'NR_RG' ) then
  begin
    filtro := 'NR_RG';
    edtPesquisa.MaxLength   := 15;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por RG (Clique no título para mudar o campo de pesquisa)';
  end
  else if ( Column.FieldName = 'NR_CPF' ) then
  begin
    filtro := 'NR_CPF';
    edtPesquisa.MaxLength   := 14;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por CPF (Clique no título para mudar o campo de pesquisa)';
  end
  else
  begin
    filtro := 'DS_NOME';
    edtPesquisa.MaxLength   := 70;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por Nome (Clique no título para mudar o campo de pesquisa)';
  end;

  OrdenaGrid(dbgRegistros, Column, 'CAD_CLIENTE');

end;

procedure TfrmConsCliente.edtPesquisaChange(Sender: TObject);
begin
  inherited;

  if ( filtro = 'DS_NOME' ) then
  begin

    qryConsCliente.Close;
    qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE UPPER( CAD_CLIENTE.DS_NOME ) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
    qryConsCliente.Open;

  end
  else if ( filtro = 'NR_RG' ) or ( filtro = 'NR_CPF' ) then
  begin

    qryConsCliente.Close;

    if ( edtPesquisa.Text = '' ) then
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAD_CLIENTE.DS_NOME LIKE ''%%'' '
    else
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAD_CLIENTE.'+filtro+' LIKE '+QuotedStr(edtPesquisa.Text+'%')+'';

    qryConsCliente.Open;

  end
  else if ( filtro = 'DT_NASCIMENTO' ) then
  begin

    qryConsCliente.Close;

    if ( edtPesquisa.Text = '' ) then
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAD_CLIENTE.DS_NOME LIKE ''%%'' '
    else
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAST(SUBSTRING(CAST(CAD_CLIENTE.DT_NASCIMENTO AS VARCHAR(10)) FROM 9 FOR 2)||''/''||SUBSTRING(CAST(CAD_CLIENTE.DT_NASCIMENTO AS VARCHAR(10)) '+
                                                                  'FROM 6 FOR 2)||''/''||SUBSTRING(CAST(CAD_CLIENTE.DT_NASCIMENTO AS VARCHAR(10)) FROM 1 FOR 4) AS VARCHAR(10)) LIKE '+QuotedStr(edtPesquisa.Text+'%');
    qryConsCliente.Open;

  end
  else if ( filtro = 'CD_CLIENTE' ) then
  begin

    qryConsCliente.Close;

    if ( edtPesquisa.Text = '' ) then
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAD_CLIENTE.DS_NOME LIKE ''%%'' '
    else
      qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-3] := 'WHERE CAD_CLIENTE.CD_CLIENTE LIKE '+QuotedStr(edtPesquisa.Text);

    qryConsCliente.Open;

  end;

end;

procedure TfrmConsCliente.FormCreate(Sender: TObject);
begin
  inherited;

  filtro := 'DS_NOME';

  qryConsCliente.Close;
  qryConsCliente.Open;

end;

end.
