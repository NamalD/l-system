unit Display;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Turtle, FMX.Edit, FMX.EditBox,
  FMX.NumberBox;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    NumberBox1: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}

var
  testTurtle: TTurtle;

procedure TForm1.FormCreate(Sender: TObject);

var
  startPoint: TPointF;
begin
  Image1.Bitmap.SetSize(Round(Image1.Width), Round(Image1.Height));
  Image1.Bitmap.Clear(TAlphaColors.White);

  // Initialise turtle
  startPoint := TPointF.Create(300, 300);
  testTurtle := TTurtle.Create(startPoint, 20);
end;

// Draw a straight line using turtle, when button is clicked
procedure TForm1.Button1Click(Sender: TObject);
begin
  testTurtle.DrawLine;
end;

// Rotate turtle by angle in number box
procedure TForm1.Button2Click(Sender: TObject);
begin
  testTurtle.Rotate(Round(NumberBox1.Value), 'R');
end;

end.
