unit MSS_OptionContainer;
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
type
  TMSS_Options = record
    ShowSnippetDock: Boolean;
    SelectedType:    Integer;
    SelectedGroup:   Integer;
    procedure LoadFromFile(const aFileName: string);
    procedure SaveToFile(const aFileName: string);
  end;

const
  __defaultOptions: TMSS_Options = (
    ShowSnippetDock: false;
  );

var
  GOptions: TMSS_Options;

implementation
uses
  superobject, Classes, SysUtils;

{ TMSS_Options }
procedure TMSS_Options.LoadFromFile(const aFileName: string);
var
  json: ISuperObject;
begin
  if not FileExists(aFileName) then
    Exit;

  with TStringStream.Create do
    try
      LoadFromFile(aFileName);
      json := SO(DataString);
    finally
      Free;
    end;

  with TSuperRttiContext.Create do
    try
      Self := AsType<TMSS_Options>(json);
    finally
      Free;
    end;
end;

procedure TMSS_Options.SaveToFile(const aFileName: string);
var
  json: ISuperObject;
begin
  ForceDirectories(ExtractFilePath(aFileName));

  with TSuperRttiContext.Create do
    try
      json := AsJson<TMSS_Options>(Self);
    finally
      Free;
    end;

  with TStringStream.Create(json.AsJSon(True)) do
    try
      SaveToFile(aFileName);
    finally
      Free;
    end;
end;

initialization
  GOptions := __defaultOptions;

end.
