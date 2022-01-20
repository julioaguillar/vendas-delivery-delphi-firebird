unit uCadCategoriaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, Mask, DBCtrls, DBGrids, StrUtils;

type
  TfrmCadCategoriaProduto = class(TfrmCadPadrao)
    gpbNome: TGroupBox;
    dbeDescricao: TDBEdit;
    gpbProdutos: TGroupBox;
    dbgProdutos: TDBGrid;
    qryConsCategoria: TIBOQuery;
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
  frmCadCategoriaProduto: TfrmCadCategoriaProduto;

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadCategoriaProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not (qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeDescricao.SetFocus;

  end;

end;

procedure TfrmCadCategoriaProduto.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadCategoriaProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( qryCadPadrao.State = dsInsert ) then
  begin

    qryConsCategoria.Close;
    qryConsCategoria.ParamByName('DS_PRODUTOCATEGORIA').AsString := dbeDescricao.Text;
    qryConsCategoria.Open;

    if ( not ( qryConsCategoria.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Categoria já cadastrada!', MB_OK+MB_ICONINFORMATION);
      dbeDescricao.SetFocus;
      Abort;
    end;

  end;

  try

    if ( qryCadPadrao.State = dsInsert ) then
      qryCadPadrao.FieldByName('ID_PRODUTOCATEGORIA').AsInteger := 0;

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

procedure TfrmCadCategoriaProduto.btnExcluirClick(Sender: TObject);
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

procedure TfrmCadCategoriaProduto.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  dbeDescricao.SetFocus;

end;

procedure TfrmCadCategoriaProduto.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.Open;

end;

end.
