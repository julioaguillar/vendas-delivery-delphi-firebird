unit uConsProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsPadrao, DB, Grids, DBGrids, StdCtrls, Buttons, IBODataset;

type
  TfrmConsProduto = class(TfrmConsPadrao)
    qryConsProduto: TIBOQuery;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgRegistrosTitleClick(Column: TColumn);
  private
    { Private declarations }

    filtro: String;

  public
    { Public declarations }
  end;

var
  frmConsProduto: TfrmConsProduto;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmConsProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsProduto.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsProduto.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsProduto.dbgRegistrosTitleClick(Column: TColumn);
begin
  inherited;

  edtPesquisa.Clear;

  if ( Column.FieldName = 'ID_PRODUTO' ) then
  begin
    filtro := 'ID_PRODUTO';
    edtPesquisa.MaxLength   := 20;
    edtPesquisa.NumbersOnly := True;
    gpbPesquisa.Caption     := 'Pesquisa por Código (Clique no título para mudar o campo de pesquisa)';
  end
  else if ( Column.FieldName = 'DS_NOME_1' ) and ( Column.Index = 2 ) then
  begin
    filtro := 'FORNECEDOR';
    edtPesquisa.MaxLength   := 70;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por Fornecedor (Clique no título para mudar o campo de pesquisa)';
  end
  else
  begin
    filtro := 'DS_NOME';
    edtPesquisa.MaxLength   := 70;
    edtPesquisa.NumbersOnly := False;
    gpbPesquisa.Caption     := 'Pesquisa por Nome (Clique no título para mudar o campo de pesquisa)';
  end;

  if (filtro = 'FORNECEDOR') then
  begin
    Column.FieldName := 'DS_NOME';
    OrdenaGrid(dbgRegistros, Column, 'CAD_FORNECEDOR');
    Column.FieldName := 'DS_NOME_1';
  end
  else
    OrdenaGrid(dbgRegistros, Column, 'CAD_PRODUTO');

end;

procedure TfrmConsProduto.edtPesquisaChange(Sender: TObject);
begin
  inherited;

  if ( filtro = 'DS_NOME' ) then
  begin

    qryConsProduto.Close;
    qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE UPPER( CAD_PRODUTO.DS_NOME ) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
    qryConsProduto.Open;

  end
  else if ( filtro = 'FORNECEDOR' ) then
  begin

    qryConsProduto.Close;

    if ( edtPesquisa.Text = '' ) then
      qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE CAD_FORNECEDOR.DS_NOME LIKE ''%%'' '
    else
      qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE UPPER ( CAD_FORNECEDOR.DS_NOME ) LIKE UPPER ( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';

    qryConsProduto.Open;

  end
  else if ( filtro = 'ID_PRODUTO' ) then
  begin

    qryConsProduto.Close;

    if ( edtPesquisa.Text = '' ) then
      qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE CAD_PRODUTO.DS_NOME LIKE ''%%'' '
    else
      qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE CAD_PRODUTO.ID_PRODUTO LIKE '+QuotedStr(edtPesquisa.Text);

    qryConsProduto.Open;

  end;

end;

procedure TfrmConsProduto.FormCreate(Sender: TObject);
begin
  inherited;

  filtro := 'DS_NOME';

  qryConsProduto.Close;
  qryConsProduto.Open;

end;

end.
