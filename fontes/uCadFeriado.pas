unit uCadFeriado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, Mask, DBCtrls, DBGrids;

type
  TfrmCadFeriado = class(TfrmCadPadrao)
    gpbDescricao: TGroupBox;
    gpbDia: TGroupBox;
    gpbMes: TGroupBox;
    cbbDia: TComboBox;
    cbbMes: TComboBox;
    dbeDescricao: TDBEdit;
    gpbFeriados: TGroupBox;
    dbgFeriados: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryCadPadraoAfterScroll(DataSet: TDataSet);
    procedure dbgFeriadosTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFeriado: TfrmCadFeriado;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadFeriado.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    ActiveControl := dbeDescricao;

  end;

end;

procedure TfrmCadFeriado.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadFeriado.btnConfirmarClick(Sender: TObject);
var data: String;
begin
  inherited;

  try

    data := FormatFloat('00', StrToInt(cbbDia.Text));
    data := data + '/' + FormatFloat('00', cbbMes.ItemIndex+1);
    data := data + '/' + FormatDateTime('yyyy', Now);

    StrToDate(data);

  except
    MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
    cbbDia.SetFocus;
    Abort;
  end;

  try

    if ( qryCadPadrao.State = dsInsert ) then
      qryCadPadrao.FieldByName('ID_FERIADO').AsInteger := 0;

    qryCadPadrao.FieldByName('DT_DIAFERIADO').AsInteger := StrToInt( cbbDia.Text );
    qryCadPadrao.FieldByName('DT_MESFERIADO').AsInteger := cbbMes.ItemIndex + 1;

    qryCadPadrao.Post;
    trnsCadPadrao.Commit;

    qryCadPadrao.Refresh;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadFeriado.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryCadPadrao.Delete;
      trnsCadPadrao.Commit;

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmCadFeriado.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  ActiveControl := dbeDescricao;

end;

procedure TfrmCadFeriado.dbgFeriadosTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgFeriados, Column, 'CAD_FERIADO');

end;

procedure TfrmCadFeriado.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.Open;

end;

procedure TfrmCadFeriado.qryCadPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  cbbDia.ItemIndex := cbbDia.Items.IndexOf( qryCadPadrao.FieldByName('DT_DIAFERIADO').AsString );
  cbbMes.ItemIndex := qryCadPadrao.FieldByName('DT_MESFERIADO').AsInteger - 1;

end;

end.
