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
begin
  // Initialise Koch curve grammar
  tempRules := TDictionary<String, String>.Create;
  // 'F' is replaced with 'F+F-F-F+F'
  tempRules.Add('F', 'F+F-F-F+F');
  // Axiom of 'F' and rules as defined above
  kochCurveGrammar := TGrammar.Create('F', tempRules);
end;

end.
