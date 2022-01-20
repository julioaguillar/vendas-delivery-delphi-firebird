unit uSplashConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, pngimage, ExtCtrls, StdCtrls;

type
  TfrmSplashConexao = class(TfrmPadrao)
    lblMensagem: TLabel;
    imgConectando: TImage;
    shpConectando: TShape;
    lblSistema: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashConexao: TfrmSplashConexao;

implementation

uses uConstantes;

{$R *.dfm}

procedure TfrmSplashConexao.FormCreate(Sender: TObject);
begin
  inherited;

  lblSistema.Caption := NOME_SISTEMA;

end;

end.
