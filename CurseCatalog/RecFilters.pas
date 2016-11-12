unit RecFilters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFilterOpts = record
    Enabled: Boolean;
    Vendor:
      record
        Enabled: Boolean;
        Values: String;
      end;
    Price:
      record
        Enabled: Boolean;
        MinValue: Integer;
        MaxValue: Integer;
      end;
    ReleaseDate:
      record
        Enabled: Boolean;
        MinValue: Integer;
        MaxValue: Integer;
      end;
  end;

  TFilterDialog = class(TForm)
    BottomPanel: TPanel;
    BottomBevel: TBevel;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    GroupBox_Vendor: TGroupBox;
    VendorCheck: TCheckBox;
    VendorEdit: TEdit;
    GroupBox_Price: TGroupBox;
    PriceCheck: TCheckBox;
    GroupBox_Date: TGroupBox;
    HintLabel_3: TLabel;
    ReleaseDateCheck: TCheckBox;
    DateEdit: TEdit;
    HintLabel_2: TLabel;
    PriceEdit: TEdit;
    ButtonReset: TButton;
    procedure ButtonOKClick(Sender: TObject);
  public
    Filter: TFilterOpts;
    procedure SetFilter(const Filter: TFilterOpts);
  end;

implementation

{$R *.dfm}

uses
  Dialog.Message;

{ TFilterDialog }

procedure TFilterDialog.ButtonOKClick(Sender: TObject);
const
  MSG_WARN = 'Обратите внимание на примеры условий.';
var
  S: String;
  N1, N2: Integer;
begin
  with Filter do
  begin
    with Vendor do
    begin
      Enabled  := VendorCheck.Checked;

      if Enabled then
        Values := VendorEdit.Text;
    end;
    with Price do
    begin
      Enabled := PriceCheck.Checked;

      MinValue := 0;
      MaxValue := 0;

      if Enabled then
      begin
        S := StringReplace(Trim(PriceEdit.Text), '.', '', [rfReplaceAll]);
        S := Trim(Copy(S, 1, Pos('-', S) - 1));

        if (not TryStrToInt(S, N1)) and (N1 >= 0) and (N1 <= High(Word)) then
        begin
          ShowWarning('Ценновой диапазон задан неверно!',
            'Неверно задано условие №1 для фильтра по цене.' + #32 + MSG_WARN);
          Exit;
        end;

        S := StringReplace(Trim(PriceEdit.Text), '.', '', [rfReplaceAll]);
        S := Trim(Copy(S, Pos('-', S) + 1, MaxInt));

        if S <> '' then
        begin
          if (not TryStrToInt(S, N2)) and (N1 >= 0) and (N1 <= High(Word)) and (N2 >= N1) then
          begin
            ShowWarning('Ценновой диапазон задан неверно!',
              'Неверно задано условие №2 для фильтра по цене.' + #32 + MSG_WARN);
            Exit;
          end;
        end
        else
        begin
          N2 := N1;
          N1 := 0;
        end;

        MinValue := N1;
        MaxValue := N2;
      end;
    end;
    with ReleaseDate do
    begin
      Enabled := ReleaseDateCheck.Checked;

      MinValue := 0;
      MaxValue := 0;

      if Enabled then
      begin
        S := StringReplace(Trim(PriceEdit.Text), '.', '', [rfReplaceAll]);
        S := Trim(Copy(S, 1, Pos('-', S) - 1));

        if (not TryStrToInt(S, N1)) and (N1 >= 19851) and (N1 <= 20284) and
          (N1 mod 10 in [1..4]) then
        begin
          ShowWarning('Диапазон даты выпуска задан неверно!',
            'Неверно задано условие №1 для фильтра по дате выпуска.' + #32 + MSG_WARN);
          Exit;
        end;

        S := StringReplace(Trim(PriceEdit.Text), '.', '', [rfReplaceAll]);
        S := Trim(Copy(S, Pos('-', S) + 1, MaxInt));

        if S <> '' then
        begin
          if (not TryStrToInt(S, N1)) and (N1 >= 19851) and (N1 <= 20284) and
            (N1 mod 10 in [1..4]) and (N2 >= N1) then
          begin
            ShowWarning('Диапазон даты выпуска задан неверно!',
              'Неверно задано условие №2 для фильтра по дате выпуска.' + #32 + MSG_WARN);
            Exit;
          end;
        end
        else
        begin
          N2 := N1;
          N1 := 0;
        end;

        MinValue := N1;
        MaxValue := N2;
      end;
    end;

    ModalResult := mrOK;
  end;
end;

procedure TFilterDialog.SetFilter(const Filter: TFilterOpts);
begin
  VendorCheck.Checked := Filter.Vendor.Enabled;
  VendorEdit.Text := Filter.Vendor.Values;
  PriceCheck.Checked := Filter.Price.Enabled;
  PriceEdit.Text := Format('%d >> %d', [Filter.Price.MinValue, Filter.Price.MaxValue]);
  ReleaseDateCheck.Checked := Filter.ReleaseDate.Enabled;
  DateEdit.Text := Format('%.1f >> %.1f', [Filter.ReleaseDate.MinValue/10,
    Filter.ReleaseDate.MaxValue/10]);
end;

end.
