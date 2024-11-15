#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"
//------------------------------------------------------------------------------------------
/*/{Protheus.doc} ABRESZ1
Manutenção de dados em SB1-Descricao Generica do Produto.

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

/*
    //PEGAR DADOS DE PARAMETROS

    GetMV("MV_1DUP")

    GetNewPar("MV_1DUP", "TESTE", xFilial("SC5"))

    SuperGetMV("MV_1DUP", .T., "TESTE", xFilial("SC5"))

    //GRAVAR DADOS PARAMETRO
    PutMV("MV_1DUP", "B")


*/

/******************************************************************************/
User Function PARAMETRO()

	Local dParam

	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

  dParam :=  GetMV("MV_ULMES")

	dParam += 90

	PutMv("MV_ULMES",dParam)

	MsgInfo(Dtoc(GetMv("MV_ULMES")))

	RESET ENVIRONMENT

Return
