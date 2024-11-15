#include "protheus.ch"

/*/{Protheus.doc} 
(exercicios aula de string)
@type user function
@author user
@since 09/10/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function TESTEVAR()

Local nNumero := 10.5
Local cNumero 
Local dData := CtoD( "01/12/21")
Local cData
Local sData
Local cTexto :=  "AULA PRATICA"
Local cTexto2


cData := dToC(dData) //para caractere
sData := dTos(dData) //para string
cNumero := cValToChar(nNumero) //valor para caractere
cTexto2 := Left(cTexto,5) //pega os 5 primeiros caracteres (Left,SubStr)
cTexto2 := SubStr(cTexto,1,5)  //pega os 5 primeiros caracteres (Left,SubStr)
cTexto2 := Capital(cTexto2) //primeira letra maiuscula
cTexto2 := UPPER(cTexto2) //todo minusculo
cTexto2 := Replace(cTexto2,"A","O") //substitui uma coisa por outra

Return 
