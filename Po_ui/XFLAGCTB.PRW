#Include "Protheus.ch"
#Include "Parmtype.ch"
#Include "Totvs.ch"
#Include "RWMake.ch"
#Include "Topconn.ch"

/*
    Data: 07/08/2025
    Autor: Edivar de Araujo Souza (Corrigido em 10/08/2025)
    Finalidade: Limpar Flag de Titulo ja contabilizado
*/

User Function XFLAGCTB()

  
   Local aPergs               := {}
   Local cPrefixo             := Space(8)
   Local cNumero              := Space(8)
   Local cParcela             := Space(8)
   Local cTipo                := Space(8)
   Local cNatureza            := Space(8)
   Local cCliente             := Space(100)
   Local cLoja                := Space(8)
   Local dDtIni               := CtoD(Space(8))
   Local dDtFim               := CtoD(Space(8))
   Local dDtDispIni           := CtoD(Space(8))
   Local dDtDispFim           := CtoD(Space(8))
   Local cVlMinimo            := Space(50)
   Local cVlMaximo            := Space(50)

    aAdd(aPergs, {1, "Prefixo: ", cPrefixo, "", '.T.', "", '.T.', 100, .T.})
    aAdd(aPergs, {1, "Numero: ", cNumero, "", '.T.', "", '.T.', 100, .T.}) 
    aAdd(aPergs, {1, "Parcela: ", cParcela, "", '.T.', "", '.T.', 100, .T.})  
    aAdd(aPergs, {1, "Tipo: ", cTipo, "", '.T.', "", '.T.', 100, .T.}) 
    aAdd(aPergs, {1, "Natureza: ", cNatureza, "", '.T.', "SED", '.T.', 100, .T.})
    aAdd(aPergs, {1, "Cliente: ", cCliente, "", '.T.', "SA1", '.T.', 150, .T.})
    aAdd(aPergs, {1, "Loja: ", cLoja, "", '.T.', "", '.T.', 100, .T.})
    aAdd(aPergs, {1, "Data De: ", dDtIni, "", '.T.', "", '.T.', 50, .T.}) 
    aAdd(aPergs, {1, "Data Até: ", dDtFim, "", '.T.', "", '.T.', 50, .T.}) 
    aAdd(aPergs, {1, "Data Dispo. De: ", dDtDispIni, "", '.T.', "", '.T.', 50, .T.}) 
    aAdd(aPergs, {1, "Data Dispo. Até: ", dDtDispFim, "", '.T.', "", '.T.', 50, .T.})
    aAdd(aPergs, {1, "Valor Minimo: ", cVlMinimo, "", '.T.', "", '.T.', 50, .T.})
    aAdd(aPergs, {1, "Valor Maximo: ", cVlMaximo, "", '.T.', "", '.T.', 50, .T.})

    If ParamBox(aPergs, "Limpeza de Flags - CTB...")
      
      cPrefixo            := MV_PAR01
      cNumero             := MV_PAR02
      cParcela            := MV_PAR03
      cTipo               := MV_PAR04
      cNatureza           := MV_PAR05
      cCliente            := MV_PAR06
      cLoja               := MV_PAR07
      dDtIni              := MV_PAR08
      dDtFim              := MV_PAR09
      dDtDispIni          := MV_PAR10
      dDtDispFim          := MV_PAR11
      cVlMinimo           := MV_PAR12
      cVlMaximo           := MV_PAR13

     Processa({|| LimpaFlag(cPrefixo, cNumero, cParcela, cTipo, cNatureza, cCliente, cLoja, dDtIni, dDtFim, dDtDispIni, dDtDispFim, cVlMinimo, cVlMaximo)},"Limpeza de Flags concluida com sucesso")

    Else
        Alert("Envio Cancelado!!!")
    EndIf

Return

Static Function LimpaFlag(cPrefixo, cNumero, cParcela, cTipo, cNatureza, cCliente, cLoja, dDtIni, dDtFim, dDtDispIni, dDtDispFim, cVlMinimo, cVlMaximo)

    cPrefixo    := AllTrim(cPrefixo)
    cNumero     := AllTrim(cNumero)
    cParcela    := AllTrim(cParcela)
    cTipo       := AllTrim(cTipo)
    cNatureza   := AllTrim(cNatureza)
    cCliente    := AllTrim(cCliente)
    cLoja       := AllTrim(cLoja)
    dDtIni      := dDtIni
    dDtFim      := dDtFim
    dDtDispIni  := dDtDispIni
    dDtDispFim  := dDtDispFim
    cVlMinimo   := AllTrim(cVlMinimo)
    cVlMaximo   := AllTrim(cVlMaximo)

    cMsg := "=== PARÂMETROS RECEBIDOS ===" + CRLF
    cMsg += "Prefixo: " + cPrefixo + CRLF
    cMsg += "Numero: " + cNumero + CRLF
    cMsg += "Parcela: " + cParcela + CRLF
    cMsg += "Tipo: " + cTipo + CRLF
    cMsg += "Natureza: " + cNatureza + CRLF
    cMsg += "Cliente: " + cCliente + CRLF
    cMsg += "Loja: " + cLoja + CRLF
    cMsg += "Data Inicial: " + DToS(dDtIni) + CRLF
    cMsg += "Data Final: " + DToS(dDtFim) + CRLF
    cMsg += "Data Disp Inicial: " + DToS(dDtDispIni) + CRLF
    cMsg += "Data Disp Final: " + DToS(dDtDispFim) + CRLF
    cMsg += "Valor Minimo: " + cVlMinimo + CRLF
    cMsg += "Valor Maximo: " + cVlMaximo + CRLF
    cMsg += "=========================="

    alert(cMsg)

    // Rest of the function body...
Return
