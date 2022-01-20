unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, jpeg, ComCtrls, ShellAPI, Buttons,
  pngimage;

type
  TfrmSobre = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Bevel2: TBevel;
    Bevel1: TBevel;
    imgSobre: TImage;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    lblVersaoSistema: TLabel;
    Label6: TLabel;
    lblAtualizacaoSistema: TLabel;
    GroupBox2: TGroupBox;
    lblLayOutBanco: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    lblAtualizacaoBanco: TLabel;
    GroupBox4: TGroupBox;
    lblSerial: TLabel;
    btnAlterar: TBitBtn;
    btnCopiarSerial: TSpeedButton;
    edtSerial: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCopiarSerialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uConstantes, uFuncoes, udmPrincipal, uCadSerial;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  inherited;

  lblVersaoSistema.Caption      := VERSAO_SISTEMA + ' - ' + BUILD_SISTEMA;
  lblAtualizacaoSistema.Caption := DATA_SISTEMA;

  lblLayOutBanco.Caption      := IntToStr( VERSAO_BANCO );
  lblAtualizacaoBanco.Caption := DATA_BANCO;

  lblSerial.Caption := fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString);

end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_BLOQUEADO ) then
    Caption := 'SISTEMA BLOQUEADO - ENTRE EM CONTATO';

  btnAlterar.Visible      := ( lblSerial.Visible ) and ( lblSerial.Caption <> '' );
  btnCopiarSerial.Visible := ( lblSerial.Visible ) and ( lblSerial.Caption <> '' );

end;

procedure TfrmSobre.btnAlterarClick(Sender: TObject);
begin
  inherited;

  frmCadSerial := TfrmCadSerial.Create(Self);
  frmCadSerial.ShowModal;

  if ( frmCadSerial.ModalResult = mrOk ) then
  begin

    dmPrincipal.qryConsSerial.Close;
    dmPrincipal.qryConsSerial.Open;

    lblSerial.Caption := fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString);

  end;

  FreeAndNil(frmCadSerial);

end;

procedure TfrmSobre.btnCopiarSerialClick(Sender: TObject);
begin
  inherited;

  edtSerial.Text := lblSerial.Caption;
  edtSerial.SelectAll;
  edtSerial.CopyToClipboard;

end;

end.
