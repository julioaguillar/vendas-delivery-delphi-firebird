unit uConsPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TfrmConsPadrao = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    gpbPesquisa: TGroupBox;
    gpbRegistros: TGroupBox;
    edtPesquisa: TEdit;
    dbgRegistros: TDBGrid;
    dtsRegistros: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsPadrao: TfrmConsPadrao;

implementation

uses udmPrincipal;

{$R *.dfm}

end.
