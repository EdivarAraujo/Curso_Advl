#Include "Protheus.ch"
#Include "TopConn.ch"

/*
    Iatan - 15/05/2024
    Rotina para limpar a flag E1_LA no Contas a Receber (SE1)
*/

User Function U_XFLAGCT()

    Local cFilIni := Space(2)
    Local cFilFim := Space(2)
    Local dDatIni := StoD("        ")
    Local dDatFim := StoD("        ")

    Local aPerg := {}

    AAdd(aPerg, { "01. Filial Inicial", "@!", 2, 0, "", "", "", @cFilIni })
    AAdd(aPerg, { "02. Filial Final",   "@!", 2, 0, "", "", "", @cFilFim })
    AAdd(aPerg, { "03. Data Inicial",   "@D", 8, 0, "", "", "", @dDatIni })
    AAdd(aPerg, { "04. Data Final",     "@D", 8, 0, "", "", "", @dDatFim })

    If !ParamBox(aPerg, "Limpeza de Flags SE1", "Informe os parâmetros:")
        Return
    EndIf

    // Validação
    If Empty(AllTrim(cFilIni))
        Alert("Preencha a Filial Inicial.")
        Return
    EndIf

    If Empty(AllTrim(cFilFim))
        Alert("Preencha a Filial Final.")
        Return
    EndIf

    If Empty(dDatIni)
        Alert("Preencha a Data Inicial.")
        Return
    EndIf

    If Empty(dDatFim)
        Alert("Preencha a Data Final.")
        Return
    EndIf

    MsgRun("Executando limpeza de flags...", "Aguarde", ;
        {|| FlagSE1(cFilIni, cFilFim, dDatIni, dDatFim) })

    Alert("Limpeza concluída com sucesso.")

Return


// ------------------------------------------------------------------

Static Function FlagSE1(cFilIni, cFilFim, dDatIni, dDatFim)

    Local cQuery := ""
    Local nRecno

    cQuery := " SELECT R_E_C_N_O_ FROM SE1010 "
    cQuery += " WHERE D_E_L_E_T_ <> '*' "
    cQuery += "   AND E1_FILIAL >= '" + cFilIni + "' "
    cQuery += "   AND E1_FILIAL <= '" + cFilFim + "' "
    cQuery += "   AND E1_BAIXA  >= '" + DTOS(dDatIni) + "' "
    cQuery += "   AND E1_BAIXA  <= '" + DTOS(dDatFim) + "' "
    cQuery += "   AND E1_LA <> '' "

    TCQuery cQuery New Alias "QRY_SX"

    QRY_SX->(DbGoTop())

    While !QRY_SX->(Eof())

        nRecno := QRY_SX->R_E_C_N_O_

        SE1->(DbGoTo(nRecno))

        If !SE1->(Eof())
            Reclock("SE1", .F.)
                SE1->E1_LA := ""
            MsUnlock()
        EndIf

        QRY_SX->(DbSkip())

    EndDo

    QRY_SX->(DbCloseArea())

Return
