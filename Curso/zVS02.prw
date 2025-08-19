#include "Totvs.ch"

User Function zVS02()
    Local aArea := GetArea()
    Local nAtual := 0

    For nAtual := 1 To 3
       fMostrAtu(nAtual)
    Next

    MsgInfo(cValToChar(nAtual),"Atencao")

    RestArea( aArea )
Return 


Static Function fMostrAtu(nAtu)
   Local cVar := cValToChar(nAtu)  
Return cVar
