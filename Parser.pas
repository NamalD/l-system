unit Parser;

interface

uses
  Grammar, Classes, FMX.Dialogs;

function Parse(grammar: TGrammar; iteration: Integer): String;
function FetchMovements(grammar: TGrammar; production: String): TStringList;

implementation

function Parse(grammar: TGrammar; iteration: Integer): String;

var
  productionIn, productionOut: String;
  i, j: Integer;
  replacement: String;
begin
  productionIn := grammar.axiom;
  productionOut := '';

  { Iterate over each symbol in 'productionIn' (initially the grammar axiom),
    adding the replacement to 'productionOut', thereby getting the grammar
    production for the requested iteration step. }

  for i := 1 to iteration do
  begin
    // Build production for iteration step i
    for j := 1 to length(productionIn) do
    begin
      if grammar.rules.ContainsKey(productionIn[j]) then
        begin
        // Store matching value from TDictionary into 'replacement'
        grammar.rules.TryGetValue(productionIn[j], replacement);
        // Build the production
        productionOut := productionOut + replacement
        end
      else
        // If there is no replacement rule, it is assumed to be constant
        productionOut := productionOut + productionIn[j];
    end;

    // Get ready for next iteration
    productionIn := productionOut;
    productionOut := '';
  end;

  Result := productionIn;
end;

// Creates a list of turtle moves to make given a production and its grammar
function FetchMovements(grammar: TGrammar; production: String): TStringList;
var
  symbol: Char;
  movement: String;
  movementList: TStringList;
begin
  movementList := TStringList.Create;

  for symbol in production do
  begin
    // Store corresponding turtle move into 'movement'
    grammar.movements.TryGetValue(symbol, movement);
    movementList.Add(movement);
  end;

  Result := movementList;
end;

end.
