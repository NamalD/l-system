unit Turtle;

interface

uses
  FMX.Graphics, System.Types;

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
  End;

implementation

uses Display;

// Create a basic turtle
constructor TTurtle.Create(position: TPointF; moveDist: Integer);
begin
  self.currentPosition := position;
  self.currentAngle := 0;
  self.displayCanvas := Form1.Image1.Bitmap.Canvas;
  self.moveDist := moveDist;
end;

// Draw a line, moveDist up from turtle
procedure TTurtle.DrawLine;
var
  p1, p2: TPointF;
begin
  p1 := currentPosition;
  p2 := TPointF.Create(currentPosition.X, currentPosition.Y - moveDist);

  // Begin drawing
  displayCanvas.BeginScene;
  displayCanvas.DrawLine(p1, p2, 100);
  displayCanvas.EndScene;

  // Update current location
  currentPosition := p2;
end;

end.
