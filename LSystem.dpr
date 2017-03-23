program LSystem;

uses
  System.StartUpCopy,
  FMX.Forms,
  Display in 'Display.pas' {Form1},
  Turtle in 'Turtle.pas',
  Parser in 'Parser.pas',
  Grammar in 'Grammar.pas',
  DefinedGrammars in 'DefinedGrammars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
