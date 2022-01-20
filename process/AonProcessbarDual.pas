{*****************************************************************}
{ AonProcessbarDual  - Unit que cria uma Barra de Progresso dupla }
{                                                                 }
{ Autor: Júlio César B. Aguilar                                   }
{ Marília, 15 de Abril de 2010                                    }
{*****************************************************************}

unit AonProcessbarDual;

interface

uses Forms, Graphics, Windows, ComCtrls, StdCtrls, Classes, Dialogs,
  SysUtils, ExtCtrls;

type

  TProcessamentoDual = class
  private
    { Private declarations }

    function GetPositionBar : Integer;
    function GetPositionBar2: Integer;

    function GetNumProcess: Integer;
    function GetNumProcess2: Integer;

    function GetPositionProcess: Integer;
    function GetPositionProcess2: Integer;

    procedure SetPositionBar(Value: Integer);
    procedure SetPositionBar2(Value: Integer);

    procedure SetNumProcess(const Value: Integer);
    procedure SetNumProcess2(const Value: Integer);

    procedure SetPositionProcess(const Value: Integer);
    procedure SetPositionProcess2(const Value: Integer);

    function GetMaxValue: Integer;
    function GetMaxValue2: Integer;

    function GetMinValue: Integer;
    function GetMinValue2: Integer;

    procedure SetShowPositionProcess(const Value: Boolean);
    procedure SetShowPositionProcess2(const Value: Boolean);

    function GetShowPositionProcess: Boolean;
    function GetShowPositionProcess2: Boolean;

    procedure SetCaption(const Value: String);
    procedure SetCaptionAuxiliar(const Value: String);
    function  GetCaption: String;
    function  GetCaptionAuxiliar: String;
    procedure SetCaptionStyle(const Value: TFontStyles);
    function  GetCaptionStyle: TFontStyles;
    procedure RefreshScreen;
    function GetShowCaptionAuxiliar: Boolean;
    procedure SetShowCaptionAuxiliar(const Value: Boolean);

  public
    { Public declarations }

    // Cria o Objeto
    procedure CreateProcess;

    // Exibe o formulario de Processamento
    procedure StartProcess;

    // Encerra/Destroi o Formulario de Processamento
    procedure CloseProcess;

    // Configura Valor Minimo e Maximo para a Barra de Progressp
    procedure SetMinMax(Min, Max: Integer);
    procedure SetMinMax2(Min, Max: Integer);

    // Retorna o valor que foi setado para MAX no metodo SetMinMax
    property MaxValue: Integer read GetMaxValue;
    property MaxValue2: Integer read GetMaxValue2;

    // Retorna o valor que foi setado para MIN no metodo SetMinMax
    property MinValue: Integer read GetMinValue;
    property MinValue2: Integer read GetMinValue2;

  published

    // Posição da Barra
    property PositionBar: Integer read GetPositionBar write SetPositionBar;
    property PositionBar2: Integer read GetPositionBar2 write SetPositionBar2;

    // Define Numero de Processamentos a ser realizados
    property NumProcess: Integer read GetNumProcess write SetNumProcess;
    property NumProcess2: Integer read GetNumProcess2 write SetNumProcess2;

    // Define o Numero do Processo que está sendo executado
    property PositionProcess: Integer read GetPositionProcess write SetPositionProcess;
    property PositionProcess2: Integer read GetPositionProcess2 write SetPositionProcess2;

    // Define se será exibida o label com os processamentos
    property ShowPositionProcess: Boolean read GetShowPositionProcess write SetShowPositionProcess;
    property ShowPositionProcess2: Boolean read GetShowPositionProcess2 write SetShowPositionProcess2;

    // Descrição do Processamento Executado
    property Caption: String read GetCaption write SetCaption;

    // Descrição do Processamento Auxiliar Executado
    property CaptionAuxiliar: String read GetCaptionAuxiliar write SetCaptionAuxiliar;

    property CaptionStyle: TFontStyles read GetCaptionStyle write SetCaptionStyle;

    property ShowCaptionAuxiliar: Boolean read GetShowCaptionAuxiliar write SetShowCaptionAuxiliar;

  end;

var
  frmProcess: TForm;
  bvlBack   : TBevel;
  lblProcess, lblProcess2: TLabel;

  imgAon, imgAon2              : TImage;
  Progress, Progress2          : TProgressBar;
  lblNumProcess, lblNumProcess2: TLabel;

  FShowPositionProcess, FShowPositionProcess2, FShowCaptionAuxiliar: Boolean;
  FPositionBar, FPositionBar2        : Integer;
  FNumProcess, FNumProcess2          : Integer;
  FPositionProcess, FPositionProcess2: Integer;

  FCaption, FCaptionAuxiliar: String;
  FCaptionStyle: TFontStyles;
  WindowList   : Pointer;

implementation

{$R Aon.RES}

uses Controls;

{ TProcessamentoDual }

procedure TProcessamentoDual.CloseProcess;
begin

  if ( frmProcess <> nil ) then
  begin

    if ( WindowList <> nil ) then
      EnableTaskWindows(WindowList);

    frmProcess.Close;
    frmProcess := Nil;

  end;

end;

procedure TProcessamentoDual.CreateProcess;
begin

  FPositionBar          := 0;
  FShowPositionProcess  := True;
  FNumProcess           := 0;
  FPositionProcess      := 0;

  FPositionBar2         := 0;
  FShowPositionProcess2 := True;
  FNumProcess2          := 0;
  FPositionProcess2     := 0;
  FShowCaptionAuxiliar  := False;

  WindowList            := nil;

  frmProcess := TForm.Create( Nil );
  with frmProcess do
  begin
    Left         := 243;
    Top          := 249;
    BorderIcons  := [];
    BorderStyle  := bsSingle;
    Caption      := 'Processamento';
    ClientHeight := 112;
    ClientWidth  := 430;
    Color        := clBtnFace;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color   := clWindowText;
    Font.Height  := -11;
    Font.Name    := 'MS Sans Serif';
    Font.Style   := [];
    Position     := poMainFormCenter;

    bvlBack := TBevel.Create( frmProcess );
    with bvlBack do
    begin
      Parent := frmProcess;
      Left   := 1;
      Top    := 1;
      Width  := 429;
      Height := 111;
      Shape  := bsFrame;
    end;

    imgAon := TImage.Create( frmProcess );
    with imgAon do
    begin
      Parent := frmProcess;
      Left   := 10;
      Top    := 35;
      Width  := 32;
      Height := 32;
      Center := True;
      Picture.Bitmap.LoadFromResourceName(HInstance, 'BITMAP_1');
      Transparent := True;
    end;

    lblProcess := TLabel.Create( frmProcess );
    with lblProcess do
    begin
      Parent       := frmProcess;
      Left         := 50;
      Top          := 11;
      Width        := 250;
      Height       := 13;
      Caption      := 'lblProcess';
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -11;
      Font.Name    := 'MS Sans Serif';
      ParentFont   := False;
      Caption      := 'Aguarde. Processando...'
    end;

    lblProcess2 := TLabel.Create( frmProcess );
    with lblProcess2 do
    begin
      Parent       := frmProcess;
      Left         := 50;
      Top          := 90;
      Width        := 250;
      Height       := 13;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -11;
      Font.Name    := 'MS Sans Serif';
      ParentFont   := False;
      Caption      := '';
    end;

    lblNumProcess := TLabel.Create( frmProcess );
    with lblNumProcess do
    begin
      Parent       := frmProcess;
      Left         := 333;
      Top          := 51;
      Width        := 84;
      Height       := 13;
      Alignment    := taRightJustify;
      Caption      := 'lblNumProcess';
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -11;
      Font.Name    := 'MS Sans Serif';
      ParentFont   := False;
      Caption      := 'Processo 1 de 1';
    end;    

    lblNumProcess2 := TLabel.Create( frmProcess );
    with lblNumProcess2 do
    begin
      Parent       := frmProcess;
      Left         := 333;
      Top          := 90;
      Width        := 84;
      Height       := 13;
      Alignment    := taRightJustify;
      Caption      := 'lblNumProcess2';
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -11;
      Font.Name    := 'MS Sans Serif';
      ParentFont   := False;
      Caption      := 'Processo 1 de 1';
    end;

    Progress := TProgressBar.Create( frmProcess );
    with Progress do
    begin
      Parent     := frmProcess;
      Left       := 50;
      Top        := 28;
      Width      := 367;
      Height     := 20;
      ParentFont := False;
      Position   := 0;
    end;

    Progress2 := TProgressBar.Create( frmProcess );
    with Progress2 do
    begin
      Parent     := frmProcess;
      Left       := 50;
      Top        := 68;
      Width      := 367;
      Height     := 20;
      ParentFont := False;
      Position   := 0;
    end;

  end;

end;

function TProcessamentoDual.GetPositionBar: Integer;
begin

  Result := FPositionBar;
  
end;

function TProcessamentoDual.GetPositionBar2: Integer;
begin

  Result := FPositionBar2;
  
end;

procedure TProcessamentoDual.SetMinMax(Min, Max: Integer);
begin

  Progress.Min := Min;
  Progress.Max := Max;
  GetMaxValue;
  
end;

procedure TProcessamentoDual.SetMinMax2(Min, Max: Integer);
begin

  Progress2.Min := Min;
  Progress2.Max := Max;
  GetMaxValue2;
  
end;

procedure TProcessamentoDual.SetPositionBar(Value: Integer);
begin

  FPositionBar      := Value;
  Progress.Position := FPositionBar;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetPositionBar2(Value: Integer);
begin

  FPositionBar2      := Value;
  Progress2.Position := FPositionBar2;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.StartProcess;
begin

  if ( not ( FShowPositionProcess ) ) then
    lblNumProcess.Visible := False;

  WindowList := DisableTaskWindows(frmProcess.Handle);
  frmProcess.Show;

  Application.ProcessMessages;

end;

procedure TProcessamentoDual.SetNumProcess(const Value: Integer);
begin

  FNumProcess := Value;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetNumProcess2(const Value: Integer);
begin

  FNumProcess2 := Value;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetPositionProcess(const Value: Integer);
begin

  FPositionProcess      := Value;
  lblNumProcess.Caption := 'Processo ' + IntToStr(FPositionProcess) + ' de ' + IntToStr(FNumProcess);
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetPositionProcess2(const Value: Integer);
begin

  FPositionProcess2      := Value;
  lblNumProcess2.Caption := 'Processo ' + IntToStr(FPositionProcess2) + ' de ' + IntToStr(FNumProcess2);
  RefreshScreen;
  
end;

function TProcessamentoDual.GetNumProcess: Integer;
begin

  Result := FNumProcess;
  
end;

function TProcessamentoDual.GetNumProcess2: Integer;
begin

  Result := FNumProcess2;
  
end;

function TProcessamentoDual.GetPositionProcess: Integer;
begin

  Result := FPositionProcess;
  
end;

function TProcessamentoDual.GetPositionProcess2: Integer;
begin

  Result := FPositionProcess2;
  
end;

function TProcessamentoDual.GetCaption: String;
begin

  Result := FCaption;
  
end;

function TProcessamentoDual.GetCaptionAuxiliar: String;
begin

  Result := FCaptionAuxiliar;
  
end;

function TProcessamentoDual.GetCaptionStyle: TFontStyles;
begin

  Result := FCaptionStyle;
  
end;

procedure TProcessamentoDual.SetCaption(const Value: String);
begin

  FCaption           := Value;
  lblProcess.Caption := FCaption;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetCaptionAuxiliar(const Value: String);
begin

  FCaptionAuxiliar    := Value;
  lblProcess2.Caption := FCaptionAuxiliar;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetCaptionStyle(const Value: TFontStyles);
begin

  FCaptionStyle         := Value;
  lblProcess.Font.Style := FCaptionStyle;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.RefreshScreen;
begin

  SetActiveWindow( frmProcess.Handle );
  Application.ProcessMessages;
  
end;

function TProcessamentoDual.GetShowPositionProcess: Boolean;
begin

  Result := FShowPositionProcess;
  
end;

function TProcessamentoDual.GetShowPositionProcess2: Boolean;
begin

  Result := FShowPositionProcess2;
  
end;

procedure TProcessamentoDual.SetShowPositionProcess(const Value: Boolean);
begin

  FShowPositionProcess  := Value;
  lblNumProcess.Visible := FShowPositionProcess;
  RefreshScreen;
  
end;

procedure TProcessamentoDual.SetShowPositionProcess2(const Value: Boolean);
begin

  FShowPositionProcess2  := Value;
  lblNumProcess2.Visible := FShowPositionProcess2;
  RefreshScreen;
  
end;

function TProcessamentoDual.GetMaxValue: Integer;
begin

  Result := Progress.Max;
  
end;

function TProcessamentoDual.GetMaxValue2: Integer;
begin

  Result := Progress2.Max;
  
end;

function TProcessamentoDual.GetMinValue: Integer;
begin

  Result := Progress.Min;
  
end;

function TProcessamentoDual.GetMinValue2: Integer;
begin

  Result := Progress2.Min;
  
end;

function TProcessamentoDual.GetShowCaptionAuxiliar: Boolean;
begin

  Result := FShowCaptionAuxiliar;
  
end;

procedure TProcessamentoDual.SetShowCaptionAuxiliar(const Value: Boolean);
begin

  FShowCaptionAuxiliar := Value;
  lblProcess2.Visible  := FShowCaptionAuxiliar;
  RefreshScreen;
  
end;

end.