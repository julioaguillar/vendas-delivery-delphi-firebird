unit uQuantidade;

interface

uses Windows, uPadrao, Controls, StdCtrls, Buttons, ExtCtrls, pngimage, Classes,
  Mask, DBCtrls, DB, SysUtils, Forms;

type
  TfrmQuantidade = class(TfrmPadrao)
    dtsProduto: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    gpbBotoes: TGroupBox;
    dbtValorUnitario: TDBText;
    dbeQuantidade: TDBEdit;
    dbtValorFinal: TDBText;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure dbeQuantidadeExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuantidade: TfrmQuantidade;

implementation

uses uLctVenda, uFuncoes;

{$R *.dfm}

procedure TfrmQuantidade.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmQuantidade.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmQuantidade.dbeQuantidadeExit(Sender: TObject);
begin
  inherited;

  if ( dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat <= 0.0 ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Quantidade informada deve ser maior que 0 (zero).', MB_OK+MB_ICONINFORMATION);
    dbeQuantidade.SetFocus;
    Abort;
  end;

  dtsProduto.DataSet.FieldByName('VR_TOTALITEM').AsFloat := (
                                                              dtsProduto.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                              dtsProduto.DataSet.FieldByName('NR_QUANTIDADE').AsFloat
                                                            ) -
                                                            dtsProduto.DataSet.FieldByName('VR_DESCONTO').AsFloat +
                                                            dtsProduto.DataSet.FieldByName('VR_ACRESCIMO').AsFloat;

end;

procedure TfrmQuantidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsProduto.DataSet.State in [dsInsert,dsEdit] ) then
    dtsProduto.DataSet.Cancel;

end;

procedure TfrmQuantidade.FormCreate(Sender: TObject);
begin
  inherited;

  dtsProduto.DataSet := frmLctVenda.cdsProdutos;

end;

end.
