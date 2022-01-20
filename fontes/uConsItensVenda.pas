unit uConsItensVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ImgList, DB,
  DBClient, pngimage;

type
  TfrmConsItensVenda = class(TfrmPadrao)
    ImageList: TImageList;
    cdsItensVenda: TClientDataSet;
    dtsItensVenda: TDataSource;
    cdsItensVendaNR_ITEM: TIntegerField;
    cdsItensVendaDS_PRODUTO: TStringField;
    cdsItensVendaCD_PRODUTO: TStringField;
    cdsItensVendaCD_GTIN: TStringField;
    cdsItensVendaFG_SELECIONADO: TBooleanField;
    cdsItensVendaSEL: TStringField;
    cdsItensVendaFG_CANCELADO: TStringField;
    imgFundo: TImage;
    btbtnConfirmar: TBitBtn;
    btbtnRetornar: TBitBtn;
    btnF1: TSpeedButton;
    btnF2: TSpeedButton;
    btnF3: TSpeedButton;
    btnF4: TSpeedButton;
    dbgRegistros: TDBGrid;
    Label22: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnF2Click(Sender: TObject);
    procedure btnF1Click(Sender: TObject);
    procedure btnF3Click(Sender: TObject);
    procedure btnF4Click(Sender: TObject);
    procedure btbtnConfirmarClick(Sender: TObject);
    procedure btbtnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgRegistrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsItensVenda: TfrmConsItensVenda;

implementation

{$R *.dfm}

procedure TfrmConsItensVenda.btbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsItensVenda.btbtnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsItensVenda.btnF2Click(Sender: TObject);
begin
  inherited;

  if ( not ( cdsItensVenda.IsEmpty ) ) then
  begin

    if ( not ( cdsItensVenda.Bof ) ) then
      cdsItensVenda.Prior;

  end;

end;

procedure TfrmConsItensVenda.btnF1Click(Sender: TObject);
begin
  inherited;

  if ( not ( cdsItensVenda.IsEmpty ) ) then
  begin

    if ( not ( cdsItensVenda.Eof ) ) then
      cdsItensVenda.Next;

  end;

end;

procedure TfrmConsItensVenda.btnF3Click(Sender: TObject);
begin
  inherited;

  if ( not ( cdsItensVenda.IsEmpty ) ) then
  begin

    if ( cdsItensVenda.FieldByName('FG_CANCELADO').AsString <> 'S' ) then
    begin
      cdsItensVenda.Edit;
      cdsItensVenda.FieldByName('FG_SELECIONADO').AsBoolean := True;
      cdsItensVenda.Post;
    end;

  end;

end;

procedure TfrmConsItensVenda.btnF4Click(Sender: TObject);
begin
  inherited;

  if ( not ( cdsItensVenda.IsEmpty ) ) then
  begin

    if ( cdsItensVenda.FieldByName('FG_CANCELADO').AsString <> 'S' ) then
    begin
      cdsItensVenda.Edit;
      cdsItensVenda.FieldByName('FG_SELECIONADO').AsBoolean := False;
      cdsItensVenda.Post;
    end;

  end;

end;

procedure TfrmConsItensVenda.dbgRegistrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Picture: TPicture;
    AlignPicture: Integer;
begin
  inherited;

  if ( not ( cdsItensVenda.IsEmpty ) ) then
  begin

    if ( not ( gdSelected in State ) ) then
    begin

      if ( cdsItensVenda.FieldByName('FG_CANCELADO').AsString = 'S' ) then
        dbgRegistros.Canvas.Font.Color  := clSilver
      else
        dbgRegistros.Canvas.Font.Color := clWindowText;

      dbgRegistros.DefaultDrawColumnCell(Rect, DataCol, Column, State);

    end;

    if ( UpperCase(Column.FieldName) = 'SEL' ) then
    begin

      with TDBGrid( Sender ).Canvas do
      begin

        FillRect( Rect );
        Picture := TPicture.Create;

        try

          if ( not ( cdsItensVenda.FieldByName('FG_SELECIONADO').AsBoolean ) ) then
          begin

            if ( cdsItensVenda.FieldByName('FG_CANCELADO').AsString = 'S' ) then
              ImageList.GetBitmap(3, Picture.Bitmap)
            else
              ImageList.GetBitmap(1, Picture.Bitmap);

          end
          else
          begin

            if ( cdsItensVenda.FieldByName('FG_CANCELADO').AsString = 'S' ) then
              ImageList.GetBitmap(2, Picture.Bitmap)
            else
              ImageList.GetBitmap(0, Picture.Bitmap);

          end;

          AlignPicture := Trunc( ( Column.Width - Picture.Width ) / 2 );
          Draw(Rect.Left + AlignPicture, Rect.Top+3, Picture.Graphic);

        finally
          Picture.Free;
        end;

      end;

    end;

  end;

end;

procedure TfrmConsItensVenda.FormCreate(Sender: TObject);
begin
  inherited;

  cdsItensVenda.CreateDataSet;
  cdsItensVenda.Open;

end;

procedure TfrmConsItensVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_F1 ) then
    btnF1Click(btnF1)
  else if ( Key = VK_F2 ) then
    btnF2Click(btnF2)
  else if ( Key = VK_F3 ) then
    btnF3Click(btnF3)
  else if ( Key = VK_F4 ) then
    btnF4Click(btnF4)
  else if ( Key = VK_F11 ) then
    btbtnConfirmarClick(btbtnConfirmar)
  else if ( Key = VK_F12 ) then
    btbtnRetornarClick(btbtnRetornar);

end;

procedure TfrmConsItensVenda.FormShow(Sender: TObject);
begin
  inherited;

  ShowScrollBar(dbgRegistros.handle, SB_VERT, False);
  ShowScrollBar(dbgRegistros.handle, SB_HORZ, False);

end;

end.
