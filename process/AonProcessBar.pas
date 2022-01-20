{------------------------------------------------------------------------------}
{ Para utilização do AonProcessbar:                                            }
{ 1 - Criar uma pasta exclusiva para os arquivos. Ex: "C:\Projetos\AonWin\Lib" }
{ 2 - Copiar nesta pasta os arquivos AonProcessbar.Pas e Aon.RES.              }
{ 3 - Adicionar esta pasta no Library Path do Delphi                           }
{ 4 - Adicionar AonProcessbar na seção uses das Units que utilizarão o Objeto  }
{------------------------------------------------------------------------------}

unit AonProcessbar;

interface

uses Forms, Graphics, Windows, ComCtrls, StdCtrls, Classes, Dialogs,
     SysUtils, ExtCtrls;

type

  TProcessamento = class
  private
    { Private declarations }
    function GetPositionBar : Integer;
    function GetNumProcess: Integer;
    function GetPositionProcess: Integer;

    procedure SetPositionBar(Value : Integer);
    procedure SetNumProcess(const Value: Integer);
    procedure SetPositionProcess(const Value: Integer);
    function  GetCaption: String;
    procedure SetCaption(const Value: String);
    procedure RefreshScreen;
    procedure SetShowPositionProcess(const Value: Boolean);
    function GetShowPositionProcess: Boolean;
    function GetMaxValue: Integer;
    function GetMinValue: Integer;

  public
    { Public declarations }
    // Cria o Objeto
    procedure CreateProcess;

    // Configura Valor Minimo e Maximo para a Barra de Progressp
    procedure SetMinMax(Min, Max: Integer);

    // Exibe o formulario de Processamento
    procedure StartProcess;

    // Encerra/Destroi o Formulario de Processamento
    procedure CloseProcess;

    // Retorna o valor que foi setado para MAX no metodo SetMinMax
    property MaxValue: Integer read GetMaxValue;

    // Retorna o valor que foi setado para MIN no metodo SetMinMax
    property MinValue: Integer read GetMinValue;

  published
    // Posição da Barra
    property PositionBar: Integer read GetPositionBar write SetPositionBar;

    // Define Numero de Processamentos a ser realizados
    property NumProcess: Integer read GetNumProcess write SetNumProcess;

    // Define o Numero do Processo que está sendo executado
    property PositionProcess: Integer read GetPositionProcess write SetPositionProcess;

    // Descrição do Processamento Executado
    property Caption: String read GetCaption write SetCaption;

    // Define se será exibida o label com os processamentos
    property ShowPositionProcess: Boolean read GetShowPositionProcess write SetShowPositionProcess;

  end;

var
  frmProcess   : TForm;
  lblProcess   : TLabel;
  lblNumProcess: TLabel;
  Progress     : TProgressBar;
  bvlBack      : TBevel;
  imgAon       : TImage;

  FShowPositionProcess: Boolean;
  FPositionBar: Integer;
  FNumProcess: Integer;
  FPositionProcess: Integer;
  FCaption: String;
  WindowList: Pointer;

implementation

{$R Aon.RES}

uses Controls;

{ TProcessamento }

procedure TProcessamento.CloseProcess;
begin

  if ( frmProcess <> nil ) then
  begin
    
	if ( WindowList <> nil ) then
      EnableTaskWindows(WindowList);

    frmProcess.Close;
    frmProcess := Nil
	
  end;
  
end;

procedure TProcessamento.CreateProcess;
begin

  FPositionBar         := 0;
  FShowPositionProcess := True;
  FNumProcess          := 0;
  FPositionProcess     := 0;
  WindowList           := nil;

  frmProcess := TForm.Create( Nil );
  
  with frmProcess do
  begin
  
    Left := 243;
    Top  := 249;
	
    BorderIcons := [];
    BorderStyle := bsSingle;
    
    Caption := 'Processamento';
    
    ClientHeight := 69;
    ClientWidth  := 384;
	
    Color := clBtnFace;
	
    Font.Charset := DEFAULT_CHARSET;
    Font.Color   := clWindowText;
    Font.Height  := -11;
    Font.Name    := 'MS Sans Serif';
    Font.Style   := [];
    
	Position := poMainFormCenter;

    bvlBack := TBevel.Create( frmProcess );
    with bvlBack do
    begin
      Parent := frmProcess;
      Left   := 1;
      Top    := 1;
      Width  := 382;
      Height := 67;
      Shape  := bsFrame;
    end;

    imgAon := TImage.Create( frmProcess );
    with imgAon do
    begin
      Parent := frmProcess;
      Left   := 10;
      Top    := 20;
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

    lblNumProcess := TLabel.Create( frmProcess );
    with lblNumProcess do
    begin
      Parent       := frmProcess;
      Left         := 287;
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

    Progress := TProgressBar.Create( frmProcess );
    with Progress do
    begin
      Parent     := frmProcess;
      Left       := 50;
      Top        := 28;
      Width      := 321;
      Height     := 20;
      ParentFont := False;
      Position   := 0;
    end;

  end;

end;

function TProcessamento.GetPositionBar: Integer;
begin

  Result := FPositionBar;
  
end;

procedure TProcessamento.SetMinMax(Min, Max: Integer);
begin

  Progress.Min := Min;
  Progress.Max := Max;
  GetMaxValue;
  
end;

procedure TProcessamento.SetPositionBar(Value: Integer);
begin

  FPositionBar := Value;
  Progress.Position := FPositionBar;
  RefreshScreen;
  
end;

procedure TProcessamento.StartProcess;
begin

  if ( not ( FShowPositionProcess ) ) then
    lblNumProcess.Visible := False;

  WindowList := DisableTaskWindows(frmProcess.Handle);
  frmProcess.Show;
  Application.ProcessMessages;
  
end;

procedure TProcessamento.SetNumProcess(const Value: Integer);
begin

  FNumProcess := Value;
  RefreshScreen;
  
end;

procedure TProcessamento.SetPositionProcess(const Value: Integer);
begin

  FPositionProcess := Value;
  lblNumProcess.Caption := 'Processo ' + IntToStr(FPositionProcess) + ' de ' + IntToStr(FNumProcess);
  RefreshScreen;
  
end;

function TProcessamento.GetNumProcess: Integer;
begin

  Result := FNumProcess;
  
end;

function TProcessamento.GetPositionProcess: Integer;
begin

  Result := FPositionProcess;
  
end;

function TProcessamento.GetCaption: String;
begin

  Result := FCaption;
  
end;

procedure TProcessamento.SetCaption(const Value: String);
begin

  FCaption := Value;
  lblProcess.Caption := FCaption;
  RefreshScreen;
  
end;

procedure TProcessamento.RefreshScreen;
begin

  SetActiveWindow( frmProcess.Handle );
  Application.ProcessMessages;
  
end;

function TProcessamento.GetShowPositionProcess: Boolean;
begin

  Result := FShowPositionProcess;
  
end;

procedure TProcessamento.SetShowPositionProcess(const Value: Boolean);
begin

  FShowPositionProcess := Value;
  lblNumProcess.Visible := FShowPositionProcess;
  RefreshScreen;
  
end;

function TProcessamento.GetMaxValue: Integer;
begin

  Result := Progress.Max;
  
end;

function TProcessamento.GetMinValue: Integer;
begin

  Result := Progress.Min;
  
end;

end.