unit DataExports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, Menus, CCDBv2;

type
  TDataExportDialog = class(TForm)
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    ButtonCancel: TButton;
    ButtonExport: TButton;
    ExportList: TCheckListBox;
    Panel_0: TPanel;
    CaptionLabel_1: TLabel;
    FileTypeCombo: TComboBox;
    ExcludePicsCheck: TCheckBox;
    SaveDialog: TSaveDialog;
    PopupMenu: TPopupMenu;
    MenuItemSelectAll: TMenuItem;
    MenuItemUnselect: TMenuItem;
    MenuItem_1: TMenuItem;
    MenuItemExchSelection: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ButtonExportClick(Sender: TObject);
    procedure MenuItemSelectAllClick(Sender: TObject);
    procedure MenuItemUnselectClick(Sender: TObject);
    procedure MenuItemExchSelectionClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure Reset;
    function ExportToTextFile(FileName: String): Boolean;
    function ExportToPNGs(FileName: String): Boolean;
  public
    procedure AddFrom(const First: PCatalogRecord);
  end;

implementation

{$R *.dfm}

uses
  Main, Dialog.Message, ItemEditor.Base;

{ TDataExportDialog }

procedure TDataExportDialog.AddFrom(const First: PCatalogRecord);
var
  P: PCatalogRecord;
  Obj: TBrowserListItem;
  i: Integer;
  S: String;
begin
  if First = nil then Exit;

  case First^.Data.DataTag of
    DATA_TAG_MOTHERBOARDS: S := 'МАТЕРИНСКИЕ ПЛАТЫ';
    DATA_TAG_CPU: S := 'ПРОЦЕССОРЫ';
    DATA_TAG_MEMORY: S := 'ОПЕРАТИВНАЯ ПАМЯТЬ';
    DATA_TAG_HDD: S := 'ЖЕСТКИЕ ДИСКИ \ SSD';
    DATA_TAG_COOLANT: S := 'СИСТЕМЫ ОХЛАЖДЕНИЯ';
    DATA_TAG_PWR_SUPPLY: S := 'БЛОКИ ПИТАНИЯ';
    DATA_TAG_GRAPHICS: S := 'ВИДЕОКАРТЫ (VGA)';
    DATA_TAG_AUDIO: S := 'АУДИОКАРТЫ';
    DATA_TAG_OPTICAL_DRIVES: S := 'CD\DVD\BD-ПРИВОДЫ';
    DATA_TAG_SYS_UNIT: S := 'СИСТЕМНЫЕ БЛОКИ';
    else
      S := 'НЕИЗВЕСТНО';
  end;
  i := ExportList.Items.Add(Format('=== %s ===', [S]));
  ExportList.Header[i] := True;

  ExportList.Items.BeginUpdate;
  try
    P := First;
    while P <> nil do
    begin
      Obj := CreateBLObj(P);
      ExportList.Items.AddObject(GetBLObjTitle(Obj), Obj);
      P := P^.Next;
    end;
  finally
    ExportList.Items.EndUpdate;
  end;
end;

procedure TDataExportDialog.ButtonExportClick(Sender: TObject);
var
  R: Boolean;
begin
  if SaveDialog.Execute then
  begin
    case FileTypeCombo.ItemIndex of
      0: R := ExportToTextFile(SaveDialog.FileName);
      1:
        begin
          if ExcludePicsCheck.Checked then
            ShowMessage('Значение флажка "Не экспортировать миниатюры" игнорируется.');
          
          R := ExportToPNGs(SaveDialog.FileName);
        end;
        
      else
        R := False;
    end;

    if R then
      ShowMessage('Экспорт завершен!', Format('Данные экспортированы в файл(ы) "%s".',
        [SaveDialog.FileName]))
    else
      ShowError('Ошибка экспорта!', 'При экспортировании данных' + #32 + 
        'возникла ошибка. Возможно, запись данных ограничена политикой безопасности.');
  end;
end;

function TDataExportDialog.ExportToPNGs(FileName: String): Boolean;
var
  i: Integer;
  R: PCatalogRecord;
  Path: String;
begin
  Result := True;
  Path := ExtractFilePath(FileName);
  FileName := ChangeFileExt(ExtractFileName(FileName), '') + '%.3d';
  
  try
    for i := 0 to ExportList.Items.Count - 1 do
    begin
      if ExportList.Header[i] then Continue;
      if not ExportList.Checked[i] then Continue;

      R := TBrowserListItem(ExportList.Items.Objects[i]).RecPtr;
      if R^.Picture = nil then Continue;
    
      R^.Picture.SaveToFile(Path + Format(FileName, [i]) + '.PNG');
    end;
  except
    Result := False;
  end;
end;

function TDataExportDialog.ExportToTextFile(FileName: String): Boolean;
var
  i: Integer;
  R: PCatalogRecord;
  F: TextFile;
  S: String;
  CatIndex: Integer;
  PicFileName: String;
begin
  Result := True;
  try
    CatIndex := -1;
    AssignFile(F, FileName);
    try
      Rewrite(F);
      Writeln(F, 'СЕГОДНЯ ' + DateToStr(Now) + ', ' + TimeToStr(Now) + '.');
      Writeln(F);

      for i := 0 to ExportList.Items.Count - 1 do
      begin
        if ExportList.Header[i] then Continue;
        if not ExportList.Checked[i] then Continue;

        R := TBrowserListItem(ExportList.Items.Objects[i]).RecPtr;

        if R^.Data.DataTag <> CatIndex then
        begin
          CatIndex := R^.Data.DataTag;
          S := AnsiUpperCase(Format('*** %s ***', [Catalogs[CatIndex].Title]));
          Writeln(F, StringOfChar('*', Length(S)));
          Writeln(F, S);
          Writeln(F, StringOfChar('*', Length(S)));
          Writeln(F);
        end;

        {$WARNINGS OFF}
        S := R^.Data.Vendor + #32 + R^.Data.Model;
        Writeln(F, Format('### %s ###', [S]));
        Writeln(F);
        S := R^.Data.ProductID;
        Writeln(F, Format('Идентификатор: %s', [S]));
        S := R^.Data.Notes;
        Writeln(F, Format('Описание: %s', [S]));
        S := Format('%d$..%d$', [R^.Data.MinPrice, R^.Data.MaxPrice]);
        Writeln(F, Format('Цена: %s', [S]));
        Writeln(F);
        S := Catalogs[R^.Data.DataTag].EditorFrame.GetDescription(R^.LinkedData);
        Writeln(F, S);
        Writeln(F);
        {$WARNINGS ON}

        if (not ExcludePicsCheck.Checked) and (R^.Picture <> nil) then
        begin
          PicFileName := Format('%s %s.png', [R^.Data.Vendor, R^.Data.Model]);
          R^.Picture.SaveToFile(ExtractFilePath(FileName) + PicFileName);
        end;
      end;
    finally
      CloseFile(F);
    end;
  except
    Result := False;
  end;
end;

procedure TDataExportDialog.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := Low(Catalogs) to High(Catalogs) do
    AddFrom(Catalogs[i].DB.First);
end;

procedure TDataExportDialog.FormDestroy(Sender: TObject);
begin
  Reset;
end;

procedure TDataExportDialog.MenuItemExchSelectionClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ExportList.Items.Count - 1 do
    ExportList.Checked[i] := not ExportList.Checked[i];
end;

procedure TDataExportDialog.MenuItemSelectAllClick(Sender: TObject);
begin
  ExportList.CheckAll(cbChecked);
end;

procedure TDataExportDialog.MenuItemUnselectClick(Sender: TObject);
begin
  ExportList.CheckAll(cbUnchecked);
end;

procedure TDataExportDialog.Reset;
var
  i: Integer;
begin
  for i := 0 to ExportList.Items.Count - 1 do
    ExportList.Items.Objects[i].Free;
end;

end.
