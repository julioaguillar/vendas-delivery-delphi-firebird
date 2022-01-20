unit uConsTabelaPreco;

interface

uses Windows, uPadrao, Menus, StdCtrls, DB, IBODataset, Controls, Grids,
  DBGrids, Buttons, Classes, ExtCtrls, DBCtrls, StrUtils, Graphics;

type
  TfrmConsTabelaPreco = class(TfrmPadrao)
    pnlRodape: TPanel;
    gpbConsulta: TGroupBox;
    gpbProdutos: TGroupBox;
    dbgRegistros: TDBGrid;
    qryConsulta: TIBOQuery;
    dtsConsulta: TDataSource;
    gpbFiltro: TGroupBox;
    ckbEmEstoque: TCheckBox;
    gpbDetalhamento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtConsulta: TEdit;
    btnRetornar: TBitBtn;
    dbtDescricao: TDBText;
    dbtQtdeAtual: TDBText;
    dbtUnitario: TDBText;
    procedure btbtnRetornarClick(Sender: TObject);
    procedure dbgRegistrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckbEmEstoqueClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
  private
    { Private declarations }

    execChange: Boolean;

  public
    { Public declarations }
  end;

var
  frmConsTabelaPreco: TfrmConsTabelaPreco;

implementation

uses uConstantes, uDmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmConsTabelaPreco.btbtnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmConsTabelaPreco.btnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmConsTabelaPreco.ckbEmEstoqueClick(Sender: TObject);
begin
  inherited;

  qryConsulta.Close;
  qryConsulta.ParamByName('P_IN_FG_PRODUTOEMESTOQUE').AsString := IfThen(ckbEmEstoque.Checked, 'SIM', 'NAO');
  qryConsulta.ParamByName('P_IN_FG_TODOS').AsString            := 'SIM';
  qryConsulta.ParamByName('P_IN_DS_NOME').Clear;
  qryConsulta.Open;

  execChange := false;

  edtConsulta.Clear;

  execChange := true;

end;

procedure TfrmConsTabelaPreco.dbgRegistrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ( not ( qryConsulta.IsEmpty ) ) then
  begin

    if ( not ( gdSelected in State ) ) then
    begin

      if ( qryConsulta.FieldByName('P_OU_NR_QUANTIDADEESTOQUE').AsFloat < 0.0 ) then
        dbgRegistros.Canvas.Font.Color  := clRed
      else
        dbgRegistros.Canvas.Font.Color := clWindowText;

      dbgRegistros.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    end;

  end;

end;

procedure TfrmConsTabelaPreco.edtConsultaChange(Sender: TObject);
begin
  inherited;

  if ( execChange ) then
  begin

    qryConsulta.Close;
    qryConsulta.ParamByName('P_IN_FG_PRODUTOEMESTOQUE').AsString := 'NAO';
    qryConsulta.ParamByName('P_IN_FG_TODOS').AsString            := IfThen(edtConsulta.Text = '', 'SIM', 'NAO');
    qryConsulta.ParamByName('P_IN_DS_NOME').AsString             := edtConsulta.Text;
    qryConsulta.Open;

  end;

end;

procedure TfrmConsTabelaPreco.FormCreate(Sender: TObject);
begin
  inherited;

  execChange := true;

  qryConsulta.Close;
  qryConsulta.ParamByName('P_IN_FG_PRODUTOEMESTOQUE').AsString := 'NAO';
  qryConsulta.ParamByName('P_IN_FG_TODOS').AsString            := 'SIM';
  qryConsulta.ParamByName('P_IN_DS_NOME').Clear;
  qryConsulta.Open;

end;

end.
