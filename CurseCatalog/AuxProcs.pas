unit AuxProcs;

interface

uses
  Windows, SysUtils, Classes;

{ Fills rectangle with simple gradient }
procedure FillGradientRect(const hDC: Cardinal; const AWidth, AHeight: Integer;
  const ColorA, ColorB: Integer; const Vertical: Boolean = True);

{ Get file size in bytes }
function GetFileSize(const FileName: String): Int64;

implementation

type
  COLOR16 = Word;

  PTriVertex = ^TTriVertex;
  _TRIVERTEX = packed record
    X     : LongInt;
    Y     : LongInt;
    Red   : COLOR16;
    Green : COLOR16;
    Blue  : COLOR16;
    Alpha : COLOR16;
  end;
  MYTRIVERTEX = _TRIVERTEX;

{ MSDN: http://msdn.microsoft.com/en-us/library/aa925212.aspx }
function GradientFill(DC: HDC; Vertex: Pointer; dwNumVertex: ULONG; pMesh: Pointer;
  dwNumMesh, dwMode: ULONG): BOOL; stdcall; external 'msimg32.dll';

procedure FillGradientRect(const hDC: Cardinal; const AWidth, AHeight: Integer;
  const ColorA, ColorB: Integer; const Vertical: Boolean = True);
var
  Vertex: array[0..1] of MYTRIVERTEX;
  gRect: GRADIENT_RECT;
  Mode: Integer;
begin
  Vertex[0].X      := 0;
  Vertex[0].Y      := 0;
  Vertex[0].Alpha  := 0;
  Vertex[0].Red    := (ColorA and $000000FF) shl 8;
  Vertex[0].Green  := (ColorA and $0000FF00);
  Vertex[0].Blue   := (ColorA and $00FF0000) shr 8;

  Vertex[1].X      := AWidth;
  Vertex[1].Y      := AHeight;
  Vertex[1].Alpha  := 0;
  Vertex[1].Red    := (ColorB and $000000FF) shl 8;
  Vertex[1].Green  := (ColorB and $0000FF00);
  Vertex[1].Blue   := (ColorB and $00FF0000) shr 8;

  if Vertical then
    Mode := GRADIENT_FILL_RECT_V
  else
    Mode := GRADIENT_FILL_RECT_H;

  gRect.UpperLeft  := 0;
  gRect.LowerRight := 1;
  GradientFill(hDC, @Vertex[0], Length(Vertex), @gRect, 1, Mode);
end;

function GetFileSize(const FileName: String): Int64;
var
  hFile: Cardinal;
begin
  hFile := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_READ, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

  if hFile <> INVALID_HANDLE_VALUE then
    Result := Windows.GetFileSize(hFile, nil)
  else
    Result := 0;
end;

end.
