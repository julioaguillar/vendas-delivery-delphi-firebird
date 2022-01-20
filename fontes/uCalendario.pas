unit uCalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, Buttons, Grids, ExtCtrls, DateUtils, DB,
  IBODataset;

type
  TDataHora = Record
    Data: TDateTime;
    Hora: TDateTime;
  end;

  TFeriado = Record
    DT_DIA    : String;
    DT_MES    : String;
    DS_FERIADO: String;
  end;

  TTarefa = Record
    DS_TAREFA       : String;
    DT_INICIOTAREFA : TDateTime;
    DT_TERMINOTAREFA: TDateTime;
    HR_HORATAREFA   : TTime;
    FG_STATUS       : String;
    DS_OBSERVACAO   : String;
  end;

type
  TfrmCalendario = class(TfrmPadrao)
    pnlAgenda: TPanel;
    imgTarefaRealizada: TImage;
    imgTarefaAFazer: TImage;
    imgTarefaEmAndamento: TImage;
    pnlDomingo: TPanel;
    pnlSegunda: TPanel;
    pnlTerca: TPanel;
    pnlQuarta: TPanel;
    pnlQuinta: TPanel;
    pnlSexta: TPanel;
    pnlSabado: TPanel;
    CalendarGrid: TStringGrid;
    pnlTitulo: TPanel;
    btnAnoAnterior: TSpeedButton;
    btnMesAnterior: TSpeedButton;
    btnProximoAno: TSpeedButton;
    btnProximoMes: TSpeedButton;
    qryConsFeriados: TIBOQuery;
    imgFeriado: TImage;
    BalloonHint: TBalloonHint;
    imgTarefaCancelada: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CalendarGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure CalendarGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btnAnoAnteriorClick(Sender: TObject);
    procedure btnMesAnteriorClick(Sender: TObject);
    procedure btnProximoMesClick(Sender: TObject);
    procedure btnProximoAnoClick(Sender: TObject);
  private
    { Private declarations }

    DataCalendario, DataMesSelecionado: TDateTime;

    execSelectCell: Boolean;
    DataServidor  : TDataHora;
    Feriado       : Array of TFeriado;
    Tarefa        : Array of TTarefa;

    function getDataCalendario: TDateTime;
    procedure prcCarregaFeriados;
    procedure prcMontaCalendario(dtReferencia: TDateTime);
    procedure setDataCalendario(Data: TDateTime);

  public
    { Public declarations }
  end;

var
  frmCalendario: TfrmCalendario;

implementation

uses uConstantes, udmPrincipal;

{$R *.dfm}

procedure TfrmCalendario.setDataCalendario(Data: TDateTime);
begin

  DataCalendario  := Data;

end;

function TfrmCalendario.getDataCalendario: TDateTime;
begin

  Result := DataCalendario;

end;

procedure TfrmCalendario.prcMontaCalendario(dtReferencia: TDateTime);
var dtAux: TDateTime;
    row, col, diaSemana, rowSel, colSel: Integer;
    dtInicio, dtFim: String;
begin

  setDataCalendario(dtReferencia);
  dtAux     := StartOfTheMonth( dtReferencia );
  diaSemana := DayOfWeek(dtAux)-1;

  rowSel := 0;
  colSel := 0;

  for row := 0 to CalendarGrid.RowCount-1 do
  begin

    for col := 0 to CalendarGrid.ColCount-1 do
    begin

      if ( ( row = 0 ) and ( col >= diaSemana ) ) or ( row > 0 ) then
      begin

        if ( dtAux = getDataCalendario ) then
        begin
          colSel := col;
          rowSel := row;
        end;

        CalendarGrid.Cells[col,row] := DateToStr(dtAux);
        dtAux := IncDay(dtAux);

      end
      else if ( row = 0 ) then
        CalendarGrid.Cells[col,row] := DateToStr(IncDay(dtAux, (diaSemana*-1)+col));

    end;

  end;

  dtInicio := CalendarGrid.Cells[0,0];
  dtFim    := CalendarGrid.Cells[CalendarGrid.ColCount-1,CalendarGrid.RowCount-1];

  pnlTitulo.Caption  := FormatDateTime('mmmm "de" yyyy', dtReferencia);
  DataMesSelecionado := dtReferencia;

  CalendarGrid.Row := rowSel;
  CalendarGrid.Col := colSel;

end;

procedure TfrmCalendario.prcCarregaFeriados;
begin

  FillChar(Feriado, SizeOf(Feriado), 0);

  qryConsFeriados.Close;
  qryConsFeriados.Open;

  while not ( qryConsFeriados.Eof ) do
  begin

    SetLength(Feriado, Length(Feriado) + 1);

    Feriado[ Length(Feriado) - 1 ].DT_DIA     := FormatFloat('00', qryConsFeriados.FieldByName('DT_DIAFERIADO').AsInteger);
    Feriado[ Length(Feriado) - 1 ].DT_MES     := FormatFloat('00', qryConsFeriados.FieldByName('DT_MESFERIADO').AsInteger);
    Feriado[ Length(Feriado) - 1 ].DS_FERIADO := qryConsFeriados.FieldByName('DS_FERIADO').AsString;

    qryConsFeriados.Next;

  end;

end;

procedure TfrmCalendario.btnAnoAnteriorClick(Sender: TObject);
begin
  inherited;

  prcMontaCalendario(IncYear(getDataCalendario, -1));

end;

procedure TfrmCalendario.btnMesAnteriorClick(Sender: TObject);
begin
  inherited;

  prcMontaCalendario(IncMonth(getDataCalendario, -1));

end;

procedure TfrmCalendario.btnProximoAnoClick(Sender: TObject);
begin
  inherited;

  prcMontaCalendario(IncYear(getDataCalendario));

end;

procedure TfrmCalendario.btnProximoMesClick(Sender: TObject);
begin
  inherited;

  prcMontaCalendario(IncMonth(getDataCalendario));

end;

procedure TfrmCalendario.CalendarGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var DiaGrid, MesAtual: String;
    TopGrid, LeftGrid: Integer;
    DataCalendario   : TDateTime;
    compromisso      : Boolean;
    i: Integer;
begin
  inherited;

  with ( CalendarGrid ) do
  begin

    DataCalendario := StrToDate( Cells[aCol, aRow] );
    DiaGrid        := IntToStr(DayOf(DataCalendario));

    if MonthOf(DataCalendario) = MonthOf(DataMesSelecionado) then
    begin

      if ( DataCalendario = DataServidor.Data ) then
        Canvas.Font.Color := clBlue
      else if (DayOfWeek(DataCalendario) = 1) then
        Canvas.Font.Color := clRed
      else
        Canvas.Font.Color := clBlack;

      for i := 0 to Length(Feriado) - 1 do
      begin

        if ( FormatDateTime('dd', DataCalendario) = Feriado[i].DT_DIA ) and
           ( FormatDateTime('mm', DataCalendario) = Feriado[i].DT_MES ) then
          Canvas.Font.Color := clRed;

      end;

    end
    else
      Canvas.Font.Color := $00D2D2D2;

    if gdSelected in State then
      Canvas.Brush.Color := $00FFEEDF
    else
      Canvas.Brush.Color := clWhite;

    Canvas.Font.Style := [fsBold];

    LeftGrid := Rect.Left + 3;
    TopGrid  := Rect.Top  + 3;

    Canvas.Rectangle(Classes.Rect(Rect.Left - 1, Rect.Top -1 , Rect.Right + 1, Rect.Bottom + 1));
    Canvas.TextOut(LeftGrid, TopGrid, DiaGrid);

    compromisso := False;

    // IMAGEM COMPROMISSO
    for i := 0 to Length(Tarefa) - 1 do
    begin

      if ( ( DataCalendario >= Tarefa[i].DT_INICIOTAREFA ) and ( DataCalendario <= Tarefa[i].DT_TERMINOTAREFA ) ) then
      begin

        if Tarefa[i].FG_STATUS = 'Em Andamento' then
          Canvas.Draw( Rect.Left + 20, Rect.Top + 10, imgTarefaEmAndamento.Picture.Graphic )
        else if Tarefa[i].FG_STATUS = 'A fazer' then
          Canvas.Draw( Rect.Left + 20, Rect.Top + 10, imgTarefaAFazer.Picture.Graphic )
        else if Tarefa[i].FG_STATUS = 'Realizada' then
          Canvas.Draw( Rect.Left + 20, Rect.Top + 10, imgTarefaRealizada.Picture.Graphic )
        else if Tarefa[i].FG_STATUS = 'Cancelada' then
          Canvas.Draw( Rect.Left + 20, Rect.Top + 10, imgTarefaCancelada.Picture.Graphic );

        compromisso := True;

      end;

    end;

    if ( not ( compromisso ) ) then
    begin

      // IMAGEM FERIADO
      for i := 0 to Length(Feriado) - 1 do
      begin

        if ( MonthOf(DataCalendario) = MonthOf(DataMesSelecionado) ) and
           ( FormatDateTime('dd', DataCalendario) = Feriado[i].DT_DIA ) and
           ( FormatDateTime('mm', DataCalendario) = Feriado[i].DT_MES ) then
          Canvas.Draw( Rect.Left + 20, Rect.Top + 10, imgFeriado.Picture.Graphic );

      end;

    end;

  end;

end;

procedure TfrmCalendario.CalendarGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i: Integer;
    Posicao: TPoint;
    sHintCompromisso: String;
    bShowCompromisso: Boolean;
begin
  inherited;

  if ( execSelectCell ) then
  begin

    if ( CalendarGrid.Cells[ACol,ARow] <> '' ) then
      setDataCalendario(StrToDate(CalendarGrid.Cells[ACol,ARow]));

    sHintCompromisso := '';
    bShowCompromisso := False;

    // Exibe Hint nas Tarefas
    for i := 0 to Length(Tarefa) - 1 do
    begin

      if ( ( StrToDate(CalendarGrid.Cells[ACol, ARow]) >= Tarefa[i].DT_INICIOTAREFA ) and ( StrToDate(CalendarGrid.Cells[ACol, ARow]) <= Tarefa[i].DT_TERMINOTAREFA ) ) then
      begin

        if ( sHintCompromisso = '' ) then
          sHintCompromisso := FormatDateTime('hh:mm', Tarefa[i].HR_HORATAREFA ) + ' - ' + Tarefa[i].DS_TAREFA
        else
          sHintCompromisso := sHintCompromisso + #13 + FormatDateTime('hh:mm', Tarefa[i].HR_HORATAREFA ) + ' - ' + Tarefa[i].DS_TAREFA;

        bShowCompromisso := True;

      end;

    end;

    sHintCompromisso := sHintCompromisso + #13;

    Posicao.X := CalendarGrid.Left + (CalendarGrid.ColWidths[0] * ACol) + (CalendarGrid.ColWidths[0] div 2);
    Posicao.Y := CalendarGrid.Top + (CalendarGrid.RowHeights[0] * ARow) + (CalendarGrid.RowHeights[0] div 3) - 60;

    if ( bShowCompromisso ) then
    begin
      BalloonHint.Title       := 'Tarefa(s) Agendada(s)';
      BalloonHint.Description := sHintCompromisso;
      BalloonHint.ShowHint(CalendarGrid.ClientToScreen(Posicao));
    end
    else
      BalloonHint.HideHint;

  end;

end;

procedure TfrmCalendario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  Self   := nil;

end;

procedure TfrmCalendario.FormCreate(Sender: TObject);
begin
  inherited;

  execSelectCell    := false;
  DataServidor.Data := Date;

  prcCarregaFeriados;

  setDataCalendario(DataServidor.Data);
  prcMontaCalendario(getDataCalendario);

  // percorre os compromissos
  //for i := 0 to Length(Compromisso) - 1 do

  // pega a data selecionada
  // getDataCalendario

  execSelectCell := true;

end;

procedure TfrmCalendario.FormShow(Sender: TObject);
begin
  inherited;

  frmCalendario.Caption := NOME_EMPRESA+' - Calendário';

end;

end.
