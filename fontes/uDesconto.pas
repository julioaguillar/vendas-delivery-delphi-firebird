unit uDesconto;

interface

uses
  Windows, uPadrao, Controls, StdCtrls, Buttons, ExtCtrls, pngimage, Classes,
  Mask, DBCtrls, DB, Forms, SysUtils;

type
  TfrmDesconto = class(TfrmPadrao)
    dtsProduto: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbtValorUnitario: TDBText;
    dbeDesconto: TDBEdit;
    dbtValorFinal: TDBText;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure dbeDescontoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesconto: TfrmDesconto;

implementation

uses uLctVenda, uFuncoes;

{$R *.dfm}

procedure TfrmDesconto.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmDesconto.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmDesconto.dbeDescontoExit(Sender: TObject);
var vrMinimo, vrTotal: Double;
begin
  inherited;

  vrMinimo := dtsProduto.DataSet.FieldByName('VR_PRECOMINIMO').AsFloat * dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat;
  vrTotal  := (
                dtsProduto.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat
              ) -
              dtsProduto.DataSet.FieldByName('VR_DESCONTO').AsFloat +
              dtsProduto.DataSet.FieldByName('VR_ACRESCIMO').AsFloat;

  if ( vrTotal < vrMinimo ) then
  begin
    MsgBox('"Prezado Cliente"'+#13+
           'Valor do Desconto informado menor que o valor M�nimo permitido'+#13#13+
           'Valor M�nimo Permitido: R$' + FormatFloat(',0.00', vrMinimo), MB_OK+MB_ICONINFORMATION);
    dbeDesconto.SetFocus;
    Abort;
  end;

  dtsProduto.DataSet.FieldByName('VR_TOTALITEM').AsFloat := vrTotal;

end;

procedure TfrmDesconto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsProduto.DataSet.State in [dsInsert,dsEdit] ) then
    dtsProduto.DataSet.Cancel;

end;

procedure TfrmDesconto.FormCreate(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet := frmLctVenda.cdsProdutos;

end;

end.
