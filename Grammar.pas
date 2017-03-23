unit Grammar;

interface

type
  TGrammar = Class(TObject)
    private
      gVariables, gConstants: array of Char;
      gAxiom: String;
      gRules: array of String;
    public
      constructor Create();
    published
      property variables : array of Char
        read gVariables;
      property constants : array of Char
        read gConstants;
      property axiom : String
        read gAxiom;
      property rules : array of String;
        read gRules;
  end;

implementation

end.
