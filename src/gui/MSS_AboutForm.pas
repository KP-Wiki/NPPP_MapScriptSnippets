unit MSS_AboutForm;

interface

uses
  Controls, StdCtrls, Classes, ExtCtrls,
  nppp_forms;

type
  TMSS_AboutFrm = class(TNppForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnClose: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure btnCloseClick(Sender: TObject);
  end;

var
  GAboutFrm: TMSS_AboutFrm;

implementation
{$R *.dfm}

{ TMSS_AboutFrm }
procedure TMSS_AboutFrm.btnCloseClick(Sender: TObject);
begin
  inherited;
  CloseModal;
end;

end.
