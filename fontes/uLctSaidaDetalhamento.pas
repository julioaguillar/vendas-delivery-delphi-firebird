unit uLctSaidaDetalhamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DB, IBODataset;

type
  TfrmLctSaidaDetalhamento = class(TfrmPadrao)
    dbgPedidos: TDBGrid;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    gpbBotoes: TGroupBox;
    btnRetornar: TBitBtn;
    qryLancamentoSaida: TIBOQuery;
    dtsLancamentoSaida: TDataSource;
    qryLancamentoSaidaItem: TIBOQuery;
    dtsLancamentoSaidaItem: TDataSource;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    IDVenda: Integer;

  end;

var
  frmLctSaidaDetalhamento: TfrmLctSaidaDetalhamento;

implementation

{$R *.dfm}

procedure TfrmLctSaidaDetalhamento.btnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmLctSaidaDetalhamento.FormShow(Sender: TObject);
begin
  inherited;

  qryLancamentoSaida.Close;
  qryLancamentoSaida.ParamByName('ID_VENDA').AsInteger := IDVenda;
  qryLancamentoSaida.Open;

  qryLancamentoSaidaItem.Close;
  qryLancamentoSaidaItem.ParamByName('ID_VENDA').AsInteger := IDVenda;
  qryLancamentoSaidaItem.Open;

  ShowScrollBar(dbgPedidos.Handle, SB_VERT, False);
  ShowScrollBar(dbgPedidos.Handle, SB_HORZ, False);

end;

end.
