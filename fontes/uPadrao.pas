unit uPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, DBCtrls, Grids, ValEdit, DBGrids;

type
  TfrmPadrao = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses uCampoObrigatorio;

{$R *.dfm}

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if ( Key = #13 ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end
  else if ( Key = #27 ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,1,0);
  end;

end;

end.
