unit uCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DB, IBODataset, IB_Components, Grids,
  ValEdit, DBCtrls, Mask, DBGrids, Menus;

type
  TfrmCadPadrao = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnConsultar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    trnsCadPadrao: TIB_Transaction;
    qryCadPadrao: TIBOQuery;
    dtsCadPadrao: TDataSource;
    CamposObrigatorios: TValueListEditor;
    procedure dtsCadPadraoStateChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure HabilitarComponentes(Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

uses uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmCadPadrao.HabilitarComponentes(Value: Boolean);
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
      else if ( Self.Components[index] is TRadioButton ) then
        TRadioButton(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBEdit ) then
        TDBEdit(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBComboBox ) then
        TDBComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBLookupComboBox ) then
        TDBLookupComboBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBCheckBox ) then
        TDBCheckBox(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBRadioGroup ) then
        TDBRadioGroup(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBMemo ) then
        TDBMemo(Self.Components[index]).Enabled := Value
      else if ( Self.Components[index] is TDBGrid ) then
        TDBGrid(Self.Components[index]).Enabled := not ( Value );

    end;

  end;

end;

procedure TfrmCadPadrao.btnAlterarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPadrao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPadrao.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

end;

procedure TfrmCadPadrao.btnConsultarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPadrao.btnExcluirClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPadrao.btnIncluirClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPadrao.dtsCadPadraoStateChange(Sender: TObject);
begin
  inherited;

  if ( btnIncluir.Tag = 0 ) then
    btnIncluir.Enabled := ( not ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] ) ) and ( not (SISTEMA_BLOQUEADO) );

  if ( btnExcluir.Tag = 0 ) then
    btnExcluir.Enabled := ( not ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] ) ) and ( not (SISTEMA_BLOQUEADO) );

  if ( btnAlterar.Tag = 0 ) then
    btnAlterar.Enabled := ( not ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] ) ) and ( not (SISTEMA_BLOQUEADO) );

  if ( btnConsultar.Tag = 0 ) then
    btnConsultar.Enabled := not ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] );

  if ( btnConfirmar.Tag = 0 ) then
    btnConfirmar.Enabled := ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] );

  if ( btnCancelar.Tag = 0 ) then
    btnCancelar.Enabled := ( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] );

  HabilitarComponentes( dtsCadPadrao.DataSet.State in [dsInsert,dsEdit] );

end;

procedure TfrmCadPadrao.FormCreate(Sender: TObject);
begin
  inherited;

  btnIncluir.Enabled := ( not ( SISTEMA_BLOQUEADO ) );
  btnExcluir.Enabled := ( not ( SISTEMA_BLOQUEADO ) );
  btnAlterar.Enabled := ( not ( SISTEMA_BLOQUEADO ) );

end;

end.
