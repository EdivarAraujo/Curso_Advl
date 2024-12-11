#include "Protheus.ch"

/*/{Protheus.doc} NUMERICAS)
@type user function
author user
@since 09/10/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function NUMERICAS()

Local nNumero := 13
Local nResultado := 0
Local cTexto := ""
Local aArray := {}
Local dTeste

nResultado := Round(nNumero / 2, 3)

Alert(ValType(nNumero))
Alert(ValType(nResultado))
Alert(ValType(cTexto))
Alert(ValType(aArray))
Alert(ValType(dTeste))






Return 
