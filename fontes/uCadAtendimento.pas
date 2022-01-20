unit uCadAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, DBClient, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,
  Math, IBODataset, DBCtrls, DateUtils, Buttons, Mask, IB_Components, pngimage;

type
  TfrmCadAtendimento = class(TfrmPadrao)
    Calendario: TMonthCalendar;
    gpbProfissionais: TGroupBox;
    gpbDiasAtendimento: TGroupBox;
    dbgAtendimentoSemana: TDBGrid;
    lblManha: TLabel;
    lblTarde: TLabel;
    gpbAtendimentos: TGroupBox;
    dbgAgenda: TDBGrid;
    lblMadrugada: TLabel;
    lblNoite: TLabel;
    qryConsProfissionais: TIBOQuery;
    dtsConsProfissionais: TDataSource;
    dblProfissionais: TDBLookupComboBox;
    dtsConsAgenda: TDataSource;
    qryConsAtendimento: TIBOQuery;
    qryConsAtendimentoSemana: TIBOQuery;
    dtsConsAgendaSemana: TDataSource;
    imgAtendimento: TImage;
    gpbBusca: TGroupBox;
    btnProximoHorarioVago: TSpeedButton;
    qryBuscaHorarioVago: TIBOQuery;
    gpbHoraVaga: TGroupBox;
    edtHora: TMaskEdit;
    btnProximoDia: TSpeedButton;
    qryBuscaDiaVago: TIBOQuery;
    qryValidaHoraAtendimento: TIBOQuery;
    lblMensagemHorario: TLabel;
    Timer: TTimer;
    qryExcluirAtendimento: TIBOQuery;
    trnsPadrao: TIBOTransaction;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    qryAlteraStatus: TIBOQuery;
    btnCadastroCliente: TSpeedButton;
    qryConsCliente: TIBOQuery;
    btnImprimir: TBitBtn;
    pnlAnotacoes: TPanel;
    dbmAnotacoes: TDBMemo;
    GroupBox1: TGroupBox;
    imgAgendado: TImage;
    imgConfirmado: TImage;
    imgDesmarcou: TImage;
    imgFaltou: TImage;
    imgConcluido: TImage;
    lblAgendado: TLabel;
    lblConfirmado: TLabel;
    lblFaltou: TLabel;
    lblDesmarcou: TLabel;
    lblConcluido: TLabel;
    qryHoraServidor: TIBOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    btnBuscarCliente: TSpeedButton;
    qryConsAtendimentoCliente: TIBOQuery;
    procedure FormCreate(Sender: TObject);
    procedure dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dblProfissionaisClick(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure dbgAtendimentoSemanaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnProximoHorarioVagoClick(Sender: TObject);
    procedure btnProximoDiaClick(Sender: TObject);
    procedure edtHoraExit(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure dbgAgendaDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCadastroClienteClick(Sender: TObject);
    procedure qryConsAtendimentoAfterRefresh(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure lblAgendadoClick(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
  private
    { Private declarations }

    procedure AtualizaAgenda;

  public
    { Public declarations }
  end;

var
  frmCadAtendimento: TfrmCadAtendimento;

implementation

uses udmPrincipal, uConstantes, uFuncoes, uCadAtendimentoItem, uCadCliente,
  uImpAtendimentos, uConsClienteAtendimento;

{$R *.dfm}

procedure TfrmCadAtendimento.AtualizaAgenda;
var diasInc, diasDec: Integer;
begin

  if ( dblProfissionais.Text <> '' ) then
  begin

    qryConsAtendimento.Close;

    if ( qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger > 0 ) then
    begin
      qryConsAtendimento.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
      qryConsAtendimento.ParamByName('P_IN_ID_DIASEMANA').AsInteger    := DayOfWeek( Calendario.Date );
      qryConsAtendimento.ParamByName('P_IN_DT_REFERENCIA').AsDate      := Calendario.Date;
      qryConsAtendimento.Open;
    end;

    qryConsAtendimentoSemana.Close;

    if ( qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger > 0 ) then
    begin

      diasDec := DayOfWeek( Calendario.Date ) - 1;
      diasDec := ( diasDec  * ( -1 ) );

      diasInc := 7 - DayOfWeek( Calendario.Date );

      qryConsAtendimentoSemana.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger  := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
      qryConsAtendimentoSemana.ParamByName('P_IN_DT_REFERENCIAINICIO').AsDate := IncDay(Calendario.Date, diasDec);
      qryConsAtendimentoSemana.ParamByName('P_IN_DT_REFERENCIAFIM').AsDate    := IncDay(Calendario.Date, diasInc);
      qryConsAtendimentoSemana.Open;

      ShowScrollBar(dbgAtendimentoSemana.Handle, SB_HORZ, false);
      ShowScrollBar(dbgAtendimentoSemana.Handle, SB_VERT, false);

    end;

  end;

end;

procedure TfrmCadAtendimento.btnProximoHorarioVagoClick(Sender: TObject);
var hrLocate: TTime;
    dtInicio: TDate;
    diaVago, horaVago: String;
begin
  inherited;

  if ( not ( qryConsProfissionais.IsEmpty ) ) and ( dblProfissionais.Text <> '' ) then
  begin

    dtInicio := Calendario.Date;

    while true do
    begin

      qryBuscaHorarioVago.Close;
      qryBuscaHorarioVago.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
      qryBuscaHorarioVago.ParamByName('P_IN_ID_DIASEMANA').AsInteger    := DayOfWeek( dtInicio );
      qryBuscaHorarioVago.ParamByName('P_IN_DT_REFERENCIA').AsDate      := dtInicio;
      qryBuscaHorarioVago.Open;

      if ( qryBuscaHorarioVago.IsEmpty ) then
        dtInicio := IncDay(dtInicio)
      else
      begin
        diaVago  := FormatDateTime('dd/mm/yyyy', dtInicio);
        horaVago := FormatDateTime('hh:mm', qryBuscaHorarioVago.FieldByName('P_OU_HR_HORARIO').AsDateTime);
        Break;
      end;

    end;

    if ( MsgBox(self.Handle, 'Proximo horário vago: '+diaVago+' - '+horaVago+#13#13+'Deseja ir para o horário?', MB_YESNO+MB_ICONINFORMATION) = IDYES ) then
    begin

      Calendario.Date := StrToDate(diaVago);
      CalendarioClick(Calendario);

      hrLocate := StrToTime(horaVago);
      qryConsAtendimento.Locate('P_OU_HR_HORARIO', hrLocate, []);

      ActiveControl := dbgAgenda;

    end;

  end;

end;

procedure TfrmCadAtendimento.CalendarioClick(Sender: TObject);
begin
  inherited;

  AtualizaAgenda;

end;

procedure TfrmCadAtendimento.dbgAgendaDblClick(Sender: TObject);
begin
  inherited;

  if ( dblProfissionais.Text <> '' ) then
  begin

    frmCadAtendimentoItem := TfrmCadAtendimentoItem.Create(Self);

    frmCadAtendimentoItem.lblDescProfissional.Caption := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsString + ' - ' +
                                                  qryConsProfissionais.FieldByName('DS_NOME').AsString;

    frmCadAtendimentoItem.edtData.Date   := Calendario.Date;
    frmCadAtendimentoItem.edtHora.Text   := FormatDateTime('hh:mm', qryConsAtendimento.FieldByName('P_OU_HR_HORARIO').AsDateTime);
    frmCadAtendimentoItem.cdProfissional := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;

    frmCadAtendimentoItem.cbbStatus.ItemIndex := 0;

    frmCadAtendimentoItem.qryCadAtendimento.Close;
    frmCadAtendimentoItem.qryCadAtendimento.ParamByName('ID_ATENDIMENTO').AsInteger := qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger;
    frmCadAtendimentoItem.qryCadAtendimento.Open;

    if ( not ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').IsNull ) ) and ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger > 0 ) then
    begin

      frmCadAtendimentoItem.qryCadAtendimento.Edit;

      frmCadAtendimentoItem.idConsulta         := qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger;
      frmCadAtendimentoItem.edtCodCliente.Text := qryConsAtendimento.FieldByName('P_OU_CD_CLIENTE').AsString;

      qryConsCliente.Close;
      qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := qryConsAtendimento.FieldByName('P_OU_CD_CLIENTE').AsInteger;
      qryConsCliente.Open;

      frmCadAtendimentoItem.edtNomeCliente.Text := qryConsAtendimento.FieldByName('P_OU_DS_NOME').AsString;

      if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'A' ) then
        frmCadAtendimentoItem.cbbStatus.ItemIndex  := frmCadAtendimentoItem.cbbStatus.Items.IndexOf('Agendado')
      else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'O' ) then
        frmCadAtendimentoItem.cbbStatus.ItemIndex  := frmCadAtendimentoItem.cbbStatus.Items.IndexOf('Confirmado')
      else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'F' ) then
        frmCadAtendimentoItem.cbbStatus.ItemIndex  := frmCadAtendimentoItem.cbbStatus.Items.IndexOf('Faltou')
      else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'D' ) then
        frmCadAtendimentoItem.cbbStatus.ItemIndex  := frmCadAtendimentoItem.cbbStatus.Items.IndexOf('Desmarcou')
      else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'C' ) then
        frmCadAtendimentoItem.cbbStatus.ItemIndex  := frmCadAtendimentoItem.cbbStatus.Items.IndexOf('Concluido');

      frmCadAtendimentoItem.edtData.Date := qryConsAtendimento.FieldByName('P_OU_DT_ATENDIMENTO').AsDateTime;
      frmCadAtendimentoItem.edtHora.Text := FormatDateTime('hh:mm', qryConsAtendimento.FieldByName('P_OU_HR_ATENDIMENTO').AsDateTime);

    end
    else
      frmCadAtendimentoItem.qryCadAtendimento.Append;

    frmCadAtendimentoItem.ShowModal;

    if ( frmCadAtendimentoItem.ModalResult = mrOk ) then
      qryConsAtendimento.Refresh;

    FreeAndNil(frmCadAtendimentoItem);

    ActiveControl := dbgAgenda;

  end
  else
    MsgBox(self.Handle, '"Prezado Cliente'#13'Selecione um profissional para inserir um registro', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmCadAtendimento.dbgAgendaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var Picture: TPicture;
    AlignPicture: Integer;
begin
  inherited;

  if ( not ( qryConsAtendimento.IsEmpty ) ) then
  begin

    if ( Column.FieldName <> 'P_OU_HR_HORARIO' ) then
    begin

      if ( qryConsAtendimento.RecNo mod 2 ) <> 0 then
        dbgAgenda.Canvas.Brush.Color := $00FFF5EC
      else
        dbgAgenda.Canvas.Brush.Color := clWhite;

      dbgAgenda.Canvas.Font.Color := clBlack;
      dbgAgenda.DefaultDrawDataCell(Rect, dbgAgenda.Columns[DataCol].Field, State);

    end;

    if ( Column.FieldName = 'P_OU_FG_STATUS' ) then
    begin

      try

        dbgAgenda.Canvas.FillRect(Rect);

        Picture := TPicture.Create;

        if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'A' ) then
          Picture.Assign(imgAgendado.Picture)
        else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'O' ) then
          Picture.Assign(imgConfirmado.Picture)
        else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'F' ) then
          Picture.Assign(imgFaltou.Picture)
        else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'D' ) then
          Picture.Assign(imgDesmarcou.Picture)
        else if ( qryConsAtendimento.FieldByName('P_OU_FG_STATUS').AsString = 'C' ) then
          Picture.Assign(imgConcluido.Picture);

        AlignPicture := Trunc((Column.Width - Picture.Width) / 2);
        dbgAgenda.Canvas.Draw(Rect.Left + AlignPicture, Rect.Top, Picture.Graphic);

      finally
        Picture.Free;
      end;

    end;

  end;

end;

procedure TfrmCadAtendimento.dbgAtendimentoSemanaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var AlignPicture : Integer;
begin
  inherited;

  if ( not ( qryConsAtendimentoSemana.IsEmpty ) ) then
  begin

    if ( ( Column.FieldName = 'P_OU_FG_DOMINGO' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_DOMINGO').AsInteger = 1 ) ) or
       ( ( Column.FieldName = 'P_OU_FG_SEGUNDA' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_SEGUNDA').AsInteger = 1 ) ) or
       ( ( Column.FieldName = 'P_OU_FG_TERCA' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_TERCA').AsInteger = 1 ) ) or
       ( ( Column.FieldName = 'P_OU_FG_QUARTA' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_QUARTA').AsInteger = 1 ) ) or
       ( ( Column.FieldName = 'P_OU_FG_QUINTA' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_QUINTA').AsInteger = 1 ) ) or
       ( ( ( Column.FieldName = 'P_OU_FG_SEXTA' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_SEXTA').AsInteger = 1 ) ) ) or
       ( ( Column.FieldName = 'P_OU_FG_SABADO' ) and ( qryConsAtendimentoSemana.FieldByName('P_OU_FG_SABADO').AsInteger = 1 ) ) then
    begin
      dbgAtendimentoSemana.Canvas.FillRect(Rect);
      AlignPicture := Trunc((Column.Width - imgAtendimento.Picture.Width) / 2);
      dbgAtendimentoSemana.Canvas.Draw(Rect.Left + AlignPicture, Rect.Top + 3, imgAtendimento.Picture.Graphic);
    end;

  end;

end;

procedure TfrmCadAtendimento.dblProfissionaisClick(Sender: TObject);
begin
  inherited;

  AtualizaAgenda;

end;

procedure TfrmCadAtendimento.edtHoraExit(Sender: TObject);
begin
  inherited;

  if ( edtHora.Text <> '  :  ' ) then
  begin

    try

      edtHora.Text := FormatDateTime('hh:mm', StrToTime(edtHora.Text));

    except
      MsgBox(self.Handle, '"Prezado Cliente"'+#13+'Hora inválida!', MB_OK+MB_ICONERROR);
      edtHora.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadAtendimento.FormCreate(Sender: TObject);
begin
  inherited;

  Calendario.Date := Date;

  qryConsProfissionais.Close;
  qryConsProfissionais.Open;

  if ( qryConsProfissionais.RecordCount = 1 ) then
  begin
    dblProfissionais.KeyValue := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').Value;
    dblProfissionaisClick(dblProfissionais);
  end;

  btnIncluir.Enabled := ( not (SISTEMA_BLOQUEADO) );
  btnExcluir.Enabled := ( not (SISTEMA_BLOQUEADO) );
  btnAlterar.Enabled := ( not (SISTEMA_BLOQUEADO) );

  if ( SISTEMA_BLOQUEADO ) then
    dbgAgenda.OnDblClick := nil;

end;

procedure TfrmCadAtendimento.lblAgendadoClick(Sender: TObject);
var status: String;
begin
  inherited;

  if ( not ( qryConsAtendimento.IsEmpty ) ) and ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger > 0 ) then
  begin

    try

      if ( ( Sender is TLabel ) and ( TLabel(Sender).Name = 'lblAgendado' ) or
           ( Sender is TImage ) and ( TImage(Sender).Name = 'imgAgendado' ) ) then
        status := 'A'
      else if ( ( Sender is TLabel ) and ( TLabel(Sender).Name = 'lblConfirmado' ) or
                ( Sender is TImage ) and ( TImage(Sender).Name = 'imgConfirmado' ) ) then
        status := 'O'
      else if ( ( Sender is TLabel ) and ( TLabel(Sender).Name = 'lblFaltou' ) or
                ( Sender is TImage ) and ( TImage(Sender).Name = 'imgFaltou' ) ) then
        status := 'F'
      else if ( ( Sender is TLabel ) and ( TLabel(Sender).Name = 'lblDesmarcou' ) or
                ( Sender is TImage ) and ( TImage(Sender).Name = 'imgDesmarcou' ) ) then
        status := 'D'
      else if ( ( Sender is TLabel ) and ( TLabel(Sender).Name = 'lblConcluido' ) or
                ( Sender is TImage ) and ( TImage(Sender).Name = 'imgConcluido' ) ) then
        status := 'C';

      qryAlteraStatus.Close;
      qryAlteraStatus.ParamByName('ID_ATENDIMENTO').AsInteger := qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger;
      qryAlteraStatus.ParamByName('FG_STATUS').AsString    := status;
      qryAlteraStatus.ExecSQL;

      trnsPadrao.Commit;

      qryConsAtendimento.Refresh;

    except
      on e: Exception do
      begin
        trnsPadrao.Rollback;
        MsgBox(self.Handle, '"Prezado Cliente"'+#13+'Ocorreu um erro na alteração do status com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmCadAtendimento.qryConsAtendimentoAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  if ( qryConsAtendimentoSemana.Active ) then
    qryConsAtendimentoSemana.Refresh;

end;

procedure TfrmCadAtendimento.btnCadastroClienteClick(Sender: TObject);
begin
  inherited;

  frmCadCliente := TfrmCadCliente.Create(Self);

  if ( qryConsAtendimento.Active ) and ( qryConsAtendimento.FieldByName('P_OU_CD_CLIENTE').AsInteger > 0 ) then
    frmCadCliente.CarregaCliente(qryConsAtendimento.FieldByName('P_OU_CD_CLIENTE').AsInteger);

  frmCadCliente.ShowModal;
  FreeAndNil(frmCadCliente);

end;

procedure TfrmCadAtendimento.TimerTimer(Sender: TObject);
begin
  inherited;

  if ( not ( qryConsProfissionais.IsEmpty ) ) and ( qryConsAtendimento.Active ) then
    qryConsAtendimento.Refresh;

end;

procedure TfrmCadAtendimento.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryConsAtendimento.IsEmpty ) ) then
  begin

    if ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').IsNull ) or ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger = 0 ) then
      MsgBox(self.Handle, '"Prezado Cliente"'#13'Nenhum registro cadastrado no Dia/Hora selecionado', MB_OK+MB_ICONINFORMATION)
    else
      dbgAgendaDblClick( dbgAgenda );

  end;

end;

procedure TfrmCadAtendimento.btnBuscarClienteClick(Sender: TObject);
var nomeCliente: String;
begin
  inherited;

  InputQuery(NOME_EMPRESA, 'Informe o Nome do Cliente para pesquisa', nomeCliente);

  if ( nomeCliente <> '' ) then
  begin

    qryConsAtendimentoCliente.Close;
    qryConsAtendimentoCliente.ParamByName('CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
    qryConsAtendimentoCliente.ParamByName('DT_REFERENCIA').AsDateTime  := Calendario.Date;
    qryConsAtendimentoCliente.ParamByName('DS_NOMECLIENTE').AsString   := nomeCliente;
    qryConsAtendimentoCliente.Open;

    if ( qryConsAtendimentoCliente.IsEmpty ) then
    begin

      MsgBox('"Prezado Cliente"'#13'Nenhum atendimento foi encontrado. Verifique o Nome informado e tente novamente.', MB_OK+MB_ICONINFORMATION);

    end
    else
    begin

      frmConsClienteAtendimento := TfrmConsClienteAtendimento.Create(Self);

      while not ( qryConsAtendimentoCliente.Eof ) do
      begin

        frmConsClienteAtendimento.cdsAtendimento.Append;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('ID_ATENDIMENTO').AsInteger  := qryConsAtendimentoCliente.FieldByName('ID_ATENDIMENTO').AsInteger;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('DS_CLIENTE').AsString       := qryConsAtendimentoCliente.FieldByName('DS_CLIENTE').AsString;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('DT_ATENDIMENTO').AsDateTime := qryConsAtendimentoCliente.FieldByName('DT_ATENDIMENTO').AsDateTime;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('HR_ATENDIMENTO').AsDateTime := qryConsAtendimentoCliente.FieldByName('HR_ATENDIMENTO').AsDateTime;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('NR_TELEFONE').AsString      := qryConsAtendimentoCliente.FieldByName('NR_TELEFONE').AsString;
        frmConsClienteAtendimento.cdsAtendimento.FieldByName('NR_CELULAR').AsString       := qryConsAtendimentoCliente.FieldByName('NR_CELULAR').AsString;
        frmConsClienteAtendimento.cdsAtendimento.Post;

        qryConsAtendimentoCliente.Next;

      end;

      frmConsClienteAtendimento.cdsAtendimento.First;

      frmConsClienteAtendimento.ShowModal;

      if ( frmConsClienteAtendimento.ModalResult = mrOk ) then
      begin

        Calendario.Date := frmConsClienteAtendimento.cdsAtendimento.FieldByName('DT_ATENDIMENTO').AsDateTime;
        CalendarioClick(Calendario);

        qryConsAtendimento.Locate('P_OU_ID_ATENDIMENTO', frmConsClienteAtendimento.cdsAtendimento.FieldByName('ID_ATENDIMENTO').AsInteger, []);
        ActiveControl := dbgAgenda;

      end;

      FreeAndNil(frmConsClienteAtendimento);

    end;

  end;

end;

procedure TfrmCadAtendimento.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryConsAtendimento.IsEmpty ) ) and ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger > 0 ) then
  begin

    if ( MsgBox(self.Handle, '"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    begin

      try

        qryExcluirAtendimento.Close;
        qryExcluirAtendimento.ParamByName('ID_ATENDIMENTO').AsInteger := qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger;
        qryExcluirAtendimento.ExecSQL;

        trnsPadrao.Commit;

        qryConsAtendimento.Refresh;

      except
        on e: Exception do
        begin
          trnsPadrao.Rollback;
          MsgBox(self.Handle, '"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
        end;
      end;

    end;

  end;

end;

procedure TfrmCadAtendimento.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if ( dblProfissionais.Text <> '' ) then
  begin

    frmImpAtendimentos := TfrmImpAtendimentos.Create(Self);

    frmImpAtendimentos.dblProfissionais.KeyValue := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').Value;
    frmImpAtendimentos.edtDataReferencia.Text    := FormatDateTime('dd/mm/yyyy', Calendario.Date);

    frmImpAtendimentos.ShowModal;
    FreeAndNil(frmImpAtendimentos);

  end;

end;

procedure TfrmCadAtendimento.btnIncluirClick(Sender: TObject);
var fgIncluir: Boolean;
begin
  inherited;

  fgIncluir := true;

  if ( dblProfissionais.Text <> '' ) then
  begin

    if ( not ( qryConsAtendimento.IsEmpty ) ) and ( not ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').IsNull ) ) and
       ( qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger > 0 ) then
    begin

      if ( MsgBox(self.Handle, '"Prezado Cliente"'#13'Já existe registro cadastrado no Dia/Hora selecionado.'+#13+'Deseja Continuar?', MB_YESNO+MB_ICONQUESTION) = IDNo ) then
        fgIncluir := false;

    end;

    if ( fgIncluir ) then
    begin

      frmCadAtendimentoItem := TfrmCadAtendimentoItem.Create(Self);

      frmCadAtendimentoItem.lblDescProfissional.Caption := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsString + ' - ' + qryConsProfissionais.FieldByName('DS_NOME').AsString;

      frmCadAtendimentoItem.edtData.Date   := Calendario.Date;
      frmCadAtendimentoItem.edtHora.Text   := FormatDateTime('hh:mm', qryConsAtendimento.FieldByName('P_OU_HR_HORARIO').AsDateTime);
      frmCadAtendimentoItem.cdProfissional := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;

      frmCadAtendimentoItem.cbbStatus.ItemIndex := 0;

      frmCadAtendimentoItem.qryCadAtendimento.Close;
      frmCadAtendimentoItem.qryCadAtendimento.ParamByName('ID_ATENDIMENTO').AsInteger := qryConsAtendimento.FieldByName('P_OU_ID_ATENDIMENTO').AsInteger;
      frmCadAtendimentoItem.qryCadAtendimento.Open;

      frmCadAtendimentoItem.qryCadAtendimento.Append;

      frmCadAtendimentoItem.ShowModal;

      if ( frmCadAtendimentoItem.ModalResult = mrOk ) then
        qryConsAtendimento.Refresh;

      FreeAndNil(frmCadAtendimentoItem);

      ActiveControl := dbgAgenda;

    end;

  end
  else
    MsgBox(self.Handle, '"Prezado Cliente'#13'Selecione um profissional para inserir um registro', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmCadAtendimento.btnProximoDiaClick(Sender: TObject);
var hrLocate : TTime;
    dtInicio : TDate;
    countDias: Integer;
    msgDia   : Boolean;
    diaVago, horaVago: String;
begin
  inherited;

  if ( not ( qryConsProfissionais.IsEmpty ) ) and ( dblProfissionais.Text <> '' ) then
  begin

    if ( edtHora.Text = '  :  ' ) then
    begin
      MsgBox(self.Handle, '"Prezado Cliente"'#13'Informe a hora que deseja buscar', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

    qryValidaHoraAtendimento.Close;
    qryValidaHoraAtendimento.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
    qryValidaHoraAtendimento.ParamByName('P_IN_HR_REFERENCIA').AsTime      := StrToTime(edtHora.Text);
    qryValidaHoraAtendimento.Open;

    if ( qryValidaHoraAtendimento.IsEmpty ) or ( qryValidaHoraAtendimento.FieldByName('P_OU_FG_VALIDACAO').AsString <> 'SIM' ) then
    begin
      MsgBox(self.Handle, '"Prezado Cliente"'+#13+'Hora informada fora do horário de atendimento do Profissional selecionado', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

    dtInicio  := Calendario.Date;
    countDias := 1;
    msgDia    := False;

    while ( true ) do
    begin

      qryBuscaDiaVago.Close;
      qryBuscaDiaVago.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
      qryBuscaDiaVago.ParamByName('P_IN_ID_DIASEMANA').AsInteger    := DayOfWeek( dtInicio );
      qryBuscaDiaVago.ParamByName('P_IN_DT_REFERENCIA').AsDate      := dtInicio;
      qryBuscaDiaVago.ParamByName('HR_HORARIO').AsTime              := StrToTime(edtHora.Text);
      qryBuscaDiaVago.Open;

      if ( qryBuscaDiaVago.IsEmpty ) then
        dtInicio := IncDay(dtInicio)
      else
      begin
        diaVago  := FormatDateTime('dd/mm/yyyy', dtInicio);
        horaVago := FormatDateTime('hh:mm', qryBuscaDiaVago.FieldByName('P_OU_HR_HORARIO').AsDateTime);
        Break;
      end;

      countDias := countDias + 1;
      if ( countDias > 730 ) then
      begin
        msgDia := True;
        Break;
      end;

    end;

    if ( msgDia ) then
    begin
      MsgBox('"Prezado Cliente"'+#13+'Não foi encontrado nenhum horário vago nos próximos 2(dois) anos.', MB_OK);
      Exit;
    end;

    if ( MsgBox(self.Handle, 'Proximo dia/hora vago: '+diaVago+' - '+horaVago+#13#13+'Deseja ir para o dia/hora?', MB_YESNO+MB_ICONINFORMATION) = IDYES ) then
    begin

      Calendario.Date := StrToDate(diaVago);
      CalendarioClick(Calendario);

      hrLocate := StrToTime(horaVago);
      qryConsAtendimento.Locate('P_OU_HR_HORARIO', hrLocate, []);

      ActiveControl := dbgAgenda;

    end;

  end;

end;

end.
