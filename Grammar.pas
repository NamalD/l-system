unit Grammar;

interface

uses
  Classes, Generics.Collections;

type
  TGrammar = Class(TObject)
    private
      gAxiom: String;
      // Map symbols to replacements
      gRules: TDictionary<String, String>;
      // Map symbols to turtle movements
      gMovements: TDictionary<String, String>;
    public
      constructor Create(axiom: String; rules: TDictionary<String, String>;
        movements: TDictionary<String, String>);
    published
      property axiom: String
        read gAxiom;
      property rules: TDictionary<String, String>
        read gRules;
      property movements: TDictionary<String, String>
        read gMovements;
  end;

implementation

// Constructor
constructor TGrammar.Create(axiom: String; rules: TDictionary<String, String>;
  movements: TDictionary<String, String>);
begin
  gAxiom := axiom;
  gRules := rules;
  gMovements := movements;
end;

end.
