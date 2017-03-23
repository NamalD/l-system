unit Grammar;

interface

uses
  Classes, Generics.Collections;

type
  TGrammar = Class(TObject)
    private
      gAxiom: String;
      // Use TDictionary to map replacements
      gRules: TDictionary<String, String>;
    public
      constructor Create(axiom: String; rules: TDictionary<String, String>);
    published
      property axiom : String
        read gAxiom;
      property rules : TDictionary<String, String>
        read gRules;
  end;

implementation

// Constructor
constructor TGrammar.Create(axiom: String; rules: TDictionary<String, String>);
begin
  gAxiom := axiom;
  gRules := rules;
end;

end.
