unit uSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, pngimage, StdCtrls, Grids, ValEdit, jpeg, ComCtrls;

type
  TfrmSpleshScreen = class(TfrmPadrao)
    Timer: TTimer;
    ProgressBar: TProgressBar;
    imgAberturaAon: TImage;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpleshScreen: TfrmSpleshScreen;

implementation

uses uConstantes;

{$R *.dfm}

procedure TfrmSpleshScreen.TimerTimer(Sender: TObject);
begin
  inherited;

  ProgressBar.Position := ProgressBar.Position + 1;

  if ( ProgressBar.Position >= 100 ) then
  begin
    Timer.Enabled := false;
    Close;
  end;

end;

end.
