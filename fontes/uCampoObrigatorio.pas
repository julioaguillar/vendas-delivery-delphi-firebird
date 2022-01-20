unit uCampoObrigatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, pngimage, ExtCtrls, Buttons, DB, DBClient, Grids,
  DBGrids, ValEdit, Menus;

type
  TfrmCampoObrigatorio = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnCorrigir: TBitBtn;
    btnRetornar: TBitBtn;
    gpbCabecalho: TGroupBox;
    gpbRegistros: TGroupBox;
    imgComputador: TImage;
    lblCliente: TLabel;
    lblCampos: TLabel;
    dbgCampoObrigatorio: TDBGrid;
    dtsCampoObrigatorio: TDataSource;
    cdsCampoObrigatorio: TClientDataSet;
    cdsCampoObrigatorioDS_COMPONENTE: TStringField;
    cdsCampoObrigatorioDS_MENSAGEM: TStringField;
    ppmBotoes: TPopupMenu;
    pmiCorrigir: TMenuItem;
    pmiRetornar: TMenuItem;
    procedure dbgCampoObrigatorioDblClick(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCampoObrigatorio: TfrmCampoObrigatorio;

implementation

{$R *.dfm}

procedure TfrmCampoObrigatorio.btnCorrigirClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmCampoObrigatorio.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmCampoObrigatorio.dbgCampoObrigatorioDblClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

end.
