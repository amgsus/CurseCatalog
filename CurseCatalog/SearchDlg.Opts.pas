unit SearchDlg.Opts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CCDBv2;

type
  TSearchQueryDialog = class(TForm)
    QueryEdit: TLabeledEdit;
    GroupBox_0: TGroupBox;
    CatsGroupBox: TGroupBox;
    CatCheck_0: TCheckBox;
    CatCheck_1: TCheckBox;
    CatCheck_2: TCheckBox;
    CatCheck_3: TCheckBox;
    CatCheck_4: TCheckBox;
    CatCheck_5: TCheckBox;
    CatCheck_6: TCheckBox;
    CatCheck_7: TCheckBox;
    CatCheck_8: TCheckBox;
    CatCheck_9: TCheckBox;
    GroupBox_2: TGroupBox;
    VendorCheck: TCheckBox;
    ModelCheck: TCheckBox;
    ProductIDCheck: TCheckBox;
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    ButtonCancel: TButton;
    ButtonSearch: TButton;
    NoteCheck: TCheckBox;
    GroupBox_3: TGroupBox;
    CaseSensitiveCheck: TCheckBox;
    WholeMatchCheck: TCheckBox;
    FromCursorCheck: TCheckBox;
    PriceCheck: TCheckBox;
    procedure ButtonSearchClick(Sender: TObject);
  public
    procedure GetSearchQuery(var Query: TSearchQuery);
    procedure SetSearchQuery(const Default: TSearchQuery);
  end;

implementation

{$R *.dfm}

uses
  Dialog.Message;

{ TSearchOptsDialog }

procedure TSearchQueryDialog.ButtonSearchClick(Sender: TObject);
var
  Price: Integer;
begin
  QueryEdit.Text := Trim(QueryEdit.Text);

  if PriceCheck.Checked then
  begin
    ShowMessage('Если установлен флажок "Ценовой диапазон", поиск будет осуществляться' + #32 +
      'только по цене, независимо от того, стоят ли галочки напротив других полей' +
      'или нет. Запись отображается в результатах поиска, если введенная цена входит' + #32 +
      'в ценовой диапазон.');
    if not (TryStrToInt(QueryEdit.Text, Price)) or ((Price < 1) or (Price > High(Word))) then
    begin
      ShowWarning('Цена задана неверно!');
      Exit;
    end;
  end;

  if (Length(QueryEdit.Text) < 2) and not PriceCheck.Checked then
  begin
    ShowMessage('Для поиска записей введите не менее 2 символов!');
    Exit;
  end;

  ModalResult := mrOK;
end;

procedure TSearchQueryDialog.GetSearchQuery(var Query: TSearchQuery);
var
  i: Integer;
  C: TComponent;
begin
  with Query do
  begin
    Text := QueryEdit.Text;
    for i := 0 to 9 do
    begin
      C := FindComponent('CatCheck_' + IntToStr(i));
      if C <> nil then
        ViewingCats[i] := TCheckBox(C).Checked;
    end;

    if VendorCheck.Checked then
      ViewingFields := ViewingFields + [vfVendor]
    else
      ViewingFields := ViewingFields - [vfVendor];

    if ModelCheck.Checked then
      ViewingFields := ViewingFields + [vfModel]
    else
      ViewingFields := ViewingFields - [vfModel];

    if ProductIDCheck.Checked then
      ViewingFields := ViewingFields + [vfProductID]
    else
      ViewingFields := ViewingFields - [vfProductID];

    if NoteCheck.Checked then
      ViewingFields := ViewingFields + [vfNotes]
    else
      ViewingFields := ViewingFields - [vfNotes];

    if PriceCheck.Checked then
      ViewingFields := ViewingFields + [vfPrice]
    else
      ViewingFields := ViewingFields - [vfPrice];

    CaseSensitive := CaseSensitiveCheck.Checked;
    WholeMatch := WholeMatchCheck.Checked;
    StartFromCursor := FromCursorCheck.Checked;
  end;
end;

procedure TSearchQueryDialog.SetSearchQuery(const Default: TSearchQuery);
var
  i: Integer;
  C: TComponent;
begin
  with Default do
  begin
    QueryEdit.Text := Text;
    for i := 0 to 9 do
    begin
      C := FindComponent('CatCheck_' + IntToStr(i));
      if C <> nil then
        TCheckBox(C).Checked := ViewingCats[i];
    end;

    VendorCheck.Checked := (vfVendor in ViewingFields);
    ModelCheck.Checked := (vfModel in ViewingFields);
    ProductIDCheck.Checked := (vfProductID in ViewingFields);
    NoteCheck.Checked := (vfNotes in ViewingFields);
    PriceCheck.Checked := (vfPrice in ViewingFields);
    CaseSensitiveCheck.Checked := CaseSensitive;
    WholeMatchCheck.Checked := WholeMatch;
    FromCursorCheck.Checked := StartFromCursor;
  end;
end;

end.
