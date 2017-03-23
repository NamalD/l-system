unit DefinedGrammars;

interface

uses
  Grammar, Classes, Generics.Collections;

procedure InitialiseGrammars;

var
  kochCurveGrammar: TGrammar;

implementation

procedure InitialiseGrammars;
var
  tempRules: TDictionary<String, String>;
  tempMovements: TDictionary<String, String>;
begin
  // Initialise Koch curve grammar rules
  tempRules := TDictionary<String, String>.Create;
  tempRules.Add('F', 'F+F-F-F+F');
  // Movement rules
  tempMovements := TDictionary<String, String>.Create;
  tempMovements.Add('F', 'draw forward');
  tempMovements.Add('+', 'turn 90 L');  // 90 degrees left
  tempMovements.Add('-', 'turn 90 R');  // 90 degrees right
  kochCurveGrammar := TGrammar.Create('F', tempRules, tempMovements);
end;

end.
