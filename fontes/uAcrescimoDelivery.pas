unit uAcrescimoDelivery;

interface

uses
  Windows, uPadrao, Controls, StdCtrls, Buttons, ExtCtrls, pngimage, Classes,
  Mask, DBCtrls, DB, Forms;

type
  TfrmAcrescimoDelivery = class(TfrmPadrao)
    dtsProduto: TDataSource;
    gpbValorUnitario: TGroupBox;
    dbtValorUnitario: TDBText;
    gpbAcrescimo: TGroupBox;
    gpbValorFinal: TGroupBox;
    dbeAcrescimo: TDBEdit;
    dbtValorFinal: TDBText;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbeAcrescimoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcrescimoDelivery: TfrmAcrescimoDelivery;

implementation

uses uLctVendaDelivery;

{$R *.dfm}

procedure TfrmAcrescimoDelivery.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmAcrescimoDelivery.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmAcrescimoDelivery.dbeAcrescimoExit(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.FieldByName('VR_TOTALITEM').AsFloat := (
                                                              dtsProduto.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                              dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat
                                                            ) -
                                                            dtsProduto.DataSet.FieldByName('VR_DESCONTO').AsFloat +
                                                            dtsProduto.DataSet.FieldByName('VR_ACRESCIMO').AsFloat;

end;

procedure TfrmAcrescimoDelivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsProduto.DataSet.State in [dsInsert,dsEdit] ) then
    dtsProduto.DataSet.Cancel;

end;

procedure TfrmAcrescimoDelivery.FormCreate(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet := frmLctVendaDelivery.cdsProdutos;

end;

end.
