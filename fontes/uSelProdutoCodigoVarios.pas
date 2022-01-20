unit uSelProdutoCodigoVarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, Grids, DBGrids, StdCtrls, Buttons, DBCtrls;

type
  TfrmSelProdutoCodigoVarios = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    dtsConsProduto: TDataSource;
    gpbFoto: TGroupBox;
    dbiFotoProduto: TDBImage;
    procedure FormCreate(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelProdutoCodigoVarios: TfrmSelProdutoCodigoVarios;

implementation

uses udmPrincipal, uSelProdutoCodigo;

{$R *.dfm}

procedure TfrmSelProdutoCodigoVarios.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmSelProdutoCodigoVarios.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmSelProdutoCodigoVarios.FormCreate(Sender: TObject);
begin
  inherited;

  if ( dtsConsProduto.DataSet = nil ) then
    dtsConsProduto.DataSet := frmSelProdutoCodigo.qryConsProduto;

end;

end.
