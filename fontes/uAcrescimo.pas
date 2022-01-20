unit uAcrescimo;

interface

uses
  Windows, uPadrao, Controls, StdCtrls, Buttons, ExtCtrls, pngimage, Classes,
  Mask, DBCtrls, DB, Forms;

type
  TfrmAcrescimo = class(TfrmPadrao)
    dtsProduto: TDataSource;
    GroupBox1: TGroupBox;
    dbtValorUnitario: TDBText;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
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
  frmAcrescimo: TfrmAcrescimo;

implementation

uses uLctVenda;

{$R *.dfm}

procedure TfrmAcrescimo.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmAcrescimo.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmAcrescimo.dbeAcrescimoExit(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.FieldByName('VR_TOTALITEM').AsFloat := (
                                                              dtsProduto.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                              dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat
                                                            ) -
                                                            dtsProduto.DataSet.FieldByName('VR_DESCONTO').AsFloat +
                                                            dtsProduto.DataSet.FieldByName('VR_ACRESCIMO').AsFloat;

end;

procedure TfrmAcrescimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsProduto.DataSet.State in [dsInsert,dsEdit] ) then
    dtsProduto.DataSet.Cancel;

end;

procedure TfrmAcrescimo.FormCreate(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet := frmLctVenda.cdsProdutos;

end;

end.
