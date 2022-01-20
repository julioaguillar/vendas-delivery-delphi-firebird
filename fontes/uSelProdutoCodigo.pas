unit uSelProdutoCodigo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DB, IBODataset;

type
  TfrmSelProdutoCodigo = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    gpbCodigoFabricante: TGroupBox;
    edtCodigo: TEdit;
    qryConsProduto: TIBOQuery;
    procedure btnRetornarClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelProdutoCodigo: TfrmSelProdutoCodigo;

implementation

uses udmPrincipal, uFuncoes, uSelProdutoCodigoVarios;

{$R *.dfm}

procedure TfrmSelProdutoCodigo.btnConfirmarClick(Sender: TObject);
var modal: TModalResult;
begin
  inherited;

  if ( Trim(edtCodigo.Text) <> '' ) then
  begin

    qryConsProduto.Close;
    qryConsProduto.ParamByName('CD_FABRICANTE').AsString := edtCodigo.Text;
    qryConsProduto.Open;

    if ( qryConsProduto.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Código do Fabricante não localizado no cadastro de Produto/Mercadoria. Verifique!', MB_OK+MB_ICONINFORMATION);
      edtCodigo.SetFocus;
    end
    else
    begin

      if ( qryConsProduto.RecordCount > 1 ) then
      begin

        frmSelProdutoCodigoVarios := TfrmSelProdutoCodigoVarios.Create(Self);
        modal := frmSelProdutoCodigoVarios.ShowModal;
        FreeAndNil(frmSelProdutoCodigoVarios);

        if ( modal = mrOk ) then
          ModalResult := mrOk;

      end
      else
        ModalResult := mrOk;

    end;

  end;

end;

procedure TfrmSelProdutoCodigo.btnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmSelProdutoCodigo.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_RETURN ) and ( edtCodigo.Text <> '' ) then
    btnConfirmarClick(btnConfirmar);

end;

end.
