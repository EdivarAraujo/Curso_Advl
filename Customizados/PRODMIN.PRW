#INCLUDE "PROTHEUS.CH"

/*
================================================================================
| USER FUNCTION U_PRODMIN                                                 |
|------------------------------------------------------------------------------|
| Ponto de Entrada: MT410TOK                                                   |
| Autor: Edivar de Araujo Souza                                                                       |
| Data: 20/06/2025                                                             |
|------------------------------------------------------------------------------|
| Descrição: Valida se a quantidade vendida no item do Pedido de Venda          |
|            deixará o saldo em estoque abaixo do estoque de segurança (mínimo).|
|            Se sim, exibe um alerta para o usuário.                           |
|------------------------------------------------------------------------------|
| Retorno: lRet (Lógico)                                                       |
|        .T. -> Continua a inclusão do item normalmente.                       |
|        .F. -> Bloqueia a inclusão do item (não usado neste exemplo).         |
================================================================================
*/
User Function PRODMIN()

    // Variáveis locais
    Local cProduto    := SC6->C6_PRODUTO  // Pega o código do produto da linha do pedido (SC6)
    Local nQtdVend    := SC6->C6_QTDVEN   // Pega a quantidade que está sendo vendida
    Local cLocal      := SC6->C6_LOCAL    // Pega o armazém que está sendo usado
    Local lRet        := .T.            // Retorno padrão é .T. para sempre permitir a operação

    Local nEstMin     := 0             
    Local nEstAtual   := 0            
    Local cDescProd   := ""          

   
    // Acessa o Cadastro de Produtos (SB1) para pegar a descrição
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1)) // Ordem por filial + código
    If SB1->(DbSeek(xFilial("SB1") + cProduto))
        cDescProd := Trim(SB1->B1_DESC)
        nEstMin   := SB1->B1_ESTSEG // B1_ESTSEG é o campo padrão para Estoque de Segurança/Mínimo
    EndIf

    // Acessa a tabela de Saldos em Estoque (SB2) para pegar o saldo atual
    DbSelectArea("SB2")
    SB2->(DbSetOrder(1)) // Ordem por filial + produto + local
    If SB2->(DbSeek(xFilial("SB2") + cProduto + cLocal))
        nEstAtual := SB2->B2_QATU // B2_QATU é o campo de saldo atual
    EndIf

    // --- LÓGICA PRINCIPAL DO ALERTA ---
    // Verifica se o (Estoque Atual - Quantidade Vendida) ficará abaixo do Estoque Mínimo.
    // E também verifica se existe um estoque mínimo configurado (nEstMin > 0).
    If (nEstAtual - nQtdVend) < nEstMin .And. nEstMin > 0

        // Monta a mensagem de alerta para o usuário
        FWAlertInfo("Atenção: Estoque Abaixo do Mínimo!", ;
                    "O produto '" + cProduto + " - " + cDescProd + "' ficará com o estoque abaixo do mínimo definido (" + AllTrim(Str(nEstMin)) + " un) após esta venda." + CRLF + CRLF + ;
                    "Estoque Atual: " + AllTrim(Str(nEstAtual)) + " un." + CRLF + ;
                    "Saldo Projetado: " + AllTrim(Str(nEstAtual - nQtdVend)) + " un.")

    EndIf

    // Restaura a área de trabalho e ordem anterior do SB2 para não impactar o sistema
    RestArea(SB2->(GetArea()))

Return lRet // Retorna .T. para que o Protheus continue o processamento normal
