unit Display;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Turtle, FMX.Edit, FMX.EditBox,
  FMX.NumberBox, DefinedGrammars, Parser, FMX.Menus, FMX.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MenuBar1: TMenuBar;
    Grammar: TMenuItem;
    RunButton: TButton;
    DragonCurve: TMenuItem;
    SierpinskiTriangle: TMenuItem;
    KochCurve: TMenuItem;
    ItNumBox: TNumberBox;
    Text1: TText;
    procedure FormCreate(Sender: TObject);
    procedure DragonCurveClick(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
    procedure KochCurveClick(Sender: TObject);
    procedure SierpinskiTriangleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}

uses
  Grammar;

var
  testTurtle: TTurtle;
  selectedGrammar: TGrammar;
  startPoint: TPointF;
  drawSize: Integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Bitmap.SetSize(Round(Image1.Width), Round(Image1.Height));
  Image1.Bitmap.Clear(TAlphaColors.White);

  // Initialise grammars
  InitialiseGrammars;
end;


// Grammar menu items
// Koch curve menu item selected
procedure TForm1.KochCurveClick(Sender: TObject);
begin
  selectedGrammar := kochCurveGrammar;
  drawSize := 7;
  startPoint := TPointF.Create(15, 300);

  // Reccomended max iterations
  ItNumBox.Max := 4;
end;

// Dragon curve menu item selected
procedure TForm1.DragonCurveClick(Sender: TObject);
begin
  selectedGrammar := dragonCurveGrammar;
  drawSize := 5;
  startPoint := TPointF.Create(425, 250);

  // Recommended max iterations for canvas size
  ItNumBox.Max := 12;
end;

// Sierpinski triangle menu item selected
procedure TForm1.SierpinskiTriangleClick(Sender: TObject);
begin
  selectedGrammar := sierpinskiGrammar;
  drawSize := 7;
  startPoint := TPointF.Create(75, 0);

  // Reccomended max iterations
  ItNumBox.Max := 6;
end;

// When Run button clicked, draw fractal with turtle
procedure TForm1.RunButtonClick(Sender: TObject);
var
  production: String;
  movements: TStringList;
begin
  if not Assigned(selectedGrammar) then
    ShowMessage('Please select a grammar')
  else if ItNumBox.Value = 0 then
    ShowMessage('Please select desired iteration')
  else
  begin
    // Clear screen
    Image1.Bitmap.Clear(TAlphaColors.White);

    // Initialise turtle
    testTurtle := TTurtle.Create(startPoint, drawSize);

    // Produce production at desired iteration step
    production := Parse(selectedGrammar, Round(ItNumBox.Value));
    // Fetch corresponding movements using the production string
    movements := FetchMovements(selectedGrammar, production);
    // Instruct turtle to draw fractal by interpreting given movements
    testTurtle.InterpretMoves(movements);
  end;
end;

end.
