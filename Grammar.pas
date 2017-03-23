unit Grammar;

interface

uses
  Classes;

type
  TGrammar = Class(TObject)
    private
      gVariables, gConstants, gRules: TList;
      gAxiom: String;
    public
      constructor Create(vars, consts, rules: TList; axiom: String);

  end;

implementation

constructor TGrammar.Create(vars, consts, rules: TList ;axiom: String);
begin
  gVariables := vars;
  gConstants := consts;
  gAxiom := axiom;
  gRules := rules;
end;

end.
