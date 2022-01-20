unit uConsClienteAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DB, Grids, DBGrids, DBClient;

type
  TfrmConsClienteAtendimento = class(TfrmPadrao)
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    dtsAtendimento: TDataSource;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    cdsAtendimento: TClientDataSet;
    cdsAtendimentoID_CONSULTA: TIntegerField;
    cdsAtendimentoDS_PACIENTE: TStringField;
    cdsAtendimentoDT_CONSULTA: TDateField;
    cdsAtendimentoHR_CONSULTA: TTimeField;
    cdsAtendimentoNR_TELEFONE: TStringField;
    cdsAtendimentoNR_CELULAR: TStringField;
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
  frmConsClienteAtendimento: TfrmConsClienteAtendimento;

implementation

{$R *.dfm}

procedure TfrmConsClienteAtendimento.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsClienteAtendimento.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsClienteAtendimento.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsClienteAtendimento.FormCreate(Sender: TObject);
begin
  inherited;

  cdsAtendimento.CreateDataSet;
  cdsAtendimento.Open;

end;

end.
