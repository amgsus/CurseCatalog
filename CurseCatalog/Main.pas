unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, PngImageList, ActnList, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, CCDBv2, pngimage, ItemEditor.Base, SearchDlg.Opts, SearchDlg.Results,
  DataExports, ShellApi, IniFiles, RecFilters, AuxProcs;

const
  CRLF = #13#10;

type
  TCatalogInfo = record
    Title: String;
    Filename: String;
    DB: TCurseCatalogEngine;
    LastIndex: Integer;
    EditorFrame: TItemEditorBaseFrame;
  end;
  TCatalogs = array [0..9] of TCatalogInfo;

  TBrowserListItem = class(TObject)
  private
    FRecPtr: PCatalogRecord;
    FCategory: Integer;
  public
    property Category: Integer read FCategory write FCategory;
    property RecPtr: PCatalogRecord read FRecPtr write FRecPtr;
  end;

  TMainForm = class(TForm)
    Panel_1: TPanel;
    ActionList: TActionList;
    ActionImages: TPngImageList;
    GlobalMenuPopup: TPopupMenu;
    CategoriesPanel: TPanel;
    Bevel_2: TBevel;
    DesktopPanel: TPanel;
    InfoPanel: TPanel;
    Bevel_1: TBevel;
    Bevel_3: TBevel;
    CatsItemPanel: TPanel;
    GhostShape: TShape;
    CatsItemPanel_1: TPanel;
    CatsItemPanel_2: TPanel;
    CatsItemPanel_3: TPanel;
    CatsItemPanel_7: TPanel;
    CatsItemPanel_6: TPanel;
    CatsItemPanel_5: TPanel;
    CatsItemPanel_4: TPanel;
    CatsItemPanel_9: TPanel;
    CatsItemPanel_8: TPanel;
    SelectionShape: TShape;
    Image_0: TImage;
    LogoImage: TImage;
    CategoryLabel: TLabel;
    ItemNameLabel: TLabel;
    BrowserPopup: TPopupMenu;
    ActionExit: TAction;
    MenuItemExit: TMenuItem;
    ActionNewItem: TAction;
    MenuItem_1: TMenuItem;
    MenuItemEdit_0: TMenuItem;
    MenuItemNewItem_1: TMenuItem;
    BrowserList: TListBox;
    MainToolBar: TToolBar;
    ButtonMenu: TToolButton;
    ButtonNewItem: TToolButton;
    MenuItemView_0: TMenuItem;
    MenuItemDetailedView_1: TMenuItem;
    MenuItemShowPreview_1: TMenuItem;
    ActionDetailedList: TAction;
    ActionShowPreview: TAction;
    MenuItemDetailedView_2: TMenuItem;
    MenuItemListImages_2: TMenuItem;
    MenuItemNewItem_2: TMenuItem;
    MenuItem_2: TMenuItem;
    ActionRefreshList: TAction;
    MenuItem_3: TMenuItem;
    MenuItemRefreshList_1: TMenuItem;
    MenuItem_4: TMenuItem;
    MenuItemRefreshList_2: TMenuItem;
    ActionEditItem: TAction;
    MenuItemEditItem_1: TMenuItem;
    MenuItemEditItem_2: TMenuItem;
    ButtonEditItem: TToolButton;
    ActionDeleteItem: TAction;
    ButtonDeleteItem: TToolButton;
    MenuItemDeleteItem_1: TMenuItem;
    MenuItemDeleteItem_2: TMenuItem;
    ActionEraseItems: TAction;
    MenuItemEraseItems: TMenuItem;
    ActionPreviewItem: TAction;
    MenuItemPreviewItem_1: TMenuItem;
    N1: TMenuItem;
    MenuItemPreviewItem_2: TMenuItem;
    ActionSplash: TAction;
    MenuItem_5: TMenuItem;
    MenuItemSplash: TMenuItem;
    MenuItem_6: TMenuItem;
    ActionSearchResults: TAction;
    MenuItemSearch_0: TMenuItem;
    MenuItemSearchResults: TMenuItem;
    ActionSearch: TAction;
    ButtonSearch: TToolButton;
    MenuItemSearch: TMenuItem;
    ActionSave: TAction;
    ActionRestore: TAction;
    MenuItemFile_0: TMenuItem;
    MenuItemRestore: TMenuItem;
    MenuItemSave: TMenuItem;
    ActionSortNames: TAction;
    ActionSortIDs: TAction;
    ActionSortPrices: TAction;
    ActionSortDates: TAction;
    MenuItem_7: TMenuItem;
    MenuItemSorting_0: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MenuItem_8: TMenuItem;
    N5: TMenuItem;
    ActionExport: TAction;
    MenuItem_9: TMenuItem;
    MenuItemExport: TMenuItem;
    InfoTimer: TTimer;
    PriceLabel: TLabel;
    DescriptionLabel: TLabel;
    ItemImage: TImage;
    ActionCatsInfo: TAction;
    MenuItem_10: TMenuItem;
    ActionFilter: TAction;
    MenuItemCatsInfo: TMenuItem;
    ButtonSorting: TToolButton;
    ButtonSpash: TToolButton;
    ButtonSave: TToolButton;
    ToolButton_1: TToolButton;
    ToolButton_2: TToolButton;
    ToolButton_3: TToolButton;
    ToolButton_4: TToolButton;
    MenuItemFilter_1: TMenuItem;
    MenuItem_11: TMenuItem;
    MenuItem_12: TMenuItem;
    MenuItemFilter_2: TMenuItem;
    ButtonRefresh: TToolButton;
    ActionToolbarCaptions: TAction;
    MenuItemToolbarCaptions: TMenuItem;
    ActionEraseFiles: TAction;
    MenuItemEraseFiles: TMenuItem;
    MenuItem_13: TMenuItem;
    ActionMenu: TAction;
    ActionInfoPanel: TAction;
    MenuItemInfoPanel: TMenuItem;
    ImageCollection: TPngImageCollection;
    MenuItem_14: TMenuItem;
    MenuItemPreviewSize: TMenuItem;
    ActionPreviewSize: TAction;
    ActionPreviewSize48: TAction;
    ActionPreviewSize64: TAction;
    ActionPreviewSize96: TAction;
    ActionPreviewSize128: TAction;
    ActionPreviewSize150: TAction;
    ActionStretchPreview: TAction;
    MenuItemPreview36: TMenuItem;
    MenuItemPreview48: TMenuItem;
    MenuItemPreview64: TMenuItem;
    MenuItemPreview96: TMenuItem;
    MenuItemPreview128: TMenuItem;
    MenuItemPreview150: TMenuItem;
    MenuItem_15: TMenuItem;
    MenuItemStretchPreview: TMenuItem;
    FilterLabel: TLabel;
    procedure CatsItemPanelMouseEnter(Sender: TObject);
    procedure CatsItemPanelMouseLeave(Sender: TObject);
    procedure CatsItemPanelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionNewItemExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionRefreshListExecute(Sender: TObject);
    procedure ActionEditItemExecute(Sender: TObject);
    procedure BrowserListDblClick(Sender: TObject);
    procedure BrowserListDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure ActionDeleteItemExecute(Sender: TObject);
    procedure ActionEraseItemsExecute(Sender: TObject);
    procedure ActionPreviewItemExecute(Sender: TObject);
    procedure ActionSplashExecute(Sender: TObject);
    procedure ActionDetailedListExecute(Sender: TObject);
    procedure ActionShowPreviewExecute(Sender: TObject);
    procedure ActionSearchResultsExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionRestoreExecute(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure ActionSortNamesExecute(Sender: TObject);
    procedure ActionSortIDsExecute(Sender: TObject);
    procedure ActionSortPricesExecute(Sender: TObject);
    procedure ActionSortDatesExecute(Sender: TObject);
    procedure ActionExportExecute(Sender: TObject);
    procedure BrowserListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BrowserListKeyPress(Sender: TObject; var Key: Char);
    procedure InfoTimerTimer(Sender: TObject);
    procedure ActionToolbarCaptionsExecute(Sender: TObject);
    procedure ActionEraseFilesExecute(Sender: TObject);
    procedure ActionMenuExecute(Sender: TObject);
    procedure ActionInfoPanelExecute(Sender: TObject);
    procedure ActionCatsInfoExecute(Sender: TObject);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionPreviewSizeExecute(Sender: TObject);
    procedure ActionStretchPreviewExecute(Sender: TObject);
    procedure FilterLabelDblClick(Sender: TObject);
  private
    FSelected: Integer;               // Selected catalog index [tag]
    FActiveFrame: TCustomFrame;       // Active frame
    FSearchQuery: TSearchQuery;       // Last search query
    FSearchResultsForm: TSearchResultsForm;  // Search result form
    FFilter: TFilterOpts;             // Filter
    FPreviewSize: Integer;            // Size of images in list (px.)
    FGradLine: TBitmap;               // Gradient mask of selected list items
    procedure InitializeCats;         // Loads catalogs into memory
    procedure FinalizeCats;           // Releases all catalogs
    procedure SelectMenu(const Tag: Integer); // Sets current category and reloads info
    procedure ShowItemEditor(const Mode: TItemEditorMode); // Shows item editor
    procedure HideItemEditor;         // Hides currently openned item editor
    { Executes when WM_ITEMEDITOR message is received }
    procedure WMItemEditorEvent(var Msg: TMessage); message WM_ITEMEDITOR;
    procedure RefreshBottomPanel;     // Refreshes bottom panel
    procedure RefreshStates;          // Refreshes all statuses and states of components
    procedure DisableCategoriesPanel(const Disabled: Boolean = True); //
    procedure LoadOptions;            // Load options from INI-file
    procedure SaveOptions;            // Save options from INI-file
    procedure FreeAllBLObjects;       // Clears BL-objects
    procedure DrawListItemBackground(List: TCustomListBox; Index: Integer;
      Rect: TRect; State: TOwnerDrawState); // Custom listbox item background drawing proc.
    procedure UpdateGradLineMask;
    function  MatchingFilter(const Data: TRecCommonData): Boolean; // Data filter proc.
  public
    procedure GotoItem(const Ptr: PCatalogRecord); // Navigation
  end;

var
  Catalogs: TCatalogs; // Used by DataExportDialog (GLOBAL)
  MainForm: TMainForm;

(* Returns new instance of TBrowserListItem with assigned ptr. *)
function CreateBLObj(const Ptr: PCatalogRecord): TBrowserListItem;
(* Returnes prepared title of item *)
function GetBLObjTitle(const Item: TBrowserListItem; const ExcludePID: Boolean = False;
  const ExcludePrice: Boolean = False): String;

implementation

{$R *.dfm}

uses
  ItemEditor.Motherboards, ItemEditor.CPUs, ItemEditor.RAM, ItemEditor.HDDs,
  ItemEditor.Coolant, ItemEditor.PowerSupply, ItemEditor.Graphics, ItemEditor.Audio,
  ItemEditor.ODDs, ItemEditor.SysUnits, Splash.Welcome, Splash.About, Dialog.Message;

function CreateBLObj(const Ptr: PCatalogRecord): TBrowserListItem;
begin
  Result := TBrowserListItem.Create;
  Result.RecPtr := Ptr;
  if Ptr <> nil then
    Result.Category := Ptr^.Data.DataTag;
end;

function GetBLObjTitle(const Item: TBrowserListItem; const ExcludePID: Boolean = False;
  const ExcludePrice: Boolean = False): String;
begin
  {$WARNINGS OFF}
  Result := '<Unknown>';

  if Item <> nil then
    if Item.RecPtr <> nil then
    begin
      with Item.RecPtr^.Data do
      begin
        Result := Vendor + #32 + Model;
        if (ProductID <> '') and not ExcludePID then
          Result := Result + #32 + '(' + ProductID + ')';
        if not ExcludePrice then
          Result := Result + #32 + '[' + IntToStr(MinPrice) + '$ - ' +
            IntToStr(MaxPrice) + '$]';
      end;
    end;
  {$WARNINGS ON}
end;

{ TMainForm }

procedure TMainForm.FilterLabelDblClick(Sender: TObject);
begin
  if ShowConfirmation('Фильтр сейчас активирован.', 'Хотите отключить его?') = mrYes then
  begin
    FFilter.Enabled := False;
    FilterLabel.Hide;
    ActionRefreshList.Execute;
  end;
end;

procedure TMainForm.FinalizeCats;
var
  i: Integer;
begin
  for i := Low(Catalogs) to High(Catalogs) do
  begin
    FreeAndNil(Catalogs[i].DB); // Dispose all records when releasing CCDB
    FreeAndNil(Catalogs[i].EditorFrame); // Release linked editor
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
  Flag: Boolean;
begin
  { Check if editor is currently showed }
  if Assigned(FActiveFrame) and (FActiveFrame is TItemEditorBaseFrame) then
  begin
    ShowWarning('Программа обнаружила активный режим редактирования.' + #32 +
      'Пожалуйста, закройте редактор перед выходом из программы!');
    CanClose := False; // Dont allow to exit when editor is showed
    Exit;
  end;

  { Promt for saving changes }
  Flag := False;

  for i := Low(Catalogs) to High(Catalogs) do
    Flag := Flag or Catalogs[i].DB.Changed;

  if Flag then
  begin
    i := MessageDlgEx('Выход из программы', 'Некоторые каталоги были изменены, но еще' + #32 +
      'не были сохранены. Желаете сохранить все каталоги сейчас?' + #32#13#10 +
      'Для выхода без сохранения изменений нажмите "Нет".', mtQuestion, mbYesNoCancel);

    case TModalResult(i) of
      mrYes:
        begin
          Flag := True;
          for i := Low(Catalogs) to High(Catalogs) do
          begin
            try
              Catalogs[i].DB.FlushToFile;
            except
              Flag := False;
            end;
          end;

          if not Flag then
            ShowError('Выход из программы', 'При сохранении некоторых каталогов' + #32 +
              'возникла ошибка. Выход из программы не будет осуществлен для' + #32 +
              'предотвращения потери данных.');

          CanClose := Flag;
        end;

      mrNo: CanClose := True;
      mrCancel: CanClose := False;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
  FSearchResultsForm := TSearchResultsForm.Create(nil);
  FGradLine := TBitmap.Create;
  FGradLine.PixelFormat:=pf24bit;
  UpdateGradLineMask;

  InitializeCats; // Initialize all catalogs
  FSelected := -1; // Set currently selected catalog to -1
  SelectMenu(0);
  FActiveFrame := nil; // Set current frame to NIL
  LoadOptions;

  if not DirectoryExists('Data') then
    if not CreateDir('Data') then
      ShowError('Подготовка среды выполнения', 'При создании рабочего каталога' + #32 +
        'возникла ошибка. Создайте папку "Data" в папке с программой вручную.');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FinalizeCats; // Release all catalogs
  FSearchResultsForm.Free;
  FGradLine.Free;
  SaveOptions;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  LogoImage.Top := Image_0.Height div 2 - LogoImage.Height div 2;
  LogoImage.Left := Image_0.Width - LogoImage.Width - 10;
  BrowserList.Repaint; // Repaint list
end;

procedure TMainForm.FreeAllBLObjects;
var
  i: Integer;
begin
  for i := 0 to BrowserList.Items.Count - 1 do
    BrowserList.Items.Objects[i].Free;
end;

procedure TMainForm.GotoItem(const Ptr: PCatalogRecord);
var
  i: Integer;
begin
  if Ptr = nil then
  begin
    ShowError('Oops! Unexpected error [GI.001]. Contact developer.');
    Exit;
  end;

  if Assigned(FActiveFrame) then
  begin
    if TItemEditorBaseFrame(FActiveFrame).Mode <> emPreviewing then
    begin
      ShowWarning('Быстрый переход', 'Выйдите из режима редактирования в главном' + #32 +
        'окне и повторите попытку.');
      Exit;
    end
    else
      Perform(WM_ITEMEDITOR, Integer(mrCancel), 0);
  end;

  if FFilter.Enabled then
  begin
    ShowWarning('Быстрый переход', 'Список был отфильтрован. Для выполнения быстрого' + #32 +
      'перехода отключите все фильтры и повторите попытку.');
    Exit;
  end;

  if Catalogs[Ptr^.Data.DataTag].DB.RecExists(Ptr) then
  begin
    SelectMenu(Ptr^.Data.DataTag);
    ActionRefreshList.Execute;
    for i := 0 to BrowserList.Items.Count - 1 do
      if TBrowserListItem(BrowserList.Items.Objects[i]).RecPtr = Ptr then
      begin
        BrowserList.ItemIndex := i;
        Break;
      end;
    ShowItemEditor(emPreviewing);
  end
  else
    ShowWarning('Устаревшие результаты поиска', 'Невозможно выполнить переход к данной' + #32 +
      'записи, т.к. запись не была найдена в данном каталоге. Это может произойти,' + #32 +
      'либо если данные записи были изменены, либо запись была удалена, а результаты' + #32 +
      'поиска не были обновлены. Рекомендуется повторить попытку поиска.');
end;

procedure TMainForm.HideItemEditor;
begin
  FActiveFrame.Parent := nil; // Hide frame
  TItemEditorBaseFrame(FActiveFrame).Reset; // Reset values to default
  TItemEditorBaseFrame(FActiveFrame).Mode := emHidden;
  FActiveFrame := nil; // Set current frame to NIL

  { Return standart desktop }
  MainToolBar.Show;
  BrowserList.Show;
  DisableCategoriesPanel(False); // Enable categories panel
  ActionList.State := asNormal;  // Turn on all hotkeys
end;

procedure TMainForm.InfoTimerTimer(Sender: TObject);
begin
  RefreshBottomPanel;
end;

procedure TMainForm.InitializeCats;

  procedure SetProgress(const Value: Integer);
  begin
    SplashWelcomeForm.SetProgress(Value); // Set splash progress
  end;

const
  CAT_TITLE: array [0..9] of String = ('Материнские платы', 'Процессоры', 'Оперативная память',
    'Жесткие диски \ SSD', 'Системы охлаждения', 'Блоки питания', 'Видеокарты (VGA)',
    'Звуковые карты', 'CD\DVD\BD-приводы', 'Системные блоки');
  CAT_FILENAME: array [0..9] of String = ('Motherboards', 'CPUs', 'Memory', 'HDDs',
    'Coolant', 'PowerSupplies', 'Graphics', 'Audio', 'ODDs', 'Units');
var
  i: Integer;
  DataPath: String;
begin
  DataPath := ExtractFilePath(Application.ExeName) + 'Data\';

  SetProgress(0);
  Catalogs[DATA_TAG_MOTHERBOARDS].EditorFrame := TItemEditorFrame_MB.Create(Self, Handle, CAT_TITLE[DATA_TAG_MOTHERBOARDS]);
  Catalogs[DATA_TAG_CPU].EditorFrame := TItemEditorFrame_CPU.Create(Self, Handle, CAT_TITLE[DATA_TAG_CPU]);
  SetProgress(6);
  Catalogs[DATA_TAG_MEMORY].EditorFrame := TItemEditorFrame_RAM.Create(Self, Handle, CAT_TITLE[DATA_TAG_MEMORY]);
  Catalogs[DATA_TAG_HDD].EditorFrame := TItemEditorFrame_HDD.Create(Self, Handle, CAT_TITLE[DATA_TAG_HDD]);
  SetProgress(12);
  Catalogs[DATA_TAG_COOLANT].EditorFrame := TItemEditorFrame_COL.Create(Self, Handle, CAT_TITLE[DATA_TAG_COOLANT]);
  Catalogs[DATA_TAG_PWR_SUPPLY].EditorFrame := TItemEditorFrame_PWR.Create(Self, Handle, CAT_TITLE[DATA_TAG_PWR_SUPPLY]);
  SetProgress(18);
  Catalogs[DATA_TAG_GRAPHICS].EditorFrame := TItemEditorFrame_GPU.Create(Self, Handle, CAT_TITLE[DATA_TAG_GRAPHICS]);
  Catalogs[DATA_TAG_AUDIO].EditorFrame := TItemEditorFrame_AUD.Create(Self, Handle, CAT_TITLE[DATA_TAG_AUDIO]);
  SetProgress(24);
  Catalogs[DATA_TAG_OPTICAL_DRIVES].EditorFrame := TItemEditorFrame_ODD.Create(Self, Handle, CAT_TITLE[DATA_TAG_OPTICAL_DRIVES]);
  Catalogs[DATA_TAG_SYS_UNIT].EditorFrame := TItemEditorFrame_UNT.Create(Self, Handle, CAT_TITLE[DATA_TAG_SYS_UNIT]);
  SetProgress(30);

  for i := Low(Catalogs) to High(Catalogs) do
  begin
    with Catalogs[i] do
    begin
      Title := CAT_TITLE[i];
      LastIndex := -1;
      FileName := CAT_FILENAME[i] + '.ccadb';
      DB := TCurseCatalogEngine.Create(DataPath + FileName);
    end;
    SetProgress(30 + i*7 + 2);

    try
      Catalogs[i].DB.RestoreFromFile;
    except
      ShowError('Загрузка данных при инициализации', Format('При восстановлении' + #32 +
        'данных каталога "%s" [%d] произошла ошибка. Вероятно, что данные были' + #32 +
        'повреждены. Рекомендуется, во время создавать резервные копии данных (папка' + #32 +
        '"Data") во избежание потери данных.', [Catalogs[i].Title, i]));
    end;
    SetProgress(30 + i*7 + 7);

    Sleep(50);
    Application.ProcessMessages; // Loading animation
  end;
end;

procedure TMainForm.LoadOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    ActionInfoPanel.Checked := IniFile.ReadBool('Style', 'InfoPanel', True);
    ActionInfoPanelExecute(nil);
    ActionDetailedList.Checked := IniFile.ReadBool('Style', 'DetailedList', False);
    ActionDetailedListExecute(nil);
    ActionShowPreview.Checked := IniFile.ReadBool('Style', 'ListImages', False);
    ActionShowPreviewExecute(nil);
    ActionToolbarCaptions.Checked := IniFile.ReadBool('Style', 'ToolbarCaptions', True);
    ActionToolbarCaptionsExecute(nil);
    ActionStretchPreview.Checked := IniFile.ReadBool('Style', 'StretchPreview', False);
    ActionStretchPreviewExecute(nil);
  finally
    IniFile.Free;
  end;
end;

function TMainForm.MatchingFilter(const Data: TRecCommonData): Boolean;
begin
  Result := True;
  if not FFilter.Enabled then Exit;

  {$WARNINGS OFF}
  if FFilter.Vendor.Enabled and Result then
  begin
    Result := SameText(Data.Vendor, FFilter.Vendor.Values);
  end;
  {$WARNINGS ON}

  if FFilter.Price.Enabled and Result then
  begin
    Result := (Data.MinPrice >= FFilter.Price.MinValue) and
       (Data.MinPrice <= FFilter.Price.MaxValue);
  end;

  if FFilter.ReleaseDate.Enabled and Result then
  begin
    Result := ((Data.ReleaseYear*10 + Data.ReleaseQuater) >= FFilter.ReleaseDate.MinValue) and
      ((Data.ReleaseYear*10 + Data.ReleaseQuater) <= FFilter.ReleaseDate.MaxValue);
  end;
end;

procedure TMainForm.RefreshBottomPanel;
var
  Obj: TBrowserListItem;
  S: String;
  Index: Integer;
begin
  Index := BrowserList.ItemIndex;
  if Index <> -1 then
  begin
    Obj := (BrowserList.Items.Objects[Index] as TBrowserListItem);
    S := GetBLObjTitle(Obj, True, True);
    ItemNameLabel.Caption := Format('[%d\%d] %s', [Index+1, BrowserList.Items.Count, S]);
    S := IntToStr((Obj.RecPtr^.Data.MinPrice + Obj.RecPtr^.Data.MaxPrice) div 2);
    PriceLabel.Caption := Format('Средняя розничная цена: %s$', [S]);
    {$WARNINGS OFF}
    DescriptionLabel.Caption := Obj.RecPtr^.Data.Notes;
    {$WARNINGS ON}
    if Obj.RecPtr^.Picture <> nil then
      ItemImage.Picture.Assign(Obj.RecPtr^.Picture)
    else
      ItemImage.Picture.Assign(ImageCollection.Items.Items[0].PngImage);
    Exit;
  end;

  ItemNameLabel.Caption := 'Каталог: ' + Catalogs[FSelected].Title;
  PriceLabel.Caption := Format('Показано %d записей из %d',
    [BrowserList.Items.Count, Catalogs[FSelected].DB.Count]);
  DescriptionLabel.Caption := '';
  ItemImage.Picture.Assign(ImageCollection.Items.Items[0].PngImage);
end;

procedure TMainForm.RefreshStates;
var
  i: Integer;
  C: TComponent;
begin
  for i := Low(Catalogs) to High(Catalogs) do
  begin
    if i <> 0 then
      C := FindComponent(CatsItemPanel.Name + '_' + IntToStr(i)) // Search for a cats panel
    else
      C := CatsItemPanel; // The 1st panel doesnt contain index at the end of the name

    if C <> nil then
    begin
      with TPanel(Components[i]) do
      begin
        if Catalogs[i].DB.Changed then
          TPanel(C).Caption := Catalogs[i].Title + ' *'
        else
          TPanel(C).Caption := Catalogs[i].Title;
      end;
    end;
  end;

  RefreshBottomPanel;
end;

procedure TMainForm.SaveOptions;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    IniFile.WriteBool('Style', 'InfoPanel', ActionInfoPanel.Checked);
    IniFile.WriteBool('Style', 'DetailedList', ActionDetailedList.Checked);
    IniFile.WriteBool('Style', 'ListImages', ActionShowPreview.Checked);
    IniFile.WriteBool('Style', 'ToolbarCaptions', ActionToolbarCaptions.Checked);
    IniFile.WriteBool('Style', 'StretchPreview', ActionStretchPreview.Checked);
  finally
    IniFile.Free;
  end;
end;

procedure TMainForm.SelectMenu(const Tag: Integer);
var
  C: TComponent;
begin
  Screen.Cursor := crHourGlass; // Change cursor
  try

    if Tag <> 0 then
      C := FindComponent(CatsItemPanel.Name + '_' + IntToStr(Tag)) // Search for a panel
    else
      C := CatsItemPanel; // The 1st panel doesnt contain index at the end of the name

    if C <> nil then
    begin
      if FSelected <> -1 then
        Catalogs[FSelected].LastIndex := BrowserList.ItemIndex; // Save last position

      FSelected := TPanel(C).Tag; // Select new catalog

      SelectionShape.Top := TPanel(C).Top - 2;
      SelectionShape.Left := TPanel(C).Left - 2;
      SelectionShape.Show; // Show highlighting shape

      TPanel(C).Update; // Removes visual bugs

      CategoryLabel.Caption := Catalogs[FSelected].Title; // Set caption
      ActionRefreshList.Execute; // Reload items
      RefreshStates;

      BrowserList.ItemIndex := Catalogs[FSelected].LastIndex; // Restore last item index
    end;

  finally
    Screen.Cursor := crDefault; // Set default cursor
  end;
end;

procedure TMainForm.ShowItemEditor(const Mode: TItemEditorMode);
var
  pRec: PCatalogRecord;
begin
  { Check if all frames are hidden, otherwise show error }
  if Assigned(FActiveFrame) then
  begin
    ShowError('Oops! Unexpected error [SIE.001]. Contact developer.');
    Exit;
  end;

  { Preparing frame desktop }
  MainToolBar.Hide;
  BrowserList.Hide;
  DisableCategoriesPanel;
  ActionList.State := asSuspended; // Turn off all hotkeys

  FActiveFrame := Catalogs[FSelected].EditorFrame; // Setting editor frame as active
  TItemEditorBaseFrame(FActiveFrame).Mode := Mode; // Setting editor mode
  TItemEditorBaseFrame(FActiveFrame).Reset;

  { Loading data into fields }
  if Mode in [emEditing, emPreviewing] then
  begin
    { Get current pointer from list }
    pRec := TBrowserListItem(BrowserList.Items.Objects[BrowserList.ItemIndex]).RecPtr;
    TItemEditorBaseFrame(FActiveFrame).RecPtr := pRec; // Save record pointer
    { Load fields into editor }
    with TItemEditorBaseFrame(FActiveFrame) do
    begin
      SetData(@pRec^.Data);
      SetDataEx(pRec^.LinkedData);

      if Assigned(pRec^.Picture) then
        PreviewImage.Picture.Assign(pRec^.Picture);
    end;
  end;

  FActiveFrame.Align := alClient;
  FActiveFrame.Parent := DesktopPanel; // Assign parent and show frame
end;

procedure TMainForm.UpdateGradLineMask;
begin
  if BrowserList.ItemHeight <> FGradLine.Height then
  begin
    FGradLine.Width := BrowserList.Width - 20;
    FGradLine.Height := BrowserList.ItemHeight;
    FillGradientRect(FGradLine.Canvas.Handle, FGradLine.Width,
      FGradLine.Height, $00F9F9F9, $00D6D6D6);
  end;
end;

procedure TMainForm.WMItemEditorEvent(var Msg: TMessage);
var
  Data: TRecCommonData;
  ExData: Pointer;
  pRec: Pointer;
  Obj: TBrowserListItem;
begin
  ExData := nil;

  if Msg.WParam = Integer(mrOK) then // Check for modal result of frame
  begin
    { Allocating memory for linked data structures }
    { !!! Cleanup function is implemented in CCDBE !!! }
    case FSelected of
      DATA_TAG_MOTHERBOARDS: New(PDataStructMotherboards(ExData));
      DATA_TAG_CPU: New(PDataStructCPU(ExData));
      DATA_TAG_MEMORY: New(PDataStructMemory(ExData));
      DATA_TAG_HDD: New(PDataStructHDD(ExData));
      DATA_TAG_COOLANT: New(PDataStructCoolant(ExData));
      DATA_TAG_PWR_SUPPLY: New(PDataStructPwrSupply(ExData));
      DATA_TAG_GRAPHICS: New(PDataStructGraphics(ExData));
      DATA_TAG_AUDIO: New(PDataStructAudio(ExData));
      DATA_TAG_OPTICAL_DRIVES: New(PDataStructODD(ExData));
      DATA_TAG_SYS_UNIT: New(PDataStructSysUnit(ExData));
    end;

    { Getting data from editor }
    with TItemEditorBaseFrame(FActiveFrame) do
    begin
      GetData(@Data);
      GetDataEx(ExData);
    end;

    case TItemEditorBaseFrame(FActiveFrame).Mode of
      emAdditing: // Editor was opened for appending catalog
        begin
          { Appending catalog }
          with Catalogs[FSelected].DB do
          begin
            case FSelected of
              DATA_TAG_MOTHERBOARDS: Append(@Data, PDataStructMotherboards(ExData));
              DATA_TAG_CPU: Append(@Data, PDataStructCPU(ExData));
              DATA_TAG_MEMORY: Append(@Data, PDataStructMemory(ExData));
              DATA_TAG_HDD: Append(@Data, PDataStructHDD(ExData));
              DATA_TAG_COOLANT: Append(@Data, PDataStructCoolant(ExData));
              DATA_TAG_PWR_SUPPLY: Append(@Data, PDataStructPwrSupply(ExData));
              DATA_TAG_GRAPHICS: Append(@Data, PDataStructGraphics(ExData));
              DATA_TAG_AUDIO: Append(@Data, PDataStructAudio(ExData));
              DATA_TAG_OPTICAL_DRIVES: Append(@Data, PDataStructODD(ExData));
              DATA_TAG_SYS_UNIT: Append(@Data, PDataStructSysUnit(ExData));
            end;

            if TItemEditorBaseFrame(FActiveFrame).PreviewImage.Picture <> nil then
            begin
              LastAdded^.Picture := TPngImage.Create;
              LastAdded^.Picture.Assign(TItemEditorBaseFrame(FActiveFrame).PreviewImage.Picture.Graphic);
            end;

            Obj := CreateBLObj(LastAdded);
            BrowserList.ItemIndex := BrowserList.Items.AddObject(GetBLObjTitle(Obj), Obj);
          end;
        end;

      emEditing:   // Editor was opened for editing existing record
        begin
          { Editing existing record }
          with Catalogs[FSelected].DB do
          begin
            pRec := TItemEditorBaseFrame(FActiveFrame).RecPtr;
            Change(pRec, @Data, ExData); // Changing item's data

            if TItemEditorBaseFrame(FActiveFrame).PreviewImage.Picture <> nil then
            begin
              if not Assigned(PCatalogRecord(pRec)^.Picture) then PCatalogRecord(pRec)^.Picture := TPngImage.Create;
              PCatalogRecord(pRec)^.Picture.Assign(TItemEditorBaseFrame(FActiveFrame).PreviewImage.Picture.Graphic);
            end
            else
              FreeAndNil(PCatalogRecord(pRec)^.Picture);
          end;
          { Refresh title if lbStandard }
          if BrowserList.Style = lbStandard then
          begin
            Obj := TBrowserListItem(BrowserList.Items.Objects[BrowserList.ItemIndex]);
            BrowserList.Items[BrowserList.ItemIndex] := GetBLObjTitle(Obj);
          end;
        end;
    end;
  end;

  RefreshStates;
  BrowserList.Update;
  HideItemEditor; // Hide editor frame and restore standart desktop
end;

procedure TMainForm.ActionCatsInfoExecute(Sender: TObject);
var
  S: String;
begin
  S := Format('Всего записей: %d.' + #10#13 + 'Последнее редактирование было %s.',
    [Catalogs[FSelected].DB.Count, DateTimeToStr(Catalogs[FSelected].DB.EditionDate)]);
  ShowMessage(Format('Информация о каталоге "%s":', [Catalogs[FSelected].Title]), S);
end;

procedure TMainForm.ActionDeleteItemExecute(Sender: TObject);
var
  Index: Integer;
  pRec: PCatalogRecord;
begin
  { Check if multiply items is selected }
  if BrowserList.SelCount = 0 then
  begin
    ShowMessage('Нет выбранных записей!');
    Exit;
  end;

  if ShowConfirmation('Удаление выбранных записей', Format('Удалить %d записей из "%s"?',
  [BrowserList.SelCount, Catalogs[FSelected].Title])) = mrNo then Exit;

  BrowserList.Items.BeginUpdate;
  try
    for Index := 0 to BrowserList.Items.Count - 1 do
      if BrowserList.Selected[Index] then // Searching for selected item
      begin
        pRec := TBrowserListItem(BrowserList.Items.Objects[Index]).RecPtr;

        BrowserList.Items.Objects[Index].Free; // Release object
        Catalogs[FSelected].DB.Delete(pRec); // Delete record
      end;

    BrowserList.DeleteSelected; // Removing all selected items
    RefreshStates;
  finally
    BrowserList.Items.EndUpdate;
  end;
end;

procedure TMainForm.ActionDetailedListExecute(Sender: TObject);
begin
  if ActionDetailedList.Checked then
  begin
    BrowserList.Style := lbOwnerDrawFixed;
    BrowserList.ItemHeight := 50;
  end
  else
    BrowserList.Style := lbStandard;

  ActionShowPreview.Enabled := ActionDetailedList.Checked;
end;

procedure TMainForm.ActionEditItemExecute(Sender: TObject);
begin
  if BrowserList.ItemIndex <> -1 then
    ShowItemEditor(emEditing) // Show editor
  else
    ShowMessage('Нет выбранных записей!');
end;

procedure TMainForm.ActionEraseFilesExecute(Sender: TObject);
var
  FOS: TSHFileOpStruct;
begin
  if MessageDlgEx('Удаление данных с жесткого диска', 'Сейчас будет произведено' + #32 +
    'удаленние с жесткого диска всех данных, связанных с каталогами (записи, изображения' + #32 +
    'и т.д.). Продолжить?', mtWarning, mbYesNo) = mrNo then Exit;

  if MessageDlgEx('Удаление данных с жесткого диска', 'Это действие необратимо!' + #32 +
    'Настоятельно рекомендуется сделать резервную копию папки Data.' + #32 +
    'Чтобы все равно продолжить, подтвердите действие еще раз.', mtWarning, mbYesNo) = mrNo then Exit;

  ZeroMemory(@FOS, Sizeof(TSHFileOpStruct));
  with FOS do
  begin
    Wnd    := Handle;
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_SIMPLEPROGRESS or FOF_NORECURSION;
    pFrom  := PChar(ExtractFilePath(Application.ExeName) + 'Data\*.ccf' + #0);
    lpszProgressTitle := 'Стирание данных';
  end;

  if SHFileOperation(FOS) = 0 then
    ShowMessage('Данные удалены!')
  else
    ShowError('Каталог "Data" не был удален! Возможно, файлы в каталоге используются' + #32 +
      'другой программой. Повторите действие позже.');

  CreateDir('Data');
end;

procedure TMainForm.ActionEraseItemsExecute(Sender: TObject);
begin
  if MessageDlgEx('Очистка каталога', Format('Стереть все записи из каталога "%s"?',
    [Catalogs[FSelected].Title]), mtWarning, mbYesNo) = mrNo then Exit;

  BrowserList.Items.BeginUpdate;
  try
    BrowserList.Items.Clear;
    Catalogs[FSelected].DB.EraseAll;
    RefreshStates;
  finally
    BrowserList.Items.EndUpdate;
  end;
end;

procedure TMainForm.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ActionExportExecute(Sender: TObject);
var
  Dlg: TDataExportDialog;
begin
  Dlg := TDataExportDialog.Create(Application);
  try
    Dlg.ShowModal;
  finally
    Dlg.Free;
  end;
end;

procedure TMainForm.ActionFilterExecute(Sender: TObject);
var
  Dlg: TFilterDialog;
  M: Integer;
begin
  Dlg := TFilterDialog.Create(Application);
  try
    Dlg.SetFilter(FFilter);
    M := Dlg.ShowModal;
    case M of
      mrOK:
        begin
          FFilter := Dlg.Filter;
          FFilter.Enabled := True;
          FilterLabel.Show;
          ActionRefreshList.Execute;
        end;

      mrIgnore:
        begin
          FFilter.Enabled := False;
          FilterLabel.Hide;
          ActionRefreshList.Execute;
        end;

      mrCancel:
        begin
          Exit;
        end;
    end;
  finally
    Dlg.Free;
  end;
end;

procedure TMainForm.ActionInfoPanelExecute(Sender: TObject);
begin
  InfoPanel.Visible := ActionInfoPanel.Checked;
end;

procedure TMainForm.ActionMenuExecute(Sender: TObject);
begin
  ButtonMenu.CheckMenuDropdown;
end;

procedure TMainForm.ActionShowPreviewExecute(Sender: TObject);
begin
  MenuItemPreviewSize.Enabled := ActionShowPreview.Checked;
  ActionPreviewSizeExecute(ActionPreviewSize48);
  BrowserList.Update; // Just repaint
end;

procedure TMainForm.ActionNewItemExecute(Sender: TObject);
begin
  ShowItemEditor(emAdditing);
end;

procedure TMainForm.ActionPreviewItemExecute(Sender: TObject);
begin
  if BrowserList.ItemIndex <> -1 then
    ShowItemEditor(emPreviewing) // Show editor in previewing mode
  else
    ShowMessage('Нет выбранных записей!');
end;

procedure TMainForm.ActionPreviewSizeExecute(Sender: TObject);
begin
  FPreviewSize := TAction(Sender).Tag;
  BrowserList.ItemHeight := FPreviewSize + 4;
  UpdateGradLineMask;
  BrowserList.Repaint;
end;

procedure TMainForm.ActionRefreshListExecute(Sender: TObject);
var
  Current: PCatalogRecord;
  P: String;
  Obj: TBrowserListItem;
begin
  P := '';
  BrowserList.Items.BeginUpdate;
  try
    if BrowserList.ItemIndex <> -1 then
      P := BrowserList.Items[BrowserList.ItemIndex]; // Save current index

    FreeAllBLObjects;
    BrowserList.Clear; // Clear list

    Current := Catalogs[FSelected].DB.First;
    while Current <> nil do
    begin
      if (not FFilter.Enabled) or MatchingFilter(Current^.Data) then
      begin
        Obj := CreateBLObj(Current);
        BrowserList.Items.AddObject(GetBLObjTitle(Obj), Obj);
      end;
      Current := Current^.Next;
    end;

    if P <> '' then
      BrowserList.ItemIndex := BrowserList.Items.IndexOf(P); // Restoring index
  finally
    BrowserList.Items.EndUpdate;
  end;
end;

procedure TMainForm.ActionRestoreExecute(Sender: TObject);
var
  i: Integer;
begin
  if Sender <> nil then
    if ShowConfirmation('Переоткрытие каталогов', 'Хотите перезагрузить данные' + #32 +
      'каталогов из файлов? Все НЕсохраненные данные будут УТЕРЯНЫ.') = mrNo then Exit;

  Screen.Cursor := crHourGlass;
  try
    for i := Low(Catalogs) to High(Catalogs) do
    begin
      try
        Catalogs[i].DB.RestoreFromFile;
      except
        if MessageDlgEx('Ошибка при загрузке данных.',
          Format('Невозможно загрузить данные для каталога "%s".' + CRLF +
          'Ошибка при чтении данных из файла: %s.', [Catalogs[i].Title, Catalogs[i].DB.FileName]),
          mtError, mbYesNo) = mrNo then Break;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  ActionRefreshList.Execute;
end;

procedure TMainForm.ActionSaveExecute(Sender: TObject);
var
  i: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    try
      for i := Low(Catalogs) to High(Catalogs) do
        Catalogs[i].DB.FlushToFile;

      RefreshStates;
      ShowMessage('Сохранение завершено!', 'Все каталоги были успешно сохранены.');
    except
      ShowError('Ошибка сохранения.', 'При попытке сохранить каталоги возникла ошибка!' + CRLF +
        'Возможно, недостаточно прав на запись. Выполните программу от имени администратора.');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.ActionSearchExecute(Sender: TObject);
var
  Dlg: TSearchQueryDialog;
  i: Integer;
  SI: PSearchItem;
  Obj: TBrowserListItem;
begin
  Dlg := TSearchQueryDialog.Create(Application);
  try
    Dlg.SetSearchQuery(FSearchQuery);

    if Dlg.ShowModal = mrOK then
    begin
      FSearchResultsForm.Reset;
      Dlg.GetSearchQuery(FSearchQuery);

      for i := 0 to 9 do
      begin
        if not FSearchQuery.ViewingCats[i] then Continue;

        Catalogs[i].DB.SearchQuery := FSearchQuery;
        Catalogs[i].DB.Search;

        SI := Catalogs[i].DB.SearchQuery.Result;
        while SI <> nil do
        begin
          Obj := CreateBLObj(SI^.Item);
          FSearchResultsForm.SearchList.Items.AddObject(Catalogs[Obj.Category].Title +
            ' >> ' + GetBLObjTitle(Obj), Obj);
          SI := SI^.Next;
        end;
      end;

      with FSearchResultsForm do
      begin
        QueryTextLabel.Caption := Format('Поиск по запросу "%s" завершен!',
          [FSearchQuery.Text]);
        with ResultLabel do
        begin
          Caption := Format('Найдено %d записей в выбранных каталогах.', [SearchList.Items.Count]);
          if SearchList.Items.Count = 0 then
            ResultLabel.Font.Color := clMaroon
          else
            ResultLabel.Font.Color := clGreen;
        end;
        Show;
      end;
    end;

  finally
    Dlg.Free;
  end;
end;

procedure TMainForm.ActionSearchResultsExecute(Sender: TObject);
begin
  FSearchResultsForm.Show;
end;

procedure TMainForm.ActionSortDatesExecute(Sender: TObject);
begin
  Catalogs[FSelected].DB.Sort(sfReleaseDate);
  ActionRefreshList.Execute;
  RefreshStates;
end;

procedure TMainForm.ActionSortIDsExecute(Sender: TObject);
begin
  Catalogs[FSelected].DB.Sort(sfNone);
  ActionRefreshList.Execute;
  RefreshStates;
end;

procedure TMainForm.ActionSortNamesExecute(Sender: TObject);
begin
  Catalogs[FSelected].DB.Sort(sfName);
  ActionRefreshList.Execute;
  RefreshStates;
end;

procedure TMainForm.ActionSortPricesExecute(Sender: TObject);
begin
  Catalogs[FSelected].DB.Sort(sfPrice);
  ActionRefreshList.Execute;
  RefreshStates;
end;

procedure TMainForm.ActionSplashExecute(Sender: TObject);
begin
  ShowSplashDialog;
end;

procedure TMainForm.ActionStretchPreviewExecute(Sender: TObject);
begin
  ItemImage.Stretch := ActionStretchPreview.Checked;
  BrowserList.Repaint;
end;

procedure TMainForm.ActionToolbarCaptionsExecute(Sender: TObject);
begin
  MainToolBar.ShowCaptions := ActionToolbarCaptions.Checked;
end;

procedure TMainForm.BrowserListDblClick(Sender: TObject);
begin
  if BrowserList.ItemIndex <> -1 then ActionPreviewItem.Execute; // Show preview
end;

procedure TMainForm.BrowserListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  List: TCustomListBox absolute Control;
  S: String;
  Rec: PCatalogRecord;
  W, H: Integer;
  SrcRect: TRect;
begin
  {$WARNINGS OFF}
  DrawListItemBackground(List, Index, Rect, State);
  if Index = -1 then Exit;

  Rec := TBrowserListItem(List.Items.Objects[Index]).RecPtr;

  with List.Canvas, Rec.Data do
  begin
    Brush.Style := bsClear;

    { *** Preview *** }
    if ActionShowPreview.Checked and (Rec^.Picture <> nil) then
    begin
      SrcRect := Rect;
      with SrcRect do
      begin
        Inc(SrcRect.Left, 2);
        Inc(SrcRect.Top, 2);
        Right := Left + FPreviewSize;
        Bottom := Top + FPreviewSize;
      end;

      if not ActionStretchPreview.Checked then
        BitBlt(List.Canvas.Handle, SrcRect.Left, SrcRect.Top, FPreviewSize, FPreviewSize,
          Rec^.Picture.Canvas.Handle, Rec^.Picture.Width div 2 - FPreviewSize div 2,
          Rec^.Picture.Height div 2 - FPreviewSize div 2, SRCCOPY)
      else
        List.Canvas.StretchDraw(SrcRect, Rec^.Picture);

      Inc(Rect.Left, 6 + FPreviewSize); // Increase LEFT (fixed) - 4px border
    end
    else
      Inc(Rect.Left, 4);

    { Adjusting... }
    Inc(Rect.Left, 2);
    Dec(Rect.Bottom, 2);

    { *** Price *** }
    Font.Style := [fsBold];
    Font.Size  := 12;
    Font.Name  := 'Arial'; // CHANGE FONT
    Font.Color := clGreen;

    if (MaxPrice > MinPrice) then
      S := IntToStr(MinPrice) + '$..' + IntToStr(MaxPrice) + '$'
    else
      if MinPrice <> 0 then
        S := IntToStr(MinPrice) + '$'
      else
        S := '[x]';

    W := TextWidth(S);
    if FPreviewSize > 96 then Inc(W, 6);

    TextOut(Rect.Right - W - 8, Rect.Top + (BrowserList.ItemHeight div 2 - TextHeight(S) div 2) - 2, S);

    Dec(Rect.Right, W + 12); // Decrease RIGHT

    if FPreviewSize > 64 then
    begin
      Inc(Rect.Top, FPreviewSize div 32);
      Inc(Rect.Left, FPreviewSize div 32);
      Font.Size := Font.Size + 2;
    end;

    { *** Title *** }
    Font.Name  := 'Tahoma'; // CHANGE FONT
    Font.Color := clWindowText;

    Inc(Rect.Top, 2);

    S := GetBLObjTitle(TBrowserListItem(List.Items.Objects[Index]), True, True);
    TextOut(Rect.Left, Rect.Top, S);
    W := TextWidth(S);
    H := TextHeight(S);

    Inc(Rect.Top, H); // Increase TOP

    { *** Product ID *** }
    if Rec.Data.ProductID <> '' then
    begin
      Font.Size  := 8;
      Font.Style := [];
      Font.Color := clGray;

      Dec(Rect.Top, H);

      S := '[' + Rec.Data.ProductID + ']';
      TextOut(Rect.Left + W + 4, Rect.Top + 2, S);

      Inc(Rect.Top, H);
    end;

    Font.Name  := 'Arial'; // CHANGE FONT

    { *** Custom info *** }
    Inc(Rect.Top, 2);

    Font.Size := 8;
    if FPreviewSize > 64 then Font.Size := Font.Size + 2;

    Font.Style := [];
    Font.Color := clWindowText;

    S := Catalogs[FSelected].EditorFrame.GetShortDescription(Rec^.LinkedData) + '.';
    DrawText(List.Canvas.Handle, PChar(S), Length(S), Rect, DT_WORDBREAK);
  end;
  {$WARNINGS ON}
end;

procedure TMainForm.BrowserListKeyPress(Sender: TObject; var Key: Char);
begin
  RefreshBottomPanel;
end;

procedure TMainForm.BrowserListMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  RefreshBottomPanel;
end;

procedure TMainForm.CatsItemPanelClick(Sender: TObject);
begin
  SelectMenu(TPanel(Sender).Tag); // Select catalog
end;

procedure TMainForm.CatsItemPanelMouseEnter(Sender: TObject);
begin
  GhostShape.Top := TPanel(Sender).Top - 2;
  GhostShape.Left := TPanel(Sender).Left - 2;
  GhostShape.Show; // Show highlight

  TPanel(Sender).Update; // Removes visual bugs
end;

procedure TMainForm.CatsItemPanelMouseLeave(Sender: TObject);
begin
  GhostShape.Hide; // Hide highlight
end;

procedure TMainForm.DisableCategoriesPanel(const Disabled: Boolean);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) and
      (TPanel(Components[i]).Parent = CategoriesPanel) then
    begin
      with TPanel(Components[i]) do
      begin
        Enabled := not Disabled;
        if Disabled and (Tag <> FSelected) then
          Font.Color := clGrayText    // Grayscale text if disabled
        else
          Font.Color := clWindowText;
      end;
    end;
end;

procedure TMainForm.DrawListItemBackground(List: TCustomListBox;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  HLRect: TRect; // Highlighted rectangle
begin
  with List.Canvas do
  begin
    if (Index <> -1) and (odSelected in State) then
    begin
      HLRect := Rect;

      if ActionShowPreview.Checked then
        Inc(HLRect.Left, FPreviewSize + 3);

      List.Canvas.StretchDraw(HLRect, FGradLine);

      Brush.Style := bsClear;
      Pen.Color := clGray;
      Pen.Style := psSolid;
      Rectangle(Rect);
    end
    else
      FillRect(Rect);
  end;
end;

end.
