library Map_Script_Snippets;
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
{
  Important note about DLL memory management:
    ShareMem must be the first unit in your library's USES clause AND your
    project's (select Project-View Source) USES clause if your DLL exports any
    procedures or functions that pass strings as parameters or function results.

    This applies to all strings passed to and from your DLL--even those that
    are nested in records and classes.

    ShareMem is the interface unit to the BORLNDMM.DLL shared memory manager,
    which must be deployed along with your DLL.

    To avoid using BORLNDMM.DLL, pass string information using PChar or
    ShortString parameters.
}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Windows,
  nppp_dllfuncs,
  MSS_Main in 'src\MSS_Main.pas',
  MSS_PluginCInterface in 'src\MSS_PluginCInterface.pas',
  MSS_Snippet in 'src\snippets\MSS_Snippet.pas',
  MSS_Components in 'src\gui\MSS_Components.pas',
  MSS_OptionContainer in 'src\MSS_OptionContainer.pas',
  MSS_AboutForm in 'src\gui\MSS_AboutForm.pas' {MSS_AboutFrm},
  MSS_SnippetDockingForm in 'src\gui\MSS_SnippetDockingForm.pas' {MSS_SnippetForm};

{$R *.res}

exports
  setInfo, getName, getFuncsArray, beNotified, messageProc;
{$IFDEF NPPUNICODE}
exports
  isUnicode;
{$ENDIF}

begin
  DllProc := @DLLEntryPoint;
  DLLEntryPoint(DLL_PROCESS_ATTACH);
end.
