#include "Protheus.ch"

/*/{Protheus.doc}
(long_description)
@type user function
@author user
@since 14/10/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function BLOCOS()
  Local nItem := 350
  Local nResultado := 0
  Local bBloco1 := {||}
  Local E
  Local Z
  Local R

  bBloco1 := {|H|, E:=15, Z:=30, R:= (E * Z) - H}

  nResultado := Eval(bBloco1,nItem)

Return
