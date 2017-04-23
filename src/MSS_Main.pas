unit MSS_Main;
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
  Windows,
  nppp_baseplugin;

type
  TToolbarIcons = record
    ToolbarBmp: HBITMAP;
    ToolbarIcon: HICON;
  end;

  TMSS_Main = class(TNppBasePlugin)
  private
    const
      cSettingsFile = 'mapScriptSnippets\mss.conf';
  public
    constructor Create;
    destructor Destroy; override;
    procedure DoNppnStartedUp; override;
    procedure InitNpp;
    procedure ShowSnippetForm;
    procedure CloseSnippetForm;
    procedure ShowAbout;
  end;

implementation
uses
  SysUtils,
  nppp_consts,
  MSS_PluginCInterface, MSS_AboutForm, MSS_SnippetDockingForm,
  MSS_OptionContainer;

{ TMSS_Main }
constructor TMSS_Main.Create;
resourcestring
  sShowSnipPanel  = 'Show Snippet panel';
  sCloseSnipPanel = 'Close Snippet panel';
  sAbout          = 'About';
begin
  inherited;
  PluginName := 'Map Script Snippets';

  AddFuncItem(sShowSnipPanel, _CFuncShowSnippetForm);
  AddFuncItem(sCloseSnipPanel, _CFuncCloseSnippetForm);
  AddFuncItem('-', nil);
  AddFuncItem(sAbout, _CFuncShowAbout);
end;

destructor TMSS_Main.Destroy;
begin
  GOptions.SaveToFile(GetPluginsConfigDir + cSettingsFile);
end;

procedure TMSS_Main.InitNPP;
begin
  GOptions.LoadFromFile(GetPluginsConfigDir + cSettingsFile);
end;

procedure TMSS_Main.DoNppnStartedUp;
begin
  InitNPP;

  if GOptions.ShowSnippetDock then
    ShowSnippetForm
end;

procedure TMSS_Main.ShowAbout;
begin
  if (not Assigned(GAboutFrm)) then
    GAboutFrm := TMSS_AboutFrm.Create(self);

  GAboutFrm.ShowModal;
  FreeAndNil(GAboutFrm);
end;

procedure TMSS_Main.ShowSnippetForm;
begin
  if (not Assigned(GSnippetForm)) then
    GSnippetForm := TMSS_SnippetForm.Create(self, 1);

  GSnippetForm.Show;
end;

procedure TMSS_Main.CloseSnippetForm;
begin
  if Assigned(GSnippetForm) then
  begin
    GSnippetForm.Hide;
    FreeAndNil(GSnippetForm);
  end;
end;

initialization
  FNPPPlugin := TMSS_Main.Create as TNppBasePlugin;

end.
