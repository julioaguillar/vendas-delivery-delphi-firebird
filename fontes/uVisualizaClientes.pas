unit uVisualizaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, DB, IBODataset, StdCtrls, Buttons, DBCtrls,
  frxClass, frxDBSet;

type
  TfrmVisualizaClientes = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnRetornar: TBitBtn;
    btnImprimir: TBitBtn;
    dtsClientes: TDataSource;
    gpb: TGroupBox;
    dbgRegistros: TDBGrid;
    frxReport: TfrxReport;
    frxDBClientes: TfrxDBDataset;
    qryClientes: TIBOQuery;
    procedure dblPacotesClick(Sender: TObject);
    procedure dblPacotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbAtivosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbgRegistrosTitleClick(Column: TColumn);
  private
    { Private declarations }

    procedure BuscaClientes;

  public
    { Public declarations }
  end;

var
  frmVisualizaClientes: TfrmVisualizaClientes;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmVisualizaClientes.btnImprimirClick(Sender: TObject);
begin
  inherited;

  qryClientes.DisableControls;

  try

    if (frxReport.PrepareReport) then
      frxReport.ShowPreparedReport;

  finally
    qryClientes.EnableControls;
  end;

end;

procedure TfrmVisualizaClientes.BuscaClientes;
begin

  qryClientes.Close;
  qryClientes.Open;

end;

procedure TfrmVisualizaClientes.ckbAtivosClick(Sender: TObject);
begin
  inherited;

  BuscaClientes;

end;

procedure TfrmVisualizaClientes.dbgRegistrosTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgRegistros, Column, 'CAD_CLIENTE');

end;

procedure TfrmVisualizaClientes.dblPacotesClick(Sender: TObject);
begin
  inherited;

  BuscaClientes;

end;

procedure TfrmVisualizaClientes.dblPacotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) then
    BuscaClientes;

end;

procedure TfrmVisualizaClientes.FormShow(Sender: TObject);
begin
  inherited;

  BuscaClientes();

end;

end.
