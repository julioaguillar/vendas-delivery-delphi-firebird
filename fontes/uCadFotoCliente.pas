unit uCadFotoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uPadrao, VFrames;

type
  TfrmCadFotoCliente = class(TfrmPadrao)
    gpbDispositivos: TGroupBox;
    cbbDispositivos: TComboBox;
    btnCapturar: TBitBtn;
    pnlAguarde: TPanel;
    pnlImagem: TPanel;
    pbFoto: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbbDispositivosClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
  private
    { Private declarations }

    execActivate, Running: Boolean;
    fVideoImage : TVideoImage;
    fVideoBitmap: TBitmap;

    procedure OnNewVideoFrame(Sender: TObject; Width, Height: integer; DataPtr: pointer);
    procedure BloquearComponentes(Value: Boolean);

  public
    { Public declarations }
    fgConsulta   : Boolean;
    ImagemRetorno: TBitmap;

  end;

var
  frmCadFotoCliente: TfrmCadFotoCliente;

implementation

uses uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmCadFotoCliente.OnNewVideoFrame(Sender : TObject; Width, Height: integer; DataPtr: pointer);
begin

  fVideoImage.GetBitmap(fVideoBitmap);
  pbFoto.Canvas.Draw(0, 0, fVideoBitmap);

  if ( not ( btnCapturar.Enabled ) ) then
    BloquearComponentes(false);

  Application.ProcessMessages;

end;

procedure TfrmCadFotoCliente.btnCapturarClick(Sender: TObject);
begin
  inherited;

  if ( Running ) then
  begin

    try

      pnlAguarde.Caption := 'Aguarde capturando foto...';
      pnlAguarde.Visible := true;

      SetIniValue('Webcam', 'DriverWeb', cbbDispositivos.Text);

      Application.ProcessMessages;

      ImagemRetorno := TBitmap.Create;
      ImagemRetorno.Assign(fVideoBitmap);

      FVideoImage.VideoStop;

      pnlAguarde.Visible := false;

      ModalResult := mrOk;

    except
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao salvar a foto.', MB_OK+MB_ICONERROR);
      ModalResult := mrRetry;
    end;

  end;

end;

procedure TfrmCadFotoCliente.cbbDispositivosClick(Sender: TObject);
begin
  inherited;

  if ( cbbDispositivos.Text <> '' ) then
  begin

    try

      if ( Running ) then
      begin
        fVideoImage.VideoStop;
        Running := false;
      end;

      fVideoImage.VideoStart(cbbDispositivos.Text);
      Running := true;

    except
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao conectar no dispositivo de vídeo', MB_OK+MB_ICONERROR);
      BloquearComponentes(True);
    end;

  end;

end;

procedure TfrmCadFotoCliente.FormActivate(Sender: TObject);
var DeviceList: TStringList;
    driverWeb : String;
    index: Integer;
begin

  if ( execActivate ) and ( not ( fgConsulta ) ) then
  begin

    try

      BloquearComponentes(true);
      Application.ProcessMessages;

      fVideoBitmap := TBitmap.create;
      fVideoImage  := TVideoImage.Create;

      fVideoImage.OnNewVideoFrame := OnNewVideoFrame;

      execActivate := false;

      DeviceList := TStringList.Create;
      fVideoImage.GetListOfDevices(DeviceList);

      if ( DeviceList.Count < 1 ) then
      begin

        MsgBox('"Prezado Cliente"'#13'Não foi encontrado nenhum dispositivo de captura de imagem', MB_OK+MB_ICONINFORMATION);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);

      end
      else
      begin

        for index := 0 to DeviceList.Count - 1 do
          cbbDispositivos.Items.Add(DeviceList.Strings[index]);

        if ( cbbDispositivos.Items.Count = 1 ) then
        begin

          Application.ProcessMessages;
          cbbDispositivos.Enabled   := false;
          cbbDispositivos.ItemIndex := 0;

          fVideoImage.VideoStart(cbbDispositivos.Text);
          pbFoto.Refresh;
          Running := True;

        end
        else
        begin

          BloquearComponentes(false);
          Application.ProcessMessages;

          driverWeb := GetIniValue('Webcam', 'DriverWeb');

          if ( Trim(driverWeb) <> '' ) then
          begin

            cbbDispositivos.ItemIndex := cbbDispositivos.Items.IndexOf(driverWeb);

            if ( cbbDispositivos.Text <> '' ) then
            begin
              fVideoImage.VideoStart(cbbDispositivos.Text);
              pbFoto.Refresh;
              Running := True;
            end;

          end;

        end;

      end;

    except
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao tentar se conectar na Webcam verifique se o dispositivo está instalado corretamente e funcionando.', MB_OK+MB_ICONERROR);
    end;

  end;

end;

procedure TfrmCadFotoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( not ( fgConsulta ) ) then
  begin

    if ( Running ) then
      fVideoImage.VideoStop;

    if ( Assigned(fVideoImage) ) then
      fVideoImage.Free;

    if ( Assigned(fVideoBitmap) ) then
      fVideoBitmap.Free;

  end;

end;

procedure TfrmCadFotoCliente.FormCreate(Sender: TObject);
begin

  execActivate := True;
  fgConsulta   := False;
  Running      := False;

end;

procedure TfrmCadFotoCliente.BloquearComponentes(Value: Boolean);
begin

  cbbDispositivos.Enabled := ( not ( Value ) ) and ( cbbDispositivos.Items.Count > 1 );
  btnCapturar.Enabled     := not ( Value );

  pnlAguarde.Visible := Value;

end;

end.
