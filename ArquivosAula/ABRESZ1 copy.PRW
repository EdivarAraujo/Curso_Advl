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

/******************************************************************************/
User Function SOFTL()

	Local xx       := 0

	if Select("SX6") > 0
		Alert("PROTHEUS ABERTO")
	else
		RpcSetType(3)
		PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"
	Endif

	DBSelectArea("SA1")
	DBSetOrder(1)

	For xx:= 1 to 10

		cNumero := GETSXENUM("SA1", "A1_COD")

		if cNumero $ "000003|000007"
			ROLLBACKSXE()
		else

			RecLock("SA1", .T.)
			A1_FILIAL   := xFilial()
			A1_COD      := cNumero
			A1_LOJA     := "01"
			A1_NOME     := "TESTE DE NUMERACAO "+cValToChar(xx)
			A1_PESSOA   := "F"
			A1_END      := "RUA TESTE"
			A1_NREDUZ   := "TESTE "+cValToChar(xx)
			A1_BAIRRO   := "TESTE"
			A1_TIPO     := "F"
			A1_EST      := "SP"
			A1_COD_MUN  := "00105"
			A1_MUN      := "ADAMANTINA"
			A1_NATUREZ  := "1.00001   "
			MsUnlock()

			if __lSX8
				ConfirmSx8()
			endif

			RESET ENVIRONMENT

			Return
