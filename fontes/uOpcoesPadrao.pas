unit uOpcoesPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, jpeg, ExtCtrls, Menus, DB, Mask,
  StrUtils, pngimage;

type
  TfrmOpcoesPadrao = class(TForm)
    PanelImagem: TPanel;
    btnFecharPeq: TImage;
    btnFecharGde: TImage;
    ppmTeclasAtalho: TPopupMenu;
    pnlBorda: TPanel;
    ScrollBox: TScrollBox;
    pnlOpcao: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Label2: TLabel;
    Image2: TImage;
    Panel3: TPanel;
    Label3: TLabel;
    Image3: TImage;
    Panel4: TPanel;
    Label4: TLabel;
    Image4: TImage;
    Panel5: TPanel;
    Label5: TLabel;
    Image5: TImage;
    Panel6: TPanel;
    Label6: TLabel;
    Image6: TImage;
    Panel7: TPanel;
    Label7: TLabel;
    Image7: TImage;
    Panel8: TPanel;
    Label8: TLabel;
    Image8: TImage;
    Panel9: TPanel;
    Label9: TLabel;
    Image9: TImage;
    Panel10: TPanel;
    Label10: TLabel;
    Image10: TImage;
    Panel11: TPanel;
    Label11: TLabel;
    Image11: TImage;
    Panel12: TPanel;
    Label12: TLabel;
    Image12: TImage;
    Panel13: TPanel;
    Label13: TLabel;
    Image13: TImage;
    Panel14: TPanel;
    Label14: TLabel;
    Image14: TImage;
    Panel15: TPanel;
    Label15: TLabel;
    Image15: TImage;
    Panel16: TPanel;
    Label16: TLabel;
    Image16: TImage;
    TrackBar: TTrackBar;
    btnDescer: TSpeedButton;
    btnSubir: TSpeedButton;
    ImagemFundo: TImage;
    lblTitulo: TLabel;
    procedure pnlOpcaoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure PanelEnter(Sender: TObject);
    procedure PanelExit(Sender: TObject);
    procedure PanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnFecharGdeClick(Sender: TObject);
    procedure btnFecharPeqMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImagemFundoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSubirClick(Sender: TObject);
    procedure btnDescerClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure pnlBordaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnSubirMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PanelClick(Sender: TObject);
  private
    { Private declarations }

    LinhasDePanelsVisiveis: Integer;

  public
    { Public declarations }

    Imagens     : TImageList;
    TextoImagens: TStringList;
    fgOrigem    : String;

  end;

var
  frmOpcoesPadrao: TfrmOpcoesPadrao;

implementation

uses uConstantes, uCadCliente;

const
  PanelColor = 16775146; //RGB(234, 247, 255);

{$R *.dfm}


procedure TfrmOpcoesPadrao.PanelClick(Sender: TObject);
begin

  if ( Sender = Panel1 ) then
  begin

  end
  else if ( Sender = Panel2 ) then
  begin

  end;

end;

procedure TfrmOpcoesPadrao.FormCreate(Sender: TObject);
begin
  inherited;

  lblTitulo.Caption := 'AonVendas';
  TextoImagens      := TStringList.Create;

end;

procedure TfrmOpcoesPadrao.FormKeyPress(Sender: TObject; var Key: Char);
var KeyCode: Integer;
    Panel: TPanel;
begin
  //inherited;

  KeyCode := Ord(Key);

  if KeyCode = VK_RETURN then
  begin

    if ActiveControl is TPanel then
    begin

      Panel := TPanel(ActiveControl);

      if Assigned(Panel.OnClick) then
        Panel.OnClick(Panel);

    end;

  end;

end;

procedure TfrmOpcoesPadrao.pnlOpcaoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var i, j: Integer;
    Panel: TPanel;
begin
  inherited;

  btnFecharGde.Visible := False;

  for i := 0 to pnlOpcao.ControlCount - 1 do
  begin

    if pnlOpcao.Controls[i] is TPanel then
    begin

      Panel := TPanel(pnlOpcao.Controls[i]);

      if ( not ( Panel.Focused ) ) and ( Sender <> Panel ) then
      begin

        Panel.Color := clWhite;

        for j := 0 to Panel.ControlCount - 1 do
        begin

          if Panel.Controls[j] is TLabel then
          begin
            TLabel(Panel.Controls[j]).Font.Style := [];
            Break;
          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmOpcoesPadrao.PanelEnter(Sender: TObject);
var Panel: TPanel;
    i, Linha: Integer;
begin

  PanelExit(Sender);
  Panel := TPanel(Sender);

  Panel.Color := PanelColor;

  for i := 0 to Panel.ControlCount - 1 do
  begin

    if Panel.Controls[i] is TLabel then
    begin
      TLabel(Panel.Controls[i]).Font.Style := [fsBold];
      Break;
    end;

  end;

  Linha := Panel.Top div 278;

  if Linha = 0 then
    TrackBar.Position := TrackBar.Min
  else if Linha = LinhasDePanelsVisiveis then
    TrackBar.Position := TrackBar.Max
  else if ( ( TrackBar.Position + 1 ) > Linha ) then
    TrackBar.Position := Linha
  else if ( ( TrackBar.Position - 1 ) < Linha ) then
    TrackBar.Position := Linha - 1;

end;

procedure TfrmOpcoesPadrao.PanelExit(Sender: TObject);
begin

  pnlOpcaoMouseMove(pnlOpcao, [], 0, 0);

end;

procedure TfrmOpcoesPadrao.PanelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var WinControl: TWinControl;
    Panel: TPanel;
begin

  Panel := nil;
  
  if ( Sender is TImage ) or ( Sender is TPanel ) then
  begin

    if ( Sender is TImage ) then
    begin

      WinControl := TWinControl(Sender);

      while ( not ( WinControl is TPanel ) ) and ( not ( WinControl is TForm ) ) do
        WinControl := WinControl.Parent;

      if WinControl is TPanel then
        Panel := TPanel(WinControl);

    end
    else if Sender is TPanel then
      Panel := TPanel(Sender);

    if ( Panel <> nil ) and ( Assigned(Panel) ) then
    begin
      pnlOpcaoMouseMove(Panel, Shift, X, Y);
      Panel.Color := PanelColor;
    end;

  end;

end;

procedure TfrmOpcoesPadrao.btnFecharGdeClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmOpcoesPadrao.btnFecharPeqMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  btnFecharGde.Visible := True;

end;

procedure TfrmOpcoesPadrao.ImagemFundoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  btnFecharGde.Visible := False;
  pnlOpcaoMouseMove(Sender, Shift, X, Y);

end;

procedure TfrmOpcoesPadrao.btnSubirClick(Sender: TObject);
begin
  inherited;

  if ( TrackBar.Position > TrackBar.Min ) then
    TrackBar.Position := TrackBar.Position - 1;

end;

procedure TfrmOpcoesPadrao.btnDescerClick(Sender: TObject);
begin
  inherited;

  if ( TrackBar.Position < TrackBar.Max ) then
    TrackBar.Position := TrackBar.Position  + 1;

end;

procedure TfrmOpcoesPadrao.TrackBarChange(Sender: TObject);
begin
  inherited;

  pnlOpcao.Top := -(TrackBar.Position * 93);
  
end;

procedure TfrmOpcoesPadrao.Panel1Click(Sender: TObject);
begin
  inherited;

  if ( Panel1.Enabled ) then
  begin
    Panel1.SetFocus;
    PanelClick(Panel1);
  end;
  
end;

procedure TfrmOpcoesPadrao.Panel2Click(Sender: TObject);
begin
  inherited;

  if ( Panel2.Enabled ) then
  begin
    Panel2.SetFocus;
    PanelClick(Panel2);
  end;

end;

procedure TfrmOpcoesPadrao.Panel3Click(Sender: TObject);
begin
  inherited;

  Panel3.SetFocus;
  PanelClick(Panel3);

end;

procedure TfrmOpcoesPadrao.Panel4Click(Sender: TObject);
begin
  inherited;

  Panel4.SetFocus;
  PanelClick(Panel4);

end;

procedure TfrmOpcoesPadrao.Panel5Click(Sender: TObject);
begin
  inherited;

  Panel5.SetFocus;
  PanelClick(Panel5);

end;

procedure TfrmOpcoesPadrao.Panel6Click(Sender: TObject);
begin
  inherited;

  Panel6.SetFocus;
  PanelClick(Panel6);

end;

procedure TfrmOpcoesPadrao.Panel7Click(Sender: TObject);
begin
  inherited;

  Panel7.SetFocus;
  PanelClick(Panel7);

end;

procedure TfrmOpcoesPadrao.Panel8Click(Sender: TObject);
begin
  inherited;

  Panel8.SetFocus;
  PanelClick(Panel8);

end;

procedure TfrmOpcoesPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(TextoImagens);

end;

procedure TfrmOpcoesPadrao.FormShow(Sender: TObject);
var i, j, k: Integer;
    Panel: TPanel;
    LabelCaption: String;
    MenuItem: TMenuItem;
begin
  inherited;

  if Imagens.Count > 0 then
  begin
    Imagens.GetBitmap(0, Image1.Picture.Bitmap);
    Label1.Caption := TextoImagens.Strings[0];
  end;

  if Imagens.Count > 1 then
  begin
    Imagens.GetBitmap(1, Image2.Picture.Bitmap);
    Label2.Caption := TextoImagens.Strings[1];
  end;

  if Imagens.Count > 2 then
  begin
    Imagens.GetBitmap(2, Image3.Picture.Bitmap);
    Label3.Caption := TextoImagens.Strings[2];
  end;

  if Imagens.Count > 3 then
  begin
    Imagens.GetBitmap(3, Image4.Picture.Bitmap);
    Label4.Caption := TextoImagens.Strings[3];
  end;

  if Imagens.Count > 4 then
  begin
    Imagens.GetBitmap(4, Image5.Picture.Bitmap);
    Label5.Caption := TextoImagens.Strings[4];
  end;

  if Imagens.Count > 5 then
  begin
    Imagens.GetBitmap(5, Image6.Picture.Bitmap);
    Label6.Caption := TextoImagens.Strings[5];
  end;

  if Imagens.Count > 6 then
  begin
    Imagens.GetBitmap(6, Image7.Picture.Bitmap);
    Label7.Caption := TextoImagens.Strings[6];
  end;

  if Imagens.Count > 7 then
  begin
    Imagens.GetBitmap(7, Image8.Picture.Bitmap);
    Label8.Caption := TextoImagens.Strings[7];
  end;

  if Imagens.Count > 8 then
  begin
    Imagens.GetBitmap(8, Image9.Picture.Bitmap);
    Label9.Caption := TextoImagens.Strings[8];
  end;

  if Imagens.Count > 9 then
  begin
    Imagens.GetBitmap(9, Image10.Picture.Bitmap);
    Label10.Caption := TextoImagens.Strings[9];
  end;

  if Imagens.Count > 10 then
  begin
    Imagens.GetBitmap(10, Image11.Picture.Bitmap);
    Label11.Caption := TextoImagens.Strings[10];
  end;

  if Imagens.Count > 11 then
  begin
    Imagens.GetBitmap(11, Image12.Picture.Bitmap);
    Label12.Caption := TextoImagens.Strings[11];
  end;

  if Imagens.Count > 12 then
  begin
    Imagens.GetBitmap(12, Image13.Picture.Bitmap);
    Label13.Caption := TextoImagens.Strings[12];
  end;

  if Imagens.Count > 13 then
  begin
    Imagens.GetBitmap(13, Image14.Picture.Bitmap);
    Label14.Caption := TextoImagens.Strings[13];
  end;

  if Imagens.Count > 14 then
  begin
    Imagens.GetBitmap(14, Image15.Picture.Bitmap);
    Label15.Caption := TextoImagens.Strings[14];
  end;

  if Imagens.Count > 15 then
  begin
    Imagens.GetBitmap(15, Image16.Picture.Bitmap);
    Label16.Caption := TextoImagens.Strings[15];
  end;

  LinhasDePanelsVisiveis := 0;
  ppmTeclasAtalho.Items.Clear;

  for i := 0 to pnlOpcao.ControlCount - 1 do
  begin

    if pnlOpcao.Controls[i] is TPanel then
    begin

      Panel := TPanel(pnlOpcao.Controls[i]);

      for j := 0 to Panel.ControlCount - 1 do
      begin

        if ( Panel.Controls[j] is TImage ) then
        begin

          Panel.Visible := Assigned(TImage(Panel.Controls[j]).Picture.Graphic);

          if Panel.Visible then
          begin

            Inc(LinhasDePanelsVisiveis);

            if Assigned(Panel.OnClick) then
            begin

              for k := 0 to Panel.ControlCount - 1 do
              begin

                if Panel.Controls[k] is TLabel then
                begin

                  //Substitui Enters por Espaços.
                  LabelCaption := AnsiReplaceStr(TLabel(Panel.Controls[k]).Caption, #13 + #10, ' ');

                  if Pos('&', LabelCaption) > 0 then
                  begin
                    MenuItem := TMenuItem.Create(Self);
                    MenuItem.Visible := False;
                    MenuItem.Caption := LabelCaption;
                    MenuItem.ShortCut := TextToShortCut('Alt+' + LabelCaption[Pos('&', LabelCaption) + 1]);
                    MenuItem.OnClick := Panel.OnClick;
                    ppmTeclasAtalho.Items.Add(MenuItem);
                  end;

                  Break;

                end;

              end;

            end;

          end;

          Break;

        end;

      end;

    end;

  end;

  if LinhasDePanelsVisiveis mod 4 = 0 then
    LinhasDePanelsVisiveis := LinhasDePanelsVisiveis div 4
  else
    LinhasDePanelsVisiveis := LinhasDePanelsVisiveis div 4 + 1;

  if LinhasDePanelsVisiveis > 4 then
    TrackBar.Max := LinhasDePanelsVisiveis - 4
  else
  begin
    btnSubir.Enabled := False;
    btnDescer.Enabled := False;
    TrackBar.Enabled := False;
  end;

end;

procedure TfrmOpcoesPadrao.Panel9Click(Sender: TObject);
begin
  inherited;

  Panel9.SetFocus;
  PanelClick(Panel9);

end;

procedure TfrmOpcoesPadrao.Panel10Click(Sender: TObject);
begin
  inherited;

  Panel10.SetFocus;
  PanelClick(Panel10);

end;

procedure TfrmOpcoesPadrao.Panel11Click(Sender: TObject);
begin 
  inherited;

  Panel11.SetFocus;
  PanelClick(Panel11);

end;

procedure TfrmOpcoesPadrao.Panel12Click(Sender: TObject);
begin
  inherited;

  Panel12.SetFocus;
  PanelClick(Panel12);

end;

procedure TfrmOpcoesPadrao.Panel13Click(Sender: TObject);
begin
  inherited;

  Panel13.SetFocus;
  PanelClick(Panel13);

end;

procedure TfrmOpcoesPadrao.Panel14Click(Sender: TObject);
begin
  inherited;

  Panel14.SetFocus;
  PanelClick(Panel14);

end;

procedure TfrmOpcoesPadrao.Panel15Click(Sender: TObject);
begin
  inherited;

  Panel15.SetFocus;
  PanelClick(Panel15);

end;

procedure TfrmOpcoesPadrao.Panel16Click(Sender: TObject);
begin
  inherited;

  Panel16.SetFocus;
  PanelClick(Panel16);

end;

procedure TfrmOpcoesPadrao.Image15Click(Sender: TObject);
begin
  inherited;

  Panel15.SetFocus;
  PanelClick(Panel15);
  
end;

procedure TfrmOpcoesPadrao.Image16Click(Sender: TObject);
begin
  inherited;

  Panel16.SetFocus;
  PanelClick(Panel16);

end;

procedure TfrmOpcoesPadrao.pnlBordaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  btnFecharGde.Visible := False;

end;

procedure TfrmOpcoesPadrao.btnSubirMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  btnFecharGde.Visible := False;
  
end;

end.
