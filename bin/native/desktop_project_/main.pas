unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormMain }

  TFormMain = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.lfm}

{ TFormMain }

procedure TFormMain.Button1Click(Sender: TObject);
begin
      Label1.Caption := 'KodePas 1.0';
      Button1.Caption := 'Tap Again';
      ShowMessage('Visit www.kodelang/docs');
end;

end.

