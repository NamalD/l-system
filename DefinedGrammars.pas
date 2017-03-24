unit DefinedGrammars;

interface

uses
  Grammar, Classes, Generics.Collections;

procedure InitialiseGrammars;

var
  kochCurveGrammar, sierpinskiGrammar, dragonCurveGrammar: TGrammar;

implementation

procedure InitialiseGrammars;
var
  kcRules, stRules, dcRules: TDictionary<String, String>;
  kcMovements, stMovements, dcMovements: TDictionary<String, String>;
begin
  // Koch curve grammar rules
  kcRules := TDictionary<String, String>.Create;
  kcRules.Add('F', 'F+F-F-F+F');
  // Movement rules
  kcMovements := TDictionary<String, String>.Create;
  kcMovements.Add('F', 'draw forward');
  kcMovements.Add('+', 'turn 90 L');  // 90 degrees left
  kcMovements.Add('-', 'turn 90 R');  // 90 degrees right
  kochCurveGrammar := TGrammar.Create('F', kcRules, kcMovements);

  // Sierpinski triangle grammar rules
  stRules := TDictionary<String, String>.Create;
  stRules.Add('F', 'F-G+F+G-F');
  stRules.Add('G', 'GG');
  // Movement rules
  stMovements := TDictionary<String, String>.Create;
  stMovements.Add('F', 'draw forward');
  stMovements.Add('G', 'draw forward');
  stMovements.Add('+', 'turn 120 L'); // 120 degrees left
  stMovements.Add('-', 'turn 120 R'); // 120 degrees right
  sierpinskiGrammar := TGrammar.Create('F-G-G', stRules, stMovements);

  // Dragon curve grammar rules
  dcRules := TDictionary<String, String>.Create;
  dcRules.Add('F', 'F-H');
  dcRules.Add('H', 'F+H');
  // Movement rules
  dcMovements := TDictionary<String, String>.Create;
  dcMovements.Add('F', 'draw forward');
  dcMovements.Add('H', 'draw forward');
  dcMovements.Add('+', 'turn 90 R');  // 90 degrees right
  dcMovements.Add('-', 'turn 90 L');  // 90 degrees left
  dragonCurveGrammar := TGrammar.Create('F', dcRules, dcMovements);

end;

end.
