unit uCadParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DBCtrls, StdCtrls, Mask, Buttons, DB, IBODataset,
  IB_Components, Grids, ValEdit, DBGrids, ExtDlgs, Clipbrd, AonProcessBar;

type
  TfrmCadParametros = class(TfrmPadrao)
    gpbTelefone: TGroupBox;
    gpbHomePage: TGroupBox;
    gpbBotoes: TGroupBox;
    btnAlterar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    trnsPadrao: TIB_Transaction;
    qryParametros: TIBOQuery;
    dtsParametros: TDataSource;
    dbeMensagem: TDBEdit;
    cbbImprimirCupom: TComboBox;
    gpbQuantidadeVias: TGroupBox;
    cbbQuantidadeVias: TComboBox;
    gpbVisualizarImpressao: TGroupBox;
    cbbVisualizarImpressao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    procedure HabilitarComponentes(Value: Boolean);

  public
    { Public declarations }
  end;

var
  frmCadParametros: TfrmCadParametros;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadParametros.HabilitarComponentes(Value: Boolean);
var index: Integer;
begin

  for index := 0 to Self.ComponentCount-1 do
  begin

    if ( Self.Components[index].Tag = 0 ) then
    begin

      if ( Self.Components[index] is TEdit ) then
        TEdit(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TMemo ) then
        TMemo(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TComboBox ) then
        TComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TCheckBox ) then
        TCheckBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBEdit ) then
        TDBEdit(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBComboBox ) then
        TDBComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBLookupComboBox ) then
        TDBLookupComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBCheckBox ) then
        TDBCheckBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBMemo ) then
        TDBMemo(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBGrid ) then
        TDBGrid(Self.Components[index]).Enabled := not ( Value );

    end;

  end;

  btnAlterar.Enabled   := not ( Value );
  btnConfirmar.Enabled := Value;
  btnCancelar.Enabled  := Value;

end;

procedure TfrmCadParametros.btnAlterarClick(Sender: TObject);
begin
  inherited;

  qryParametros.Edit;

  HabilitarComponentes(true);
  cbbImprimirCupom.SetFocus;

end;

procedure TfrmCadParametros.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryParametros.Cancel;
  HabilitarComponentes(false);

end;

procedure TfrmCadParametros.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    SetIniValue('Parametros', 'ImprimirCupom', cbbImprimirCupom.Text);
    SetIniValue('Parametros', 'QuantidadeVias', cbbQuantidadeVias.Text);
    SetIniValue('Parametros', 'VisualizarImpressao', cbbVisualizarImpressao.Text);

    qryParametros.Post;
    trnsPadrao.Commit;

    HabilitarComponentes(false);

  except
    on e: exception do
    begin
      trnsPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na alteração do registro com a seguinte mensagem:'+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadParametros.FormCreate(Sender: TObject);
var ImprimirCupom, QuantidadeVias, VisualizarImpressao: String;
begin
  inherited;

  qryParametros.Close;
  qryParametros.Open;

  ImprimirCupom := GetIniValue('Parametros', 'ImprimirCupom');
  if ( ImprimirCupom <> 'NAO' ) then
    cbbImprimirCupom.ItemIndex := cbbImprimirCupom.Items.IndexOf('SIM')
  else
    cbbImprimirCupom.ItemIndex := cbbImprimirCupom.Items.IndexOf('NAO');

  QuantidadeVias := GetIniValue('Parametros', 'QuantidadeVias');
  if ( QuantidadeVias = '2' ) then
    cbbQuantidadeVias.ItemIndex := cbbQuantidadeVias.Items.IndexOf('2')
  else
    cbbQuantidadeVias.ItemIndex := cbbQuantidadeVias.Items.IndexOf('1');

  VisualizarImpressao := GetIniValue('Parametros', 'VisualizarImpressao');
  if ( VisualizarImpressao = 'SIM' ) then
    cbbVisualizarImpressao.ItemIndex := cbbVisualizarImpressao.Items.IndexOf('SIM')
  else
    cbbVisualizarImpressao.ItemIndex := cbbVisualizarImpressao.Items.IndexOf('NAO');

end;

end.
