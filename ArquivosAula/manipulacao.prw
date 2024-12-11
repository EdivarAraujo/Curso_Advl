#Include "Protheus.ch"
#Include "TbiConn.ch"
#Include "TbiCode.ch"

//FUNCOES DE CONTRODE DE ACESSO A DADOS
/*/{Protheus.doc}
(long_description)
@type user function
@author user
@since 16/10/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function  MANIPULACAO()
  Local cCliente := "000001"
  Local cLoja    := "01"
  Local cProdut  := "000001"
  RpcSetType(3)
  PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

  DBSelectArea("SZ1")

  Reclock("SZ1", .T.)
  Z1_FILIAL  := xFilial()
  Z1_CLIENT  := GetSx8Num("SA1", "A1_COD")
  Z1_LOJA    := cLoja
  Z1_PRODUT  := cProdut
  Z1_UM      := "PC"
  Z1_UMCLI   := "CX"
  Z1_TIPO    := "M"
  Z1_FATOR   := 1
  MsUnlock()

  ConfirmSX8()

  //  SELECIONA A TABELA
  //  dbSelectArea("SA1")
  //  SELECIONA O INDICE
  //  dbSetOrder(1)
  //  PESQUISA ATRAVES DA VALIDACAO
  //  dbSeek
  dbSelectArea("SA1")
  dbSetOrder(1)
  If dbSeek(xFilial()+cCliente+cLoja)
    MsgInfo("Nome: "+SA1->A1_NOME)
  else
    MsgInfo("CLIENTE NAO ENCONTRADO")
  EndIf


  dbSelectArea("SB1")
  dbSetOrder(1)
  If dbSeek(xFilial()+cProdut)
    MsgInfo("Cliente: "+AllTrim(SA1->A1_NOME)+"- Produto: "+SB1->B1_DESC)
  else
    MsgInfo("PRODUTO NAO ENCONTRADO")
  EndIf

  RESET ENVIRONMENT

Return
