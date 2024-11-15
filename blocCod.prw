#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"

/*/{Protheus.doc} BLOCCOD
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
User Function BLOCCOD()
 Local nX := 0
 Local aCampos := {}
 Local aTitulos := {}

 PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

  /*
 Local nItem := 100
 bBloco := {|X| Y:= 5, Z:= X * Y}

 nValor := Eval(bBloco, nItem)
  */

   /*
  Local cTab := "12"
  Local nCnt := 0
  PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"
   //MELHOR FORMA DE SE FAZER --EVAL
   DBSelectArea("SX5")
   DBGoTop()
   DBEval({|X| nCnt++},,{||X5_FILIAL == xFilial("SX5") .And. X5_TABELA <= cTab})
   */
   AAdd(aCampos,"C5_FILIAL")
   AAdd(aCampos,"C5_NUM")

   SX3->(DBSetOrder(2))
   For nX:= 1 to Len(aCampos)
    SX3->(DBSeek(aCampos[nX]))
    AAdd(aTitulos,AllTrim(SX3->X3_TITULO))
   Next nX
   
   //AEVAL
   aTitulos := {}
   SX3->(DBGoTop())
   AEval(aCampos,{|X| SX3->(DBSeek(X)), AAdd(aTitulos, AllTrim(SX3->X3_TITULO))})

   RESET ENVIRONMENT

Return
