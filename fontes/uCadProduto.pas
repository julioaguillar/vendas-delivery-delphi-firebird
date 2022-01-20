unit uCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, Mask, DBCtrls, DBGrids, StrUtils, ExtDlgs, jpeg;

type
  TfrmCadProduto = class(TfrmCadPadrao)
    gpbDescricao: TGroupBox;
    dbeNome: TDBEdit;
    gpbFabricante: TGroupBox;
    dbeFabricante: TDBEdit;
    gpbFornecedor: TGroupBox;
    qpbPrecoCompra: TGroupBox;
    dbePrecoCompra: TDBEdit;
    gpbPrecoVenda: TGroupBox;
    gpbProdutos: TGroupBox;
    dbgProdutos: TDBGrid;
    qryConsProduto: TIBOQuery;
    gpbCodigo: TGroupBox;
    dbeCodigo: TDBEdit;
    gpbCategoria: TGroupBox;
    gpbPrecoPrincipal: TGroupBox;
    dbePrecoVenda: TDBEdit;
    gpbPrecoMinimo: TGroupBox;
    dbePrecoMinimo: TDBEdit;
    gpbUnidade: TGroupBox;
    edtConsCodigo: TEdit;
    edtConsdescricao: TEdit;
    dblFornecedor: TDBLookupComboBox;
    dblCategoria: TDBLookupComboBox;
    dblUnidade: TDBLookupComboBox;
    qryConsFornecedor: TIBOQuery;
    qryConsCategoria: TIBOQuery;
    qryConsunidade: TIBOQuery;
    dtsConsFornecedor: TDataSource;
    dtsConsCategoria: TDataSource;
    dtsConsunidade: TDataSource;
    qryNumProdutos: TIBOQuery;
    gpbCodigoFabricante: TGroupBox;
    dbeCodigoFabricante: TDBEdit;
    edtConsCodigoFabricante: TEdit;
    btnConsCodFabricante: TSpeedButton;
    gpbFoto: TGroupBox;
    btnCapturarFotoArquivo: TSpeedButton;
    btnLimpar: TSpeedButton;
    dbiFotoProduto: TDBImage;
    OpenPictureDialog: TOpenPictureDialog;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtConsCodigoChange(Sender: TObject);
    procedure edtConsdescricaoChange(Sender: TObject);
    procedure dtsCadPadraoStateChange(Sender: TObject);
    procedure dblFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsCodFabricanteClick(Sender: TObject);
    procedure edtConsCodigoFabricanteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbiFotoProdutoDblClick(Sender: TObject);
    procedure btnCapturarFotoArquivoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }

    execFiltro: Boolean;
    procedure FiltrarProdutos;

  public
    { Public declarations }

    idProduto: Integer;

  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses udmPrincipal, uFuncoes, uConstantes, uSelProdutoCodigo, uCadFotoCliente;

{$R *.dfm}

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not (qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeNome.SetFocus;

  end;

end;

procedure TfrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadProduto.btnCapturarFotoArquivoClick(Sender: TObject);
var bmp: TBitmap;
    jpg: TJPEGImage;
begin
  inherited;

  if ( OpenPictureDialog.Execute(frmCadProduto.Handle) ) then
  begin

    bmp := TBitmap.Create;
    jpg := TJPegImage.Create;

    try

      try

        if ( FileExists(OpenPictureDialog.Files[0]) ) then
        begin

          jpg.LoadFromFile(OpenPictureDialog.Files[0]);
          bmp.Assign(jpg);

          qryCadPadrao.FieldByName('FT_PRODUTO').Assign(bmp);

        end;

      except
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao carregar a imagem!', MB_OK+MB_ICONERROR);
      end

    finally
      bmp.Free;
      jpg.Free;
    end;

  end;

end;

procedure TfrmCadProduto.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( qryCadPadrao.State = dsInsert ) then
  begin

    qryConsProduto.Close;
    qryConsProduto.ParamByName('CD_PRODUTO').AsString := dbeCodigo.Text;
    qryConsProduto.Open;

    if ( not ( qryConsProduto.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Produto já cadastrado!', MB_OK+MB_ICONINFORMATION);
      dbeNome.SetFocus;
      Abort;
    end;

  end;

  try

    if ( qryCadPadrao.State = dsInsert ) then
      qryCadPadrao.FieldByName('ID_PRODUTO').AsInteger := 0;

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

procedure TfrmCadProduto.btnConsCodFabricanteClick(Sender: TObject);
begin
  inherited;

  frmSelProdutoCodigo := TfrmSelProdutoCodigo.Create(Self);
  frmSelProdutoCodigo.ShowModal;

  if ( frmSelProdutoCodigo.ModalResult = mrOk ) then
  begin

    execFiltro := False;

    edtConsCodigo.Clear;
    edtConsCodigoFabricante.Clear;
    edtConsdescricao.Clear;

    execFiltro := True;

    qryCadPadrao.Close;
    qryCadPadrao.ParamByName('FG_PESQUISACODIGO').AsString     := 'NAO';
    qryCadPadrao.ParamByName('CD_PRODUTO').AsString            := '';
    qryCadPadrao.ParamByName('FG_PESQUISAFABRICANTE').AsString := 'NAO';
    qryCadPadrao.ParamByName('CD_FABRICANTE').AsString         := '';
    qryCadPadrao.ParamByName('FG_PESQUISADESCRICAO').AsString  := 'NAO';
    qryCadPadrao.ParamByName('DS_NOME').AsString               := '';
    qryCadPadrao.Open;

    qryCadPadrao.Locate('ID_PRODUTO', frmSelProdutoCodigo.qryConsProduto.FieldByName('ID_PRODUTO').AsInteger, []);
    ActiveControl := dbgProdutos;

  end;

  FreeAndNil(frmSelProdutoCodigo);

end;

procedure TfrmCadProduto.btnExcluirClick(Sender: TObject);
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

procedure TfrmCadProduto.btnIncluirClick(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_DEMOSTRATIVO ) then
  begin

    qryNumProdutos.Close;
    qryNumProdutos.Open;

    if ( not ( qryNumProdutos.IsEmpty ) and ( qryNumProdutos.FieldByName('NR_PRODUTO').AsInteger > 10 ) ) then
    begin

      MsgBox('"Prezado Cliente"'+#13+
             'Você já cadastrou a quantidade máxima de Produtos para o sistema "DEMOSTRATIVO".'+#13#13+
             'Acesse nosso site: "'+SITE_EMPRESA+'", ou envie um e-mail para "'+EMAIL_EMPRESA+'" solicitando a versão '+
             'completa do '+NOME_SISTEMA, MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

  end;

  edtConsCodigo.Clear;
  edtConsdescricao.Clear;

  qryCadPadrao.Append;
  dbeCodigo.SetFocus;

end;

procedure TfrmCadProduto.btnLimparClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.FieldByName('FT_PRODUTO').Clear;

end;

procedure TfrmCadProduto.dbiFotoProdutoDblClick(Sender: TObject);
begin
  inherited;

  if ( not qryCadPadrao.IsEmpty ) and ( not qryCadPadrao.FieldByName('FT_PRODUTO').IsNull ) then
  begin

    frmCadFotoCliente := TfrmCadFotoCliente.Create(Self);
    frmCadFotoCliente.Caption := 'Visualização Foto Produto/Mercadoria';

    frmCadFotoCliente.fgConsulta              := true;
    frmCadFotoCliente.btnCapturar.Enabled     := false;
    frmCadFotoCliente.cbbDispositivos.Enabled := false;
    frmCadFotoCliente.btnCapturar.Visible     := false;
    frmCadFotoCliente.cbbDispositivos.Visible := false;
    frmCadFotoCliente.gpbDispositivos.Visible := false;

    frmCadFotoCliente.pnlImagem.Top    := frmCadFotoCliente.btnCapturar.Top;
    frmCadFotoCliente.pnlImagem.Height := frmCadFotoCliente.pnlImagem.Height + 45;

    frmCadFotoCliente.pbFoto.Picture := dbiFotoProduto.Picture;

    frmCadFotoCliente.ShowModal;

    FreeAndNil(frmCadFotoCliente);

  end;

end;

procedure TfrmCadProduto.dblFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( ( Key = VK_DELETE ) or ( Key = VK_BACK ) ) and ( qryCadPadrao.State in [dsEdit,dsInsert] ) then
  begin
    dblFornecedor.KeyValue := Null;
    qryCadPadrao.FieldByName('CD_FORNECEDOR').Clear;
  end;

end;

procedure TfrmCadProduto.dblUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( ( Key = VK_DELETE ) or ( Key = VK_BACK ) ) and ( qryCadPadrao.State in [dsEdit,dsInsert] ) then
  begin
    dblUnidade.KeyValue := Null;
    qryCadPadrao.FieldByName('FG_UNIDADEMEDIDA').Clear;
  end;

end;

procedure TfrmCadProduto.dtsCadPadraoStateChange(Sender: TObject);
begin
  inherited;

  edtConsCodigo.Enabled    := ( not ( qryCadPadrao.State in [dsInsert,dsEdit] ) );
  edtConsdescricao.Enabled := ( not ( qryCadPadrao.State in [dsInsert,dsEdit] ) );

  btnCapturarFotoArquivo.Enabled := qryCadPadrao.State in [dsInsert, dsEdit];
  btnLimpar.Enabled              := btnCapturarFotoArquivo.Enabled;

end;

procedure TfrmCadProduto.edtConsCodigoChange(Sender: TObject);
begin
  inherited;

  FiltrarProdutos;

end;

procedure TfrmCadProduto.edtConsCodigoFabricanteChange(Sender: TObject);
begin
  inherited;

  FiltrarProdutos;

end;

procedure TfrmCadProduto.edtConsdescricaoChange(Sender: TObject);
begin
  inherited;

  FiltrarProdutos;

end;

procedure TfrmCadProduto.FiltrarProdutos;
begin

  if ( execFiltro ) then
  begin

    qryCadPadrao.Close;
    qryCadPadrao.ParamByName('FG_PESQUISACODIGO').AsString     := IfThen(edtConsCodigo.Text <> '', 'SIM', 'NAO');
    qryCadPadrao.ParamByName('CD_PRODUTO').AsString            := edtConsCodigo.Text;
    qryCadPadrao.ParamByName('FG_PESQUISAFABRICANTE').AsString := IfThen(edtConsCodigoFabricante.Text <> '', 'SIM', 'NAO');
    qryCadPadrao.ParamByName('CD_FABRICANTE').AsString         := edtConsCodigoFabricante.Text;
    qryCadPadrao.ParamByName('FG_PESQUISADESCRICAO').AsString  := IfThen(edtConsdescricao.Text <> '', 'SIM', 'NAO');
    qryCadPadrao.ParamByName('DS_NOME').AsString               := edtConsdescricao.Text;
    qryCadPadrao.Open;

  end;

end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;

  idProduto  := 0;
  execFiltro := True;

  if (GBL_USUARIO.FG_ADMINISTRADOR <> 'SIM') then
  begin
    dbePrecoVenda.Tag  := 1;
    dbePrecoMinimo.Tag := 1;
  end;

  FiltrarProdutos;

  qryConsFornecedor.Close;
  qryConsFornecedor.Open;

  qryConsCategoria.Close;
  qryConsCategoria.Open;

  qryConsunidade.Close;
  qryConsunidade.Open;

end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;

  if ( idProduto > 0 ) then
  begin
    qryCadPadrao.Locate('ID_PRODUTO', idProduto, []);
    idProduto := 0;
    dbgProdutos.SetFocus;
  end;

end;

end.
