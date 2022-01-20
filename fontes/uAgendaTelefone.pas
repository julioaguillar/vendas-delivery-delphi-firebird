unit uAgendaTelefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DBCtrls, Grids, DBGrids, StdCtrls, DB, IB_Components,
  IBODataset, StrUtils, Buttons;

type
  TAuxDBGrid = class(TDBGrid);

type
  TfrmAgendaTelefone = class(TfrmPadrao)
    gpbContatos: TGroupBox;
    gpbDados: TGroupBox;
    lblTelefoneResidencial: TLabel;
    lblTelefoneComercial: TLabel;
    lblCorreioEletronico: TLabel;
    lblListarTodos: TLabel;
    lblA: TLabel;
    lblB: TLabel;
    lblC: TLabel;
    lblD: TLabel;
    lblE: TLabel;
    lblF: TLabel;
    lblG: TLabel;
    lblH: TLabel;
    lblI: TLabel;
    lblJ: TLabel;
    lblL: TLabel;
    lblM: TLabel;
    lblN: TLabel;
    lblO: TLabel;
    lblP: TLabel;
    lblQ: TLabel;
    lblR: TLabel;
    lblS: TLabel;
    lblT: TLabel;
    lblU: TLabel;
    lblV: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    lblZ: TLabel;
    lblK: TLabel;
    lblW: TLabel;
    dbgContatos: TDBGrid;
    dbtTelefoneResidencial: TDBText;
    dbtTelefoneComerical: TDBText;
    dbtTelefoneCelular: TDBText;
    dbtCorreioEletronico: TDBText;
    lblTelefoneCelular: TLabel;
    lblAnotacoes: TLabel;
    dbmAnotacoes: TDBMemo;
    qryAgendaTelefone: TIBOQuery;
    trnsPadrao: TIBOTransaction;
    dtsAgendaTelefone: TDataSource;
    gpbBotoes: TGroupBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    ckbMostrarPacientes: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure lblListarTodosClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ckbMostrarPacientesClick(Sender: TObject);
    procedure qryAgendaTelefoneAfterScroll(DataSet: TDataSet);
    procedure qryAgendaTelefoneAfterOpen(DataSet: TDataSet);
  private
    procedure FiltrarContatos(Caption: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaTelefone: TfrmAgendaTelefone;

implementation

uses udmPrincipal, uCadAgendaTelefone, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmAgendaTelefone.FormCreate(Sender: TObject);
begin
  inherited;

  qryAgendaTelefone.Close;
  qryAgendaTelefone.ParamByName('FG_MOSTRARTODOS').AsString := 'SIM';
  qryAgendaTelefone.ParamByName('DS_CONTATOUPPER').AsString := '';
  qryAgendaTelefone.ParamByName('DS_CONTATOLOWER').AsString := '';
  qryAgendaTelefone.Open;

  btnIncluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnExcluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnAlterar.Enabled := ( not SISTEMA_BLOQUEADO );

end;

procedure TfrmAgendaTelefone.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryAgendaTelefone.IsEmpty ) ) and ( not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull ) ) then
  begin

    qryAgendaTelefone.Edit;

    frmCadAgendaTelefone := TfrmCadAgendaTelefone.Create(Self);
    frmCadAgendaTelefone.ShowModal;

    if ( frmCadAgendaTelefone.ModalResult = mrOk ) then
      qryAgendaTelefone.Refresh;

    FreeAndNil(frmCadAgendaTelefone);

  end;

end;

procedure TfrmAgendaTelefone.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryAgendaTelefone.IsEmpty ) ) and ( not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryAgendaTelefone.Delete;
      trnsPadrao.Commit;

    except
      on e: exception do
      begin
        trnsPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmAgendaTelefone.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryAgendaTelefone.Append;

  frmCadAgendaTelefone := TfrmCadAgendaTelefone.Create(Self);
  frmCadAgendaTelefone.ShowModal;

  if ( frmCadAgendaTelefone.ModalResult = mrOk ) then
    qryAgendaTelefone.Refresh;

  FreeAndNil(frmCadAgendaTelefone);

end;

procedure TfrmAgendaTelefone.ckbMostrarPacientesClick(Sender: TObject);
begin
  inherited;

  qryAgendaTelefone.Close;

  if ( ckbMostrarPacientes.Checked ) then
  begin
    qryAgendaTelefone.SQL[16] := 'UNION  ';
    qryAgendaTelefone.SQL[33] := '      )';
  end
  else
  begin
    qryAgendaTelefone.SQL[16] := '/*UNION  ';
    qryAgendaTelefone.SQL[33] := '      )*/';
  end;

  qryAgendaTelefone.Open;

end;

procedure TfrmAgendaTelefone.FiltrarContatos(Caption: String);
begin

  qryAgendaTelefone.Close;
  qryAgendaTelefone.ParamByName('FG_MOSTRARTODOS').AsString := IfThen(Caption = 'Listar todos', 'SIM', 'NAO');
  qryAgendaTelefone.ParamByName('DS_CONTATOUPPER').AsString := IfThen(Caption <> 'Listar todos', AnsiUpperCase(Caption));
  qryAgendaTelefone.ParamByName('DS_CONTATOLOWER').AsString := IfThen(Caption <> 'Listar todos', AnsiLowerCase(Caption));
  qryAgendaTelefone.Open;

end;

procedure TfrmAgendaTelefone.lblListarTodosClick(Sender: TObject);
begin
  inherited;

  FiltrarContatos( TLabel(Sender).Caption );

end;

procedure TfrmAgendaTelefone.qryAgendaTelefoneAfterOpen(DataSet: TDataSet);
begin
  inherited;

  btnExcluir.Enabled := not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull );
  btnAlterar.Enabled := not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull );

end;

procedure TfrmAgendaTelefone.qryAgendaTelefoneAfterScroll(DataSet: TDataSet);
begin
  inherited;

  btnExcluir.Enabled := not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull );
  btnAlterar.Enabled := not ( qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').IsNull );

end;

end.
