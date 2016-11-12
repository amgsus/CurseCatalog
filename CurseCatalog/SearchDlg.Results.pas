unit SearchDlg.Results;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSearchResultsForm = class(TForm)
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    ButtonExit: TButton;
    ButtonGo: TButton;
    SearchList: TListBox;
    ButtonRetry: TButton;
    TopPanel: TPanel;
    QueryTextLabel: TLabel;
    ResultLabel: TLabel;
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonRetryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure SearchListDblClick(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure Reset;
  end;

implementation

uses
  Main, Dialog.Message;

{$R *.dfm}

procedure TSearchResultsForm.ButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TSearchResultsForm.ButtonGoClick(Sender: TObject);
begin
  if SearchList.ItemIndex <> -1 then
  begin
    MainForm.GotoItem(TBrowserListItem(SearchList.Items.Objects[SearchList.ItemIndex]).RecPtr);
    MainForm.Show;
  end
  else
    ShowMessage('Нет выбранных записей!');
end;

procedure TSearchResultsForm.ButtonRetryClick(Sender: TObject);
begin
  Close;
  MainForm.ActionSearch.Execute;
end;

procedure TSearchResultsForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TSearchResultsForm.FormDestroy(Sender: TObject);
begin
  Reset;
end;

procedure TSearchResultsForm.Reset;
var
  i: Integer;
begin
  for i := 0 to SearchList.Items.Count - 1 do
    SearchList.Items.Objects[i].Free;

  SearchList.Clear;
end;

procedure TSearchResultsForm.SearchListDblClick(Sender: TObject);
begin
  if SearchList.ItemIndex <> -1 then
    ButtonGoClick(Sender);
end;

end.
