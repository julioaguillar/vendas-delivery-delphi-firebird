unit uAtualizacaoBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmAtualizacaoBanco = class(TfrmPadrao)
    imgCabecalhoAon: TImage;
    lblVerificandoConexao: TLabel;
    lblCriandoPontoRecuperacao: TLabel;
    lblAtualizando: TLabel;
    lblRestaurando: TLabel;
    lblFinalizando: TLabel;
    pgbBackup: TProgressBar;
    pgbAtualizando: TProgressBar;
    pgbRestaurando: TProgressBar;
    ckbVerificando: TCheckBox;
    ckbCriando: TCheckBox;
    ckbAtualizando: TCheckBox;
    ckbRestaurando: TCheckBox;
    ckbFinalizando: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizacaoBanco: TfrmAtualizacaoBanco;

implementation

uses uConstantes;

{$R *.dfm}

end.
