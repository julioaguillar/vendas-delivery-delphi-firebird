unit uLctVendaDeliveryObservacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons;

type
  TfrmLctVendaDeliveryObservacao = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    mmObservacao: TMemo;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctVendaDeliveryObservacao: TfrmLctVendaDeliveryObservacao;

implementation

{$R *.dfm}

procedure TfrmLctVendaDeliveryObservacao.btnCancelarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrCancel;

end;

procedure TfrmLctVendaDeliveryObservacao.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

end.
