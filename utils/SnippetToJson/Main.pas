unit Main;
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
  Controls, Forms, StdCtrls, Classes,
  MSS_Snippet, superobject;

type
  TForm1 = class(TForm)
    memoSnippet: TMemo;
    memoJson: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTitle: TEdit;
    btnCook: TButton;
    Label4: TLabel;
    cbGroup: TComboBox;
    procedure btnCookClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

{ TForm1 }
procedure TForm1.btnCookClick(Sender: TObject);
var
  aSnippet: TMSS_Snippet;
  json:     ISuperObject;
  groupId:  Integer;
begin
  if cbGroup.Text = 'Events' then
    groupId := 0
  else if cbGroup.Text = 'Actions' then
    groupId := 1
  else if cbGroup.Text = 'States' then
    groupId := 2
  else // Misc
    groupId := 3;

  aSnippet := TMSS_Snippet.Create(edtTitle.Text, groupId, memoSnippet.Text);

  with TSuperRttiContext.Create do
    try
      json := AsJson<TMSS_Snippet>(aSnippet);
    finally
      Free;
    end;

  memoJson.Text := json.AsJSon(True, True);
end;

end.
