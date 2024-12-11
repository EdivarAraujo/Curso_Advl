#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"
//------------------------------------------------------------------------------------------
/*/{Protheus.doc} ABRESZ1
Manutenção de dados em SB1-Descricao Generica do Produto.

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

/******************************************************************************/
User Function WHILETESTE()

  Private lPagaIpva := .F.
  Private lRevisao := .F.
  //======================== ESTRUTURAS DE REPETIÇÃO =======================================

  /*
	For nNumero := 1 to 10
		ConOut(cValToChar(nNumero))

		If nNumero == 5
			Loop
		ElseIf nNumero == 9
			Exit
		else
			nNumero --
		EndIf

		ConOut("PASSOU" + cValToChar(nNumero)+ " VEZES")
	Next
  */

  nNumero := 0

  While nNumero <= 10

    If nNumero == 5
      nNumero ++
      Loop
    ElseIf nNumero == 9
      Exit
    EndIf
    nNumero ++
  end

 // ============================== ESTRUTURAS DE DECISÃO ========================================

  While !Eof()
    if cMeuCarro == "NOVO"
      lPagaIpva := .T.
      if nKm >= 1000 .And. nKm <= 1999
        lRevisao := .T.
      endif
    elseif cMeuCarro == "VELHO" .And. cCarroEsposa == "NOVO"
      lPagaIpva := .T.
    else
      lPagaIpva := .F.
    endif

    if lPagaIpva
      U_GeraTitulo()
    EndIf


    Do Case
      Case cMeuCarro == "NOVO"
        lRevisao := .T.
      Case cMeuCarro == "VELHO" .And. cCarroEsposa == "NOVO"
        lRevisao := .T.
      OtherWise
        lPagaIpva := .F.
    End Case



    DBSkip()
  End



Return
