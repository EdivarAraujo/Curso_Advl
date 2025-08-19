#INCLUDE 'PROTHEUS.CH'
#INCLUDE "FWMVCDEF.CH"
 
//*****************************************************************************
// Ponto de entrada M460FIM - Gravação da NF saida
// Este P.E. é chamado após a gravação da NF de Saída e fora da transação.
//#Par01    - PARAMIXB[1] - Número da NF
//#Par02    - PARAMIXB[2] - Série da NF
//#Par03    - PARAMIXB[3] - Cliente/fornecedor da NF
//#Par03    - PARAMIXB[4] - Loja da NF
//*Return   - Sem nenhuma retorno
//*****************************************************************************
 
User Function M460FIM()
 
    Local cNumNFS   := PARAMIXB[1] // Número da NF
    Local cSerieNFS := PARAMIXB[2] // Série da NF
    Local cClieFor  := PARAMIXB[3] // Cliente/fornecedor da NF
    Local cLoja     := PARAMIXB[4] // Loja da NF
    DbSelectArea("SD2")
SD2->(DbSetOrder(3)) // Chave: Filial+Doc+Serie+Cliente+Loja
IF SD2->(DbSeek(xFilial("SD2") + SF2->F2_DOC + SF2->F2_SERIE + SF2->F2_CLIENTE + SF2->F2_LOJA))

	DbSelectArea("SC6")
	SC6->(DbSetOrder(1)) // Chave: Filial+Pedido+Item+Produto+Recno+Del
	IF SC6->(DbSeek(xFilial("SC6") + SD2->D2_PEDIDO))
		
		// Loop para passar por todos os itens do pedido (C6_NUM = SD2->D2_PEDIDO)
		WHILE !SC6->(Eof()) .AND. SC6->C6_FILIAL == xFilial("SC6") .AND. SC6->C6_NUM == SD2->D2_PEDIDO
			
			// Chamada para cada item
				U_PRODMIN()
			SC6->(DbSkip())
      
		EndDo

	EndIF

EndIF
Return
