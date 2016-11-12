unit CCDBv2;

interface

uses
  SysUtils, Classes, pngimage, Dialog.Message;

const
  CCDB_VERSION = '7B043E.1';

type
  DATA_STRUCT_MOTHERBOARDS = record
    CPU           : Byte;
    Socket        : String[15];
    Chipset       : String[31];
    FormFactor    : Byte;
    MemType       : Byte;
    MemChannels   : Byte;
  end;
  PDataStructMotherboards = ^DATA_STRUCT_MOTHERBOARDS;

  DATA_STRUCT_CPU = record
    Architecture  : String[31];
    Socket        : String[15];
    Frequency     : Word;
    Cores         : Byte;
    Graphics      : Byte;
  end;
  PDataStructCPU = ^DATA_STRUCT_CPU;

  DATA_STRUCT_MEMORY = record
    BankType      : Byte;
    Frequency     : Byte;
    Capacity      : Word;
    SupportsXMP   : Boolean;
    SupportsECC   : Boolean;
    Latency       : Byte;
    Voltage       : Byte;
  end;
  PDataStructMemory = ^DATA_STRUCT_MEMORY;

  DATA_STRUCT_HDD = record
    MediaType     : Byte;
    FormFactor    : Byte;
    ConnInterface : Byte;
    Capacity      : Word;
    BufferSize    : Word;
    FlashType     : Byte;
  end;
  PDataStructHDD = ^DATA_STRUCT_HDD;

  DATA_STRUCT_COOLANT = record
    Purpose       : Byte;
    CoolantType   : Byte;
    Material      : Byte;
    Dissepation   : Word;
    Diameter      : Byte;
    NoiseLevel    : Word;
    SupDevices    : String[255];
  end;
  PDataStructCoolant = ^DATA_STRUCT_COOLANT;

  DATA_STRUCT_PWR_SUPPLY = record
    Standard      : Byte;
    Scheme12V     : Byte;
    Watts         : Word;
    Efficiency    : Word;
    ActivePFC     : Boolean;
    Cert80        : Byte;
  end;
  PDataStructPwrSupply = ^DATA_STRUCT_PWR_SUPPLY;

  DATA_STRUCT_GRAPHICS = record
    GPU           : String[31];
    ConnInterface : Byte;
    Cooling       : Byte;
    Width         : Word;
    GPUFreq       : Word;
    MemFreq       : Word;
    Bus           : Byte;
    MemType       : Byte;
    DirectX       : Byte;
    SLI           : Boolean;
    HDMI          : Boolean;
  end;
  PDataStructGraphics = ^DATA_STRUCT_GRAPHICS;

  DATA_STRUCT_AUDIO = record
    Format        : Byte;
    ConnInterface : Byte;
    Channels      : Byte;
    DAC_Freq      : Byte;
    DAC_Word      : Byte;
    ADC_Freq      : Byte;
    ADC_Word      : Byte;
    PhonesOut     : Boolean;
    MicIn         : Boolean;
    LineIn        : Boolean;
    Coaxical      : Boolean;
    HDMI          : Boolean;
    MIDI          : Boolean;
    Instrumental  : Boolean;
  end;
  PDataStructAudio = ^DATA_STRUCT_AUDIO;

  DATA_STRUCT_OPTICAL_DRIVE = record
    Format        : Byte;
    ConnInterface : Byte;
    SupprtMedia   : Byte;
    DiskFlashing  : Byte;
    ReadSpeed     : Byte;
    WriteSpeed    : Byte;
  end;
  PDataStructODD = ^DATA_STRUCT_OPTICAL_DRIVE;

  DATA_STRUCT_SYS_UNIT = record
    Format        : Byte;
    FormFactor    : Byte;
    Material      : Byte;
    Color         : Byte;
    DustFilters   : Boolean;
    Display       : Boolean;
    USB30Support  : Boolean;
    AppleDock     : Boolean;
  end;
  PDataStructSysUnit = ^DATA_STRUCT_SYS_UNIT;

const
  DATA_TAG_MOTHERBOARDS = 0;
  DATA_TAG_CPU = 1;
  DATA_TAG_MEMORY = 2;
  DATA_TAG_HDD = 3;
  DATA_TAG_COOLANT = 4;
  DATA_TAG_PWR_SUPPLY = 5;
  DATA_TAG_GRAPHICS = 6;
  DATA_TAG_AUDIO = 7;
  DATA_TAG_OPTICAL_DRIVES = 8;
  DATA_TAG_SYS_UNIT = 9;

type
  TRecCommonData = record
    DataTag         : Byte; // Specifies data structure type [DATA_TAG_xxxx] (not data at all)
    Vendor          : String[31];
    Model           : String[63];
    ProductID       : String[31];
    Notes           : String[191];
    ReleaseYear     : Word;
    ReleaseQuater   : Byte;
    MinPrice        : Word;
    MaxPrice        : Word;
    AttachSize      : LongWord;
  end;
  PRecCommonData = ^TRecCommonData;

  PCatalogRecord = ^TCatalogRecord;
  TCatalogRecord = record
    ID: Cardinal;             // ID
    Data: TRecCommonData;     // Common data
    LinkedData: Pointer;      // Linked data pointer (extended)
    Picture: TPngImage;
    BytesAlloc: Cardinal;     // Specifies number of bytes allocated for linked data structure
    Changed: Boolean;         // Specifies if record was changed after the last save\reset
    Next: PCatalogRecord;     // Next
    Previous: PCatalogRecord; // Previous
  end;

  TSearchViewingField  = (vfVendor, vfModel, vfProductID, vfNotes, vfPrice);
  TSearchViewingFields = set of TSearchViewingField;

  PSearchItem = ^TSearchItem;
  TSearchItem = record
    Item: PCatalogRecord;
    MatchingFields: TSearchViewingFields;
    Next: PSearchItem;
  end;

  TSearchQuery = record
    { Opts. }
    Text: String;                         // Text to find
    ViewingCats: array [0..9] of Boolean; // Viewing categories
    ViewingFields: TSearchViewingFields;  // Viewing fields
    CaseSensitive: Boolean;               // Defines if search is case sensitive
    WholeMatch: Boolean;                  // Defines if search is only by the whole words
    StartFromCursor: Boolean;             //
    { Result }
    Result: PSearchItem;                  // First search record
    Count: Integer;                       // Total number of search records
  end;

  TCatalogFileHeader = record
    Count: Word;
    EditionDate: TDateTime;
  end;

  TSortingField = (sfNone, sfDataTag, sfName, sfPrice, sfReleaseDate);

  ECurseCatalogEngine = class(Exception);

  TCurseCatalogEngine = class(TPersistent)
  private
    FFirst: PCatalogRecord;
    FLastAdded: PCatalogRecord;
    FChanged: Boolean;
    FCount: Integer;
    FNextID: Cardinal;
    FBytesAllocated: Cardinal;
    FFileName: String;
    FSearchQuery: TSearchQuery;
    FSorted: Boolean;
  private
    FEditionDate: TDateTime;
    { *** }
    function LocateStruct(const ID: Cardinal): PCatalogRecord;
    procedure SetSearchQuery(const Value: TSearchQuery);
  public
    constructor Create(const AFileName: String);
     destructor Destroy; override;
    { *** }
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructMotherboards); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructCPU); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructMemory); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructHDD); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructCoolant); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructPwrSupply); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructGraphics); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructAudio); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructODD); overload;
    procedure Append(const Data: PRecCommonData; const ExData: PDataStructSysUnit); overload;
    { *** }
    procedure Insert(const ADataTag: Integer; const AData: PRecCommonData;
      const AExData: Pointer; const Size: Cardinal);
    { *** }
    procedure Change(const ID: Cardinal; const AData: PRecCommonData;
      const AExData: Pointer); overload;
    procedure Change(const Rec: PCatalogRecord; const AData: PRecCommonData;
      const AExData: Pointer); overload;
    { *** }
    procedure Delete(const ID: Cardinal); overload;
    procedure Delete(const Rec: PCatalogRecord; const OnlyDispose: Boolean = False); overload;
    procedure EraseAll;
    { *** }
    procedure RestoreFromFile;
    procedure FlushToFile;
    { *** }
    procedure Search;
    function  RecExists(const Rec: PCatalogRecord): Boolean;
    { *** }
    procedure Sort(const SortByField: TSortingField);
    { *** }
    property First: PCatalogRecord read FFirst;
    property LastAdded: PCatalogRecord read FLastAdded;
    property Changed: Boolean read FChanged;
    property Count: Integer read FCount;
    property FileName: String read FFileName write FFileName;
    property Sorted: Boolean read FSorted;
    property EditionDate: TDateTime read FEditionDate;
    { *** }
    property SearchQuery: TSearchQuery read FSearchQuery write SetSearchQuery;
  end;

{ Safely removes search result & ptrs. }
procedure ClearSearchResults(var Query: TSearchQuery);

implementation

procedure ClearSearchResults(var Query: TSearchQuery);
var
  Q, P: PSearchItem;
begin
  P := Query.Result;
  while P <> nil do
  begin
    Q := P;
    Dispose(Q);
    P := P^.Next;
  end;

  Query.Count := 0;
end;

{ TCurseCatalogEngine }

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructMotherboards);
begin
  Insert(DATA_TAG_MOTHERBOARDS, Data, ExData, Sizeof(DATA_STRUCT_MOTHERBOARDS));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructCPU);
begin
  Insert(DATA_TAG_CPU, Data, ExData, Sizeof(DATA_STRUCT_CPU));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructMemory);
begin
  Insert(DATA_TAG_MEMORY, Data, ExData, Sizeof(DATA_STRUCT_MEMORY));
end;

procedure TCurseCatalogEngine.Delete(const ID: Cardinal);
const
  ERR_BAD_ID = 'Method DELETE was called with invalid arguments: ID does not exists!';
var
  Rec: PCatalogRecord;
begin
  Rec := LocateStruct(ID);
  if not Assigned(Rec) then
    raise ECurseCatalogEngine.Create(ERR_BAD_ID);
  Delete(Rec);
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructPwrSupply);
begin
  Insert(DATA_TAG_PWR_SUPPLY, Data, ExData, Sizeof(DATA_STRUCT_PWR_SUPPLY));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructCoolant);
begin
  Insert(DATA_TAG_COOLANT, Data, ExData, Sizeof(DATA_STRUCT_COOLANT));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructHDD);
begin
  Insert(DATA_TAG_HDD, Data, ExData, Sizeof(DATA_STRUCT_HDD));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructGraphics);
begin
  Insert(DATA_TAG_GRAPHICS, Data, ExData, Sizeof(DATA_STRUCT_GRAPHICS));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructSysUnit);
begin
  Insert(DATA_TAG_SYS_UNIT, Data, ExData, Sizeof(DATA_STRUCT_SYS_UNIT));
end;

procedure TCurseCatalogEngine.Change(const ID: Cardinal; const AData: PRecCommonData;
  const AExData: Pointer);
const
  ERR_BAD_ID = 'Method CHANGE was called with invalid arguments: ID does not exists!';
var
  Rec: PCatalogRecord;
begin
  Rec := LocateStruct(ID);
  if not Assigned(Rec) then
    raise ECurseCatalogEngine.Create(ERR_BAD_ID);
  Change(Rec, AData, AExData);
end;

procedure TCurseCatalogEngine.Change(const Rec: PCatalogRecord; const AData: PRecCommonData;
  const AExData: Pointer);
const
  ERR_INVALID_PTR = 'Method CHANGE was called, but no pointer was specified.';
begin
  if not Assigned(Rec) or not Assigned(AExData) then
    raise ECurseCatalogEngine.Create(ERR_INVALID_PTR);

  AData^.DataTag := Rec^.Data.DataTag;
  AData^.AttachSize := Rec^.Data.AttachSize;
  Rec^.Data := AData^;
    
  Rec^.Changed := True;

  { Previously delete old data }
  case Rec^.Data.DataTag of
    DATA_TAG_MOTHERBOARDS: Dispose(PDataStructMotherboards(Rec^.LinkedData));
    DATA_TAG_CPU: Dispose(PDataStructCPU(Rec^.LinkedData));
    DATA_TAG_MEMORY: Dispose(PDataStructMemory(Rec^.LinkedData));
    DATA_TAG_HDD: Dispose(PDataStructHDD(Rec^.LinkedData));
    DATA_TAG_COOLANT: Dispose(PDataStructCoolant(Rec^.LinkedData));
    DATA_TAG_PWR_SUPPLY: Dispose(PDataStructPwrSupply(Rec^.LinkedData));
    DATA_TAG_GRAPHICS: Dispose(PDataStructGraphics(Rec^.LinkedData));
    DATA_TAG_AUDIO: Dispose(PDataStructAudio(Rec^.LinkedData));
    DATA_TAG_OPTICAL_DRIVES: Dispose(PDataStructODD(Rec^.LinkedData));
    DATA_TAG_SYS_UNIT: Dispose(PDataStructSysUnit(Rec^.LinkedData));
  end;
  Rec^.LinkedData := AExData;

  FChanged := True;
  FSorted := False;
end;

constructor TCurseCatalogEngine.Create(const AFileName: String);
begin
  inherited Create;

  FNextID := 0;
  FFirst := nil;
  FLastAdded := nil;
  FCount := 0;
  FChanged := False;
  FBytesAllocated := 0;
  FFileName := AFileName;
  FSorted := True;
  FEditionDate := Now;
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructODD);
begin
  Insert(DATA_TAG_OPTICAL_DRIVES, Data, ExData, Sizeof(DATA_STRUCT_OPTICAL_DRIVE));
end;

procedure TCurseCatalogEngine.Append(const Data: PRecCommonData;
  const ExData: PDataStructAudio);
begin
  Insert(DATA_TAG_AUDIO, Data, ExData, Sizeof(DATA_STRUCT_AUDIO));
end;

procedure TCurseCatalogEngine.Delete(const Rec: PCatalogRecord; const OnlyDispose: Boolean = False);
const
  ERR_INVALID_PTR = 'Method DELETE was called, but no pointer was specified.';
begin
  if not Assigned(Rec) then
    raise ECurseCatalogEngine.Create(ERR_INVALID_PTR);

  if not OnlyDispose then
  begin
    if Rec^.Next <> nil then
      Rec^.Next^.Previous := Rec^.Previous;
    if Rec^.Previous <> nil then
      Rec^.Previous^.Next := Rec^.Next;

    if Rec = FFirst then
      FFirst := Rec^.Next;
    if Rec = FLastAdded then
      FLastAdded := Rec^.Previous;
  end;

  case Rec^.Data.DataTag of
    DATA_TAG_MOTHERBOARDS: Dispose(PDataStructMotherboards(Rec^.LinkedData));
    DATA_TAG_CPU: Dispose(PDataStructCPU(Rec^.LinkedData));
    DATA_TAG_MEMORY: Dispose(PDataStructMemory(Rec^.LinkedData));
    DATA_TAG_HDD: Dispose(PDataStructHDD(Rec^.LinkedData));
    DATA_TAG_COOLANT: Dispose(PDataStructCoolant(Rec^.LinkedData));
    DATA_TAG_PWR_SUPPLY: Dispose(PDataStructPwrSupply(Rec^.LinkedData));
    DATA_TAG_GRAPHICS: Dispose(PDataStructGraphics(Rec^.LinkedData));
    DATA_TAG_AUDIO: Dispose(PDataStructAudio(Rec^.LinkedData));
    DATA_TAG_OPTICAL_DRIVES: Dispose(PDataStructODD(Rec^.LinkedData));
    DATA_TAG_SYS_UNIT: Dispose(PDataStructSysUnit(Rec^.LinkedData));
  end;
  FreeAndNil(Rec^.Picture);
  Dispose(Rec);

  if not OnlyDispose then
  begin
    Dec(FCount);
    Dec(FBytesAllocated, Rec^.BytesAlloc);

    FChanged := True;
  end;
end;

destructor TCurseCatalogEngine.Destroy;
begin
  EraseAll;
  inherited;
end;

procedure TCurseCatalogEngine.EraseAll;
var
  Current, P: PCatalogRecord;
begin
  Current := FFirst;
  while Current <> nil do
  begin
    P := Current;
    Current := Current^.Next;
    Delete(P, True);
  end;

  ClearSearchResults(FSearchQuery);

  FFirst := nil;
  FLastAdded := nil;
  FCount := 0;
  FChanged := True;
  FBytesAllocated := 0;
  FSorted := True;
end;

procedure TCurseCatalogEngine.FlushToFile;
var
  Stream: TFileStream;
  PicStream: TMemoryStream;
  BufferID: array [0..4] of Char;
  Header: TCatalogFileHeader;
  P: PCatalogRecord;
  Size: Cardinal;
begin
  Stream := TFileStream.Create(FFileName, fmCreate);
  try
    Stream.Size := 0;

    BufferID[0] := 'C';
    BufferID[1] := 'C';
    BufferID[2] := 'D';
    BufferID[3] := 'B';
    BufferID[4] := 'F';
    Stream.WriteBuffer(BufferID, Sizeof(BufferID)); // Write file identification chars

    with Header do
    begin
      Count := FCount;
      EditionDate := Now;
    end;
    Stream.WriteBuffer(Header, Sizeof(TCatalogFileHeader)); // Write file header

    P := FFirst;
    while P <> nil do
    begin
      { Check for attached resource }
      if P^.Picture <> nil then
      begin
        PicStream := TMemoryStream.Create;
        try
          P^.Picture.SaveToStream(PicStream);

          if PicStream.Size > High(Word) then
          begin
            ShowWarning('Resource is invalid.', Format('The attached resource size' + #32 +
              'must be less that 65535 bytes. Attachment will be not saved. Item [ID:%d]: %s %s.',
              [P^.ID, P^.Data.Vendor, P^.Data.Model]));
            P^.Data.AttachSize := 0;
          end
          else
            P^.Data.AttachSize := PicStream.Size;

        finally
          FreeAndNil(PicStream);
        end;
      end
      else
        P^.Data.AttachSize := 0;

      { Saving data }
      Stream.WriteBuffer(P^.Data, Sizeof(TRecCommonData));
      case P^.Data.DataTag of
        DATA_TAG_MOTHERBOARDS: Size := Sizeof(DATA_STRUCT_MOTHERBOARDS);
        DATA_TAG_CPU: Size := Sizeof(DATA_STRUCT_CPU);
        DATA_TAG_MEMORY: Size := Sizeof(DATA_STRUCT_MEMORY);
        DATA_TAG_HDD: Size := Sizeof(DATA_STRUCT_HDD);
        DATA_TAG_COOLANT: Size := Sizeof(DATA_STRUCT_COOLANT);
        DATA_TAG_PWR_SUPPLY: Size := Sizeof(DATA_STRUCT_PWR_SUPPLY);
        DATA_TAG_GRAPHICS: Size := Sizeof(DATA_STRUCT_GRAPHICS);
        DATA_TAG_AUDIO: Size := Sizeof(DATA_STRUCT_AUDIO);
        DATA_TAG_OPTICAL_DRIVES: Size := Sizeof(DATA_STRUCT_OPTICAL_DRIVE);
        DATA_TAG_SYS_UNIT: Size := Sizeof(DATA_STRUCT_SYS_UNIT);
        else
          Size := 0;
      end;
      Stream.WriteBuffer(P^.LinkedData^, Size);

      { Saving attached resource }
      if P^.Picture <> nil then P^.Picture.SaveToStream(Stream);

      P^.Changed := False;
      P := P^.Next;
    end;

    FChanged := False;
  finally
    Stream.Free;
  end;
end;

procedure TCurseCatalogEngine.Insert(const ADataTag: Integer; const AData: PRecCommonData;
  const AExData: Pointer; const Size: Cardinal);
var
  P: PCatalogRecord;
begin
  New(P);

  with P^ do
  begin
    ID := FNextID;
    Data := AData^;
    LinkedData := AExData;
    Data.DataTag := ADataTag;
    Changed := True;
    Next := nil;
    Previous := nil;
  end;

  if FFirst <> nil then
  begin
    FLastAdded^.Next := P;
    P^.Previous := FLastAdded;
  end
  else
    FFirst := P;

  FLastAdded := P;

  Inc(FNextID);
  Inc(FCount);
  Inc(FBytesAllocated, Size);

  FChanged := True;
  FSorted := False;
end;

function TCurseCatalogEngine.LocateStruct(const ID: Cardinal): PCatalogRecord;
begin
  Result := FFirst;
  while Result <> nil do
  begin
    if Result^.ID = ID then
      Exit
    else
      Result := Result^.Next;
  end;
  Result := nil;
end;

function TCurseCatalogEngine.RecExists(const Rec: PCatalogRecord): Boolean;
var
  P: PCatalogRecord;
begin
  Result := True;

  P := FFirst;
  while P <> nil do
  begin
    if P = Rec then
      Exit;
    P := P^.Next;
  end;
  
  Result := False;
end;

procedure TCurseCatalogEngine.RestoreFromFile;
var
  Stream: TFileStream;
  PicStream: TMemoryStream;
  BufferID: array [0..4] of Char;
  Header: TCatalogFileHeader;
  i: Integer;
  Data: TRecCommonData;
  ExData: Pointer;
begin
  if not FileExists(FFileName) then Exit;

  Stream := TFileStream.Create(FFileName, fmOpenRead);
  try
    Stream.Position := 0;
    Stream.ReadBuffer(BufferID, Sizeof(BufferID));

    if (BufferID[0] <> 'C') or (BufferID[1] <> 'C') or (BufferID[2] <> 'D') or
       (BufferID[3] <> 'B') or (BufferID[4] <> 'F') then
    begin
      raise ECurseCatalogEngine.CreateFmt('Could not load file.' + #13#10 +
        'File is not native: %s.', [FFileName]);
      Exit;
    end;

    EraseAll;
    Stream.ReadBuffer(Header, Sizeof(TCatalogFileHeader));
    FEditionDate := Header.EditionDate;

    for i := 1 to Header.Count do
    begin
      // ExData := nil;
      Stream.ReadBuffer(Data, Sizeof(TRecCommonData));

      case Data.DataTag of
        DATA_TAG_MOTHERBOARDS:
          begin
            New(PDataStructMotherboards(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_MOTHERBOARDS));
            Append(@Data, PDataStructMotherboards(ExData));
          end;
        DATA_TAG_CPU:
          begin
            New(PDataStructCPU(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_CPU));
            Append(@Data, PDataStructCPU(ExData));
          end;
        DATA_TAG_MEMORY:
          begin
            New(PDataStructMemory(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_MEMORY));
            Append(@Data, PDataStructMemory(ExData));
          end;
        DATA_TAG_HDD:
          begin
            New(PDataStructHDD(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_HDD));
            Append(@Data, PDataStructHDD(ExData));
          end;
        DATA_TAG_COOLANT:
          begin
            New(PDataStructCoolant(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_COOLANT));
            Append(@Data, PDataStructCoolant(ExData));
          end;
        DATA_TAG_PWR_SUPPLY:
          begin
            New(PDataStructPwrSupply(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_PWR_SUPPLY));
            Append(@Data, PDataStructPwrSupply(ExData));
          end;
        DATA_TAG_GRAPHICS:
          begin
            New(PDataStructGraphics(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_GRAPHICS));
            Append(@Data, PDataStructGraphics(ExData));
          end;
        DATA_TAG_AUDIO:
          begin
            New(PDataStructAudio(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_AUDIO));
            Append(@Data, PDataStructAudio(ExData));
          end;
        DATA_TAG_OPTICAL_DRIVES:
          begin
            New(PDataStructODD(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_OPTICAL_DRIVE));
            Append(@Data, PDataStructODD(ExData));
          end;
        DATA_TAG_SYS_UNIT:
          begin
            New(PDataStructSysUnit(ExData));
            Stream.ReadBuffer(ExData^, Sizeof(DATA_STRUCT_SYS_UNIT));
            Append(@Data, PDataStructSysUnit(ExData));
          end;
        else
          raise ECurseCatalogEngine.Create('Oops! Invalid data tag. Terminated.');
      end;

      { Load attached resource }
      if Data.AttachSize > 0 then
      begin
        FLastAdded^.Picture := TPngImage.Create;
        try
          PicStream := TMemoryStream.Create;
          try
            PicStream.CopyFrom(Stream, Data.AttachSize);
            PicStream.Position := 0;
            FLastAdded^.Picture.LoadFromStream(PicStream);
          finally
            PicStream.Free;
          end;
        except
          FreeAndNil(FLastAdded^.Picture);
          EraseAll;
          ShowError('Invalid resource.', Format('An exception has raised when loading' + #32 +
            'catalog "%s". Invalid PNG resource attached to record [%d].', [FFileName, i]));
          Exit;
        end;
      end;
    end;

    FChanged := False;
    FSorted := False;
  finally
    Stream.Free;
  end;
end;

procedure TCurseCatalogEngine.Search;

  procedure _AppendList(const ASI: TSearchItem; var ASQ: TSearchQuery);
  var
    P,Q: PSearchItem;
  begin
    P := ASQ.Result;

    if P <> nil then
    begin
      while P^.Next <> nil do
        P := P^.Next;
    end;

    New(Q);
    Q^ := ASI;
    Q^.Next := nil;

    if P <> nil then
      P^.Next := Q
    else
      ASQ.Result := Q;

    Inc(ASQ.Count);
  end;

var
  SQ: ^TSearchQuery;
  SI: TSearchItem;
  S1, S2: String;
  Matching: Boolean;
  P: PCatalogRecord;
  F: TSearchViewingField;
  Price: Integer;
begin
  SQ := @FSearchQuery;
  ClearSearchResults(FSearchQuery);

  if not SQ^.CaseSensitive then
    S1 := AnsiUpperCase(SQ^.Text)
  else
    S1 := SQ^.Text;

  if vfPrice in SQ^.ViewingFields then
    if not TryStrToInt(SQ^.Text, Price) then
      raise ECurseCatalogEngine.Create('Oops! Price is not valid in search query. Canceled.');

  P := FFirst;
  while P <> nil do
  begin
    Matching := False;

    SI.Item := P;
    SI.MatchingFields := [];

    if not (vfPrice in SQ^.ViewingFields) then
    begin
      for F := vfVendor to vfNotes do
      begin
        {$WARNINGS OFF}
        case F of
          vfVendor: S2 := P^.Data.Vendor;
          vfModel: S2 := P^.Data.Model;
          vfProductID: S2 := P^.Data.ProductID;
          vfNotes: S2 := P^.Data.Notes;
        end;
        {$WARNINGS ON}

        if not SQ^.CaseSensitive then
          S2 := AnsiUpperCase(S2);

        if SQ^.WholeMatch then
          Matching := Matching or (S1 = S2)
        else
          Matching := Matching or (Pos(S1,S2) > 0);

        if Matching then
          SI.MatchingFields := SI.MatchingFields + [F];
      end;
    end
    else
      if (StrToInt(SQ^.Text) >= P^.Data.MinPrice) and
         (StrToInt(SQ^.Text) <= P^.Data.MaxPrice) then
        Matching := True;      

    if Matching then _AppendList(SI, FSearchQuery);

    P := P^.Next;
  end;
end;

procedure TCurseCatalogEngine.SetSearchQuery(const Value: TSearchQuery);
begin
  ClearSearchResults(FSearchQuery);
  FSearchQuery := Value;
end;

procedure TCurseCatalogEngine.Sort(const SortByField: TSortingField);
var
  Current: PCatalogRecord;
  Ptrs: array of PCatalogRecord;
  Index: Integer;
  { Sort }
  K: Integer;
  J: Integer;
  Temp: PCatalogRecord;
  S1, S2: String;
  W: Boolean;
begin
  FSorted := True;
  if FCount = 0 then Exit;

  SetLength(Ptrs, FCount);

  { Filling the array with pointers }
  Current := FFirst;
  for Index := Low(Ptrs) to High(Ptrs) do
  begin
    Ptrs[Index] := Current;
    Current := Current^.Next;
  end;

  { Sorting array with "floating" bubble sort }
  {$WARNINGS OFF}
  Index := Low(Ptrs) + 1;
  while Index <= High(Ptrs) do
  begin
    K := Index;
    J := High(Ptrs);
    while J >= Index do
    begin
      W := False;
      
      case SortByField of
        sfNone:
          begin
            W := Ptrs[J]^.ID < Ptrs[J-1]^.ID;
          end;
          
        sfDataTag: // Sorting by data tag and name
          begin            
            S1 := Ptrs[J]^.Data.Vendor + #32 + Ptrs[J]^.Data.Model;
            S2 := Ptrs[J-1]^.Data.Vendor + #32 + Ptrs[J-1]^.Data.Model;
            W  := Ptrs[J]^.Data.DataTag < Ptrs[J-1]^.Data.DataTag;
            W  := W and not (CompareText(S1, S2) < 0);
          end;

        sfName:
          begin
            S1 := Ptrs[J]^.Data.Vendor + #32 + Ptrs[J]^.Data.Model;
            S2 := Ptrs[J-1]^.Data.Vendor + #32 + Ptrs[J-1]^.Data.Model;
            W  := CompareText(S1, S2) < 0;
          end;

        sfPrice:
          begin
            W := Ptrs[J]^.Data.MinPrice < Ptrs[J-1]^.Data.MinPrice;

            S1 := Ptrs[J]^.Data.Vendor + #32 + Ptrs[J]^.Data.Model;
            S2 := Ptrs[J-1]^.Data.Vendor + #32 + Ptrs[J-1]^.Data.Model;
            W  := W and not (CompareText(S1, S2) < 0);
          end;

        sfReleaseDate:
          begin
            W := Ptrs[J]^.Data.ReleaseYear < Ptrs[J-1]^.Data.ReleaseYear;
            W := W and (Ptrs[J]^.Data.ReleaseQuater < Ptrs[J-1]^.Data.ReleaseQuater);

            S1 := Ptrs[J]^.Data.Vendor + #32 + Ptrs[J]^.Data.Model;
            S2 := Ptrs[J-1]^.Data.Vendor + #32 + Ptrs[J-1]^.Data.Model;
            W  := W and not (CompareText(S1, S2) < 0);
          end;
      end;

      if W then
      begin
        Temp := Ptrs[J-1];
        Ptrs[J-1] := Ptrs[J];
        Ptrs[J] := Temp;
        K := J;
      end;
      Dec(J);
    end;
    Index := K + 1;
  end;
  {$WARNINGS ON}  

  { Reassigning pointers }
  for Index := Low(Ptrs) to High(Ptrs) do
  begin
    if Index <> Low(Ptrs) then
      Ptrs[Index]^.Previous := Ptrs[Index-1]
    else
      Ptrs[Index]^.Previous := nil;

    if Index <> High(Ptrs) then
      Ptrs[Index]^.Next := Ptrs[Index+1]
    else
      Ptrs[Index]^.Next := nil;
  end;

  FFirst := Ptrs[Low(Ptrs)];
  FLastAdded := Ptrs[High(Ptrs)];

  SetLength(Ptrs, 0);
  FChanged := True;
end;

end.
