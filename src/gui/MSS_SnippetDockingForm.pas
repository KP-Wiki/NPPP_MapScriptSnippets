unit MSS_SnippetDockingForm;
{
  Copyright (c) 2017 Thimo Braker

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
}

interface
uses
  Classes, Controls, ComCtrls,
  nppp_forms,
  MSS_Snippet, MSS_Components;

type
  TMSS_SnippetForm = class(TNppDockingForm)
    tcDynamicScriptType: TTabControl;
    tcDynamicScriptGroup: TTabControl;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure tcDynamicScriptTypeChange(Sender: TObject);
    procedure lvSnippetsDblClick(Sender: TObject);
  private
    lbSnippets: TMSS_ListBox;
    kmrItems,
    kpItems:  TMSS_SnippetArray;
  end;

var
  GSnippetForm: TMSS_SnippetForm;

implementation
uses
  SysUtils, Dialogs, Types,
  superobject,
  MSS_OptionContainer;

{$R *.dfm}

{ TMSS_SnippetForm }
procedure TMSS_SnippetForm.FormCreate(Sender: TObject);
var
  dllDir,
  kmrSnippetFile,
  kpSnippetFile:  string;
  json:           ISuperObject;
begin
  inherited;
  dllDir         := ExtractFilePath(GetModuleName(hInstance));
  kmrSnippetFile := dllDir + '\mapScriptSnippets\kmrSnippets.json';
  kpSnippetFile  := dllDir + '\mapScriptSnippets\kpSnippets.json';

  // Read KMR snippets
  if not FileExists(kmrSnippetFile) then
  begin
    ShowMessage('Unable to load snippet file: ' + sLineBreak + kmrSnippetFile);
    Exit;
  end;

  with TStringStream.Create do
    try
      LoadFromFile(kmrSnippetFile);
      json := SO(DataString);
    finally
      Free;
    end;

  with TSuperRttiContext.Create do
    try
      kmrItems := AsType<TMSS_SnippetArray>(json);
    finally
      Free;
    end;

  // Read KP snippets
  if not FileExists(kmrSnippetFile) then
  begin
    ShowMessage('Unable to load snippet file: ' + sLineBreak + kmrSnippetFile);
    Exit;
  end;

  with TStringStream.Create do
    try
      LoadFromFile(kpSnippetFile);
      json := SO(DataString);
    finally
      Free;
    end;

  with TSuperRttiContext.Create do
    try
      kpItems := AsType<TMSS_SnippetArray>(json);
    finally
      Free;
    end;

  json := nil;
end;

procedure TMSS_SnippetForm.FormShow(Sender: TObject);
begin
  inherited;
  lbSnippets              := TMSS_ListBox.Create(self);
  lbSnippets.Parent       := tcDynamicScriptGroup;
  lbSnippets.Align        := alClient;
  lbSnippets.AutoComplete := False;
  lbSnippets.OnDblClick   := lvSnippetsDblClick;
  lbSnippets.Sorted       := True;

  GOptions.ShowSnippetDock      := True;
  tcDynamicScriptType.TabIndex  := GOptions.SelectedType;
  tcDynamicScriptGroup.TabIndex := GOptions.SelectedGroup;
  tcDynamicScriptTypeChange(self);
end;

procedure TMSS_SnippetForm.FormHide(Sender: TObject);
begin
  GOptions.ShowSnippetDock := False;
  GOptions.SelectedType    := 0;
  GOptions.SelectedGroup   := 0;
  FreeAndNil(lbSnippets);
  SetLength(kmrItems, 0);
  SetLength(kpItems, 0);
  inherited;
end;

procedure TMSS_SnippetForm.tcDynamicScriptTypeChange(Sender: TObject);
var
  snippet: TMSS_Snippet;
begin
  lbSnippets.ClearSnippets;
  GOptions.SelectedType  := tcDynamicScriptType.TabIndex;
  GOptions.SelectedGroup := tcDynamicScriptGroup.TabIndex;

  case GOptions.SelectedType of
    0: for snippet in kmrItems do // KaM Remake
         if snippet.Group = GOptions.SelectedGroup then
         begin
           lbSnippets.AddSnippet(snippet);
         end;
    1: for snippet in kpItems do // Knights Province
         if snippet.Group = GOptions.SelectedGroup then
         begin
           lbSnippets.AddSnippet(snippet);
         end;
  end;
end;

procedure TMSS_SnippetForm.lvSnippetsDblClick(Sender: TObject);
var
   cursorPos:    TPoint;
   selItemIndex: Integer;
   snippetData:  TMSS_Snippet;
   lbActive:     TMSS_ListBox;
begin
  lbActive := TMSS_ListBox(Sender);

  // Retrieve the selected item by mouse position
  cursorPos    := lbActive.ScreenToClient(Mouse.CursorPos);
  selItemIndex := lbActive.ItemAtPos(cursorPos, True);
  snippetData  := lbActive.GetSnippet(lbActive.Items[selItemIndex]);

  // Replace selected/append text with snippet code
  Npp.ScintillaFuncs.ScintillaSetFocus;
  Npp.ScintillaFuncs.replaceSelection(snippetData.Code);
end;

end.
