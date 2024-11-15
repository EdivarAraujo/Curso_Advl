#include "protheus.ch"

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
User Function DECISAO()

  Local nNumero := nCount := 0
  Local lContinua := .T.
  Local aArray1 := {0,0,0}
  Local aArray2 := {}
  Local nPos := 0
  Local nTamanho := 0

  while lContinua
    nCount ++

    aArray1[1] := nCount
    aArray1[2] := nCount / 2
    aArray1[3] := nCount ** 2

    if nCount == 10
      lContinua := .F.
    endif

  end

  For nNumero:= 1 to 10

    AAdd(aArray2,{nNumero})

    if nNumero == 7
      Exit
    endif
  Next

  nTamanho := Len(aArray2) - 1
  nPos :=  AScan(aArray2,{ |x| x[1] == 4})
  ADel(aArray2,nPos)
  ASize(aArray2,nTamanho)


Return
