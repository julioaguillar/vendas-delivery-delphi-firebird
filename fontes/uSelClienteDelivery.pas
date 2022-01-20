unit uSelClienteDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, DB;

type
  TfrmSelClienteDelivery = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    dtsConsCliente: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelClienteDelivery: TfrmSelClienteDelivery;

implementation

uses uLctVendaDelivery;

{$R *.dfm}

procedure TfrmSelClienteDelivery.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmSelClienteDelivery.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmSelClienteDelivery.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmSelClienteDelivery.FormCreate(Sender: TObject);
begin
  inherited;

  dtsConsCliente.DataSet := frmLctVendaDelivery.qryConsCliente;

end;

end.
