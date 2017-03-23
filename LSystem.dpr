program LSystem;

uses
  System.StartUpCopy,
  FMX.Forms,
  Display in 'Display.pas' {Form1},
  Turtle in 'Turtle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
