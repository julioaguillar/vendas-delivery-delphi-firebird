unit uMsgErrosPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, DBClient;

type
  TfrmMsgErrosPadrao = class(TfrmPadrao)
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    gpbBotoes: TGroupBox;
    btnRetornar: TBitBtn;
    imgAdvertencia: TImage;
    lblCliente: TLabel;
    lblMensagem: TLabel;
    cdsInconsistencia: TClientDataSet;
    dtsInconsistencia: TDataSource;
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMsgErrosPadrao: TfrmMsgErrosPadrao;

implementation

{$R *.dfm}

procedure TfrmMsgErrosPadrao.btnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

end.
