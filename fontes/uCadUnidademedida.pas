unit uCadUnidademedida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, Mask, DBCtrls, DBGrids, StrUtils;

type
  TfrmCadUnidademedida = class(TfrmCadPadrao)
    gpbNome: TGroupBox;
    dbeDescricao: TDBEdit;
    gpbProdutos: TGroupBox;
    dbgProdutos: TDBGrid;
    qryConsUnidade: TIBOQuery;
    GroupBox1: TGroupBox;
    dbeUnidade: TDBEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidademedida: TfrmCadUnidademedida;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadUnidademedida.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not (qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeUnidade.SetFocus;

  end;

end;

procedure TfrmCadUnidademedida.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadUnidademedida.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( qryCadPadrao.State = dsInsert ) then
  begin

    qryConsUnidade.Close;
    qryConsUnidade.ParamByName('FG_UNIDADEMEDIDA').AsString := dbeUnidade.Text;
    qryConsUnidade.Open;

    if ( not ( qryConsUnidade.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Unidade de Medida já cadastrada!', MB_OK+MB_ICONINFORMATION);
      dbeDescricao.SetFocus;
      Abort;
    end;

  end;

  try

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

procedure TfrmCadUnidademedida.btnExcluirClick(Sender: TObject);
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

procedure TfrmCadUnidademedida.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  dbeUnidade.SetFocus;

end;

procedure TfrmCadUnidademedida.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.Open;

end;

end.
