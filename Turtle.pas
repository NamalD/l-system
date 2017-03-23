unit Turtle;

interface

uses
  FMX.Graphics, FMX.Dialogs, System.Types, Math, Classes, StrUtils, SysUtils;

type
  TTurtle = Class(TObject)
    private
      currentPosition: TPointF;
      currentAngle: Integer;
      displayCanvas: FMX.Graphics.TCanvas;
      moveDist: Integer;
    public
      constructor Create(position: TPointF; moveDist: Integer);
      procedure DrawLine();
      procedure Rotate(angle: Integer; direction: String);
      procedure InterpretMoves(moves: TStringList);
  End;

implementation

// Uses display to easily access canvas
uses Display;

// Create a basic turtle
constructor TTurtle.Create(position: TPointF; moveDist: Integer);
begin
  self.currentPosition := position;
  self.currentAngle := 90;
  self.displayCanvas := Form1.Image1.Bitmap.Canvas;
  self.moveDist := moveDist;
end;

// Draw a line, moveDist up from turtle
procedure TTurtle.DrawLine;
var
  p1, p2: TPointF;
  x2, y2: Single;
begin
  // Start position
  p1 := currentPosition;

  // End position calculations
  x2 := p1.X + moveDist * Sin(DegToRad(currentAngle));
  y2 := p1.Y - moveDist * Cos(DegToRad(currentAngle));
  p2 := TPointF.Create(x2, y2);

  // Begin drawing
  displayCanvas.BeginScene;
  displayCanvas.DrawLine(p1, p2, 100);
  displayCanvas.EndScene;

  // Update current location
  currentPosition := p2;
end;

// Rotate the turtle
procedure TTurtle.Rotate(angle: Integer; direction: String);
begin
  if (direction = 'L') or (direction = 'l') then
    currentAngle := (currentAngle - angle) mod 360
  else if (direction = 'R') or (direction = 'r') then
    currentAngle := (currentAngle + angle) mod 360
  else
    // Display message if incorrect direction used
    // TODO: Raise exception instead
    ShowMessage('Invalid direction!');
end;

procedure TTurtle.InterpretMoves(moves: TStringList);
var
  move: String;
  moveArray: TStringDynArray;
begin
  for move in moves do
  begin
    moveArray := SplitString(move, '\ ');
    if moveArray[0] = 'draw' then
      self.DrawLine
    else if moveArray[0] = 'turn' then
      self.Rotate(StrToInt(moveArray[1]), moveArray[2]);
  end;
end;

end.
