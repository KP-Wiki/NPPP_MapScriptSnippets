unit MSS_Components;
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
  StdCtrls,
  MSS_Snippet;

type
  TMSS_ListBox = class(TListBox)
  private
    fSnippetItems: TMSS_SnippetArray;
    procedure SetSnippets(aSnippetArray: TMSS_SnippetArray);
    function GetSnippets: TMSS_SnippetArray;
  public
    procedure ClearSnippets;
    procedure AddSnippet(aSnippet: TMSS_Snippet);
    function GetSnippet(aTitle: string): TMSS_Snippet;
  published
    property Snippets: TMSS_SnippetArray read GetSnippets write SetSnippets;
  end;

implementation
uses
  Dialogs;

{ TMSS_ListBox }
procedure TMSS_ListBox.SetSnippets(aSnippetArray: TMSS_SnippetArray);
var
  snippet: TMSS_Snippet;
begin
  ClearSnippets;

  for snippet in aSnippetArray do
    AddSnippet(snippet);
end;

function TMSS_ListBox.GetSnippets: TMSS_SnippetArray;
begin
  result := fSnippetItems;
end;

procedure TMSS_ListBox.ClearSnippets;
begin
  Items.Clear;
  SetLength(fSnippetItems, 0);
end;

procedure TMSS_ListBox.AddSnippet(aSnippet: TMSS_Snippet);
var
  newLength: Integer;
begin
  if GetSnippet(aSnippet.Title) <> nil then
  begin
    ShowMessage('Snippet with title ''' + aSnippet.Title + ''' already exists!');
    Exit;
  end;

  newLength := Length(fSnippetItems) + 1;
  SetLength(fSnippetItems, newLength);
  fSnippetItems[newLength - 1] := aSnippet;
  Items.Add(aSnippet.Title);
end;

function TMSS_ListBox.GetSnippet(aTitle: string): TMSS_Snippet;
var
  snippet: TMSS_Snippet;
begin
  result := nil;

  for snippet in fSnippetItems do
    if snippet.Title = aTitle then
    begin
      result := snippet;
      Exit;
    end;
end;

end.
