#include "Protheus.ch"

//aulas leitura de erro


User Function Erros()
Local nNumero := 0
Local aArray  := {{0,0,0}, {0,3,0}}
Local cNumero := 1
Local lTeste := .T.



If nNumero >= 0 
    MsgAlert("NUMERO")
ENDIF


If aArray[2,2] == 3
    MsgAlert("ARRAY")
ENDIF

If cNumero > 0 
    MsgAlert("TEXTO")
ENDIF

If lTeste 
    MsgAlert("BOLEANO")
ENDIF





RETURN
