unit uImpPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, ValEdit, StdCtrls, Buttons, frxExportXLS,
  frxExportMail, frxClass, frxExportPDF, frxDBSet, DB, IBODataset;

type
  TfrmImpPedido = class(TfrmPadrao)
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxMailExport: TfrxMailExport;
    frxXLSExport: TfrxXLSExport;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    CamposObrigatorios: TValueListEditor;
    frxDBEmpresa: TfrxDBDataset;
    gpbDataFim: TGroupBox;
    qryEmpresa: TIBOQuery;
    frxDBPedido: TfrxDBDataset;
    qryLctPedido: TIBOQuery;
    frxDBPedidoItem: TfrxDBDataset;
    qryLctPedidoItem: TIBOQuery;
    edtNumPedido: TEdit;
    edtIdPedido: TEdit;
    qryConsPedido: TIBOQuery;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNumPedidoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpPedido: TfrmImpPedido;

implementation

uses udmPrincipal, uFuncoes, uConsLctPedido;

{$R *.dfm}

procedure TfrmImpPedido.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  qryLctPedido.Close;
  qryLctPedido.ParamByName('ID_PEDIDO').AsInteger := StrToIntDef(edtIdPedido.Text, 0);
  qryLctPedido.Open;

  if ( not qryLctPedido.IsEmpty ) then
  begin

    qryEmpresa.Close;
    qryEmpresa.Open;

    qryLctPedidoItem.Close;
    qryLctPedidoItem.ParamByName('ID_PEDIDO').AsInteger := StrToIntDef(edtIdPedido.Text, 0);
    qryLctPedidoItem.Open;

    //(frxReport.FindObject('ftEntrada') as TfrxFooter).Visible     := not (qryEntradas.IsEmpty);
    //frxReport.Variables['PeriodoInicio'] := QuotedStr( edtPeriodoInicio.Text );

    if ( frxReport.PrepareReport ) then
      frxReport.ShowPreparedReport;

  end
  else
    MsgBox('"Prezado Cliente"'#13'Pedido não localizado. Verifique!', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmImpPedido.edtNumPedidoExit(Sender: TObject);
begin
  inherited;

  if ( edtNumPedido.Text <> '' ) then
  begin

    try
      edtNumPedido.Text := FormatFloat('000000', StrToInt(edtNumPedido.Text));
    except
      MsgBox('"Prezado Cliente"'#13'Código inválido!', MB_OK+MB_ICONINFORMATION);
      edtNumPedido.SetFocus;
      Abort;
    end;

    qryConsPedido.Close;
    qryConsPedido.ParamByName('NR_PEDIDO').AsString := edtNumPedido.Text;
    qryConsPedido.Open;

    if ( qryConsPedido.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Pedido não localizado.', MB_OK+MB_ICONINFORMATION);
      edtNumPedido.SetFocus;
      Abort;
    end
    else
    begin
      edtNumPedido.Text := qryConsPedido.FieldByName('NR_PEDIDO').AsString;
      edtIdPedido.Text  := qryConsPedido.FieldByName('ID_PEDIDO').AsString;
    end;

  end
  else
    edtIdPedido.Clear;

end;

procedure TfrmImpPedido.edtNumPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_F9 ) then
  begin

    frmConsLctPedido := TfrmConsLctPedido.Create(Self);
    frmConsLctPedido.ShowModal;

    if ( frmConsLctPedido.ModalResult = mrOk ) and ( not frmConsLctPedido.qryLancamentoPedido.IsEmpty ) then
    begin
      edtNumPedido.Text := frmConsLctPedido.qryLancamentoPedido.FieldByName('NR_PEDIDO').AsString;
      edtIdPedido.Text  := frmConsLctPedido.qryLancamentoPedido.FieldByName('ID_PEDIDO').AsString;
    end;

    FreeAndNil(frmConsLctPedido);

  end;

end;

procedure TfrmImpPedido.edtNumPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not ( Key in ['0'..'9', Chr(8)] ) then
    Key := #0;

end;

end.
