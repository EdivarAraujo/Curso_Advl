#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"

User Function TRANSACAO()
  Local cCliente := "000001"
  Local cLoja    := "01"
  Local cProdut  := "000001"


  RpcSetType(3)
  PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

 Begin Transaction
  Reclock("SZ1", .T.)
  Z1_FILIAL  := xFilial()
  Z1_CLIENT  := cCliente
  Z1_LOJA    := cLoja
  Z1_PRODUT  := cProdut
  Z1_UM      := "PC"
  Z1_UMCLI   := "CX"
  Z1_TIPO    := "M"
  Z1_FATOR   := 1
  MsUnlock()

  End Transaction
   
  BeginTran()
    Reclock("SZ1", .T.)
  Z1_FILIAL  := xFilial()
  Z1_CLIENT  := cCliente
  Z1_LOJA    := cLoja
  Z1_PRODUT  := cProdut
  Z1_UM      := "PC"
  Z1_UMCLI   := "CX"
  Z1_TIPO    := "M"
  Z1_FATOR   := 1
  MsUnlock()
  
  DisarmTransaction()
  EndTran()
  
  MsUnlockAll()


  RESET ENVIRONMENT



Return
