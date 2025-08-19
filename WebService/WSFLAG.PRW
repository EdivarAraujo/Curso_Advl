#include 'protheus.ch'
#include 'parmtype.ch'
#include 'totvs.ch'
#include 'restful.ch'
#Include "FwMvcDef.ch"
#Include "Totvs.ch"
#Include "RwMake.ch"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "SHELL.CH"

#include "ap5mail.ch"
#define CLRF CHAR(13) + CHAR(10)

/*
_____________________________________________________________________________
|____________________________________________________________________________|
|Programa - WSFLAG Autor  Data 17/07/2025|
|____________________________________________________________________________|
|Descricao| APi PARA ROTINA DE LIMPAR FLAG DE CONTABILIZAÇÃO |
|         | |
|_________|___________________________________________________________|
|Caminho |Caminho do fonte |
|_________|___________________________________________________________|
|GLPI | http://192.168.255.131/front/ticket.form.php?id= |
|_________|___________________________________________________________|
|____________________________________________________________________________|
|____________________________________________________________________________|
| Historico de alteracoes: |
| 22|Alteração .... |
|____________________________________________________________________________|
*/


WSRESTFUL WSFLAG DESCRIPTION "WebService para API de limprar flag de contabilizacao."
    WSDATA CEMP         as String  //Empresa
	WSDATA cXFilial      as String  //Filial de consultada do credito
	WSDATA CCGC         as String  //CFP/CNPJ Cliente
	WSDATA CTIPO        as String  //Tipo cliente F= Funcionario / P = Associado / C V T E = Convenios
	WSDATA CLOJA        as String Optional //Loja do cliente/cooperado/funcionario ou conveniado
	WSDATA CCLIENTE     as String Optional //Loja do cliente/cooperado/funcionario ou conveniado
    WSDATA CTOKEN       as String Optional
    WSDATA CSTATUS      as String Optional //Status da operacao
	WSDATA CITEM        as String Optional //Item da venda
	WSDATA CPRODUTO     as String Optional //Produto da venda
	WSDATA CORIGEM      as String Optional //Fucao responsável pela movimentaçao
	WSDATA CLOTE        as String Optional //Fucao responsável pela movimentaçao
	WSDATA CCONTRATO    as String Optional //Fucao responsável pela movimentaçao
	WSDATA CDATADE      as String Optional //Data de 
	WSDATA CDATAATE     as String Optional //Data ate

	WSMETHOD GET LISTADOCS;
		DESCRIPTION "Lista os documentos por tabela.";
		WSSYNTAX "?CTIPO={params}&CXFILIAL={params}&CDATADE={params}&CDATAATE={params}";
		PATH "/LISTADOCS"

    WSMETHOD POST LIMPAFLAG;
        DESCRIPTION "Limpa flag dos documento enviados no json";
        WSSYNTAX "/LIMPAFLAG";
        PATH "/LIMPAFLAG"
    
END WSRESTFUL

/*
_____________________________________________________________________________
|____________________________________________________________________________|
|{Protheus.doc} WSFLAG @Author Alisson Oliveira @Since 14/08/2025|
|____________________________________________________________________________|
|@Description| Lista os documentos por tipo e data|
| | |
|_________|___________________________________________________________|
|Caminho |@Type REST |
|_________|___________________________________________________________|
|GLPI | http://192.168.255.131/front/ticket.form.php?id= |
|Metodo HTTP: GET                                                            |
|@path /LISTA                                                            |
|@example /LISTA?CTIPO={params}&CDATADE={params}&CDATAATE={params}                                       |
|_________|___________________________________________________________|
|____________________________________________________________________________|
|____________________________________________________________________________|
| Historico de alteracoes: |
| 14|Alteração .... |
|____________________________________________________________________________|
*/
WSMETHOD GET LISTADOCS WSSERVICE WSFLAG
    Local oJson     := JsonObject():New()
    Local aDados    := {}
    Local nAux      := 0
    Local cAlias    := GetNextAlias()
    Local cQuery    := ""
    Local nTotReg   := 0
    Local nI   := 0

    // Parâmetros de entrada
    Local cTipoKey  := AllTrim(Self:CTIPO)
    Local dDataDe   := DTOS(CTOD(Self:CDATADE))
    Local dDataAte  := DTOS(CTOD(Self:CDATAATE))
    Local cXfilial   := AllTrim(Self:CXFILIAL)
        // Saídas do mapeamento
    Local cTab      := ""
    Local cFlag     := ""
    Local cData     := ""
    Local cFilCmp   := ""
    Local cDoc      := ""
    Local cPrefixo  := ""

    // Mapeamento por ARRAY (compatível com qualquer ADVPL)
    // Estrutura: { CTIPO, TABELA, FLAG, CAMPO_DATA, CAMPO_FILIAL, CAMPO_DOC, CAMPO_PREFIXO }
    Local aTipos := { ;
        { "1", "SE1", "E1_LA"    , "E1_EMISSAO", "E1_FILORIG", "E1_NUM"   , "E1_PREFIXO" }, ;
        { "2", "SE2", "E2_LA"    , "E2_EMISSAO", "E2_FILORIG", "E2_NUM"   , "E2_PREFIXO" }, ;
        { "3", "SE5", "E5_LA"    , "E5_DATA"   , "E5_FILORIG", "E5_NUMERO", "E5_PREFIXO" }, ;
        { "4", "SF1", "F1_DTLANC", "F1_EMISSAO", "F1_FILIAL" , "F1_DOC"   , "F1_SERIE"   }, ;
        { "5", "SF2", "F2_DTLANC", "F2_EMISSAO", "F2_FILIAL" , "F2_DOC"   , "F2_SERIE"   }  ;
    }


    // Tipo de resposta
    Self:SetContentType("application/json")

    // ========= Validação com ValType() =========
    // CTIPO
    If !( ValType(cTipoKey) == "C" ) .Or. Empty(cTipoKey)
        SetRestFault(400, EncodeUTF8("Parâmetro CTIPO é obrigatório (caractere)."))
        Return .F.
    EndIf

    // Datas
    // If !( ValType(dDataDe) == "D" ) .Or. dDataDe == CToD("")
    //     SetRestFault(400, EncodeUTF8("Parâmetro CDATADE inválido. Use formato de data válido."))
    //     Return .F.
    // EndIf
    // If !( ValType(dDataAte) == "D" ) .Or. dDataAte == CToD("")
    //     SetRestFault(400, EncodeUTF8("Parâmetro CDATAATE inválido. Use formato de data válido."))
    //     Return .F.
    // EndIf

    // Filial
    If !( ValType(cXfilial) == "C" ) .Or. Empty(cXfilial)
        SetRestFault(400, EncodeUTF8("Parâmetro CXFILIAL é obrigatório (caractere)."))
        Return .F.
    EndIf
    // Saneamento simples contra injeção (proíbe aspas simples)
    If At("'", cXfilial) > 0
        SetRestFault(400, EncodeUTF8("Parâmetro CXFILIAL contém caractere inválido."))
        Return .F.
    EndIf

    // ========= Resolve mapeamento por ARRAY =========

    For nI := 1 To Len(aTipos)
        If aTipos[nI,1] == cTipoKey
            cTab     := aTipos[nI,2]
            cFlag    := aTipos[nI,3]
            cData    := aTipos[nI,4]
            cFilCmp  := aTipos[nI,5]
            cDoc     := aTipos[nI,6]
            cPrefixo := aTipos[nI,7]
            Exit
        EndIf
    Next

    If Empty(cTab)
        SetRestFault(400, EncodeUTF8("Valor de CTIPO inválido. Valores aceitos: 1, 2, 3, 4, 5."))
        Return .F.
    EndIf

    // ========= Monta e executa a query =========
    cQuery := ;
        "SELECT " + cFlag + " AS FLAG, " + ;
                 cDoc  + " AS DOC, "  + ;
                 cPrefixo + " AS PREFIXO, " + ;
                 "R_E_C_N_O_ AS REC " + ;
        "FROM " + RetSqlName(cTab) + " " + ;
        "WHERE " + cData + " BETWEEN '" + dDataDe + "' AND '" + dDataAte + "' " + ;
          "AND " + cFilCmp + " = '" + cXfilial + "' " + ;
          "AND D_E_L_E_T_ = ''"

    cQuery := ChangeQuery(cQuery)
    dbUseArea(.T., "TOPCONN", TCGENQRY(,,cQuery), cAlias, .F., .T.)
    nTotReg := Contar((cAlias),"!Eof()")
   ConOut(cQuery)                                                                                                           
IF nTotReg > 0
    (cAlias)->(dbGoTop())
    // ========= Monta o JSON de saída =========
    While !(cAlias)->(EoF())
        nAux++
        aAdd(aDados, JsonObject():New())
        aDados[nAux]["filial"]  := cXfilial
        aDados[nAux]["titulo"]  := AllTrim((cAlias)->DOC)
        aDados[nAux]["prefixo"] := AllTrim((cAlias)->PREFIXO)
        aDados[nAux]["flag"]    := AllTrim((cAlias)->FLAG)
        aDados[nAux]["recno"]   := (cAlias)->REC
        (cAlias)->(dbSkip())
    EndDo

    nTotReg := nAux

    oJson["tipo_documentos"] := cTab
    oJson["total_documentos"] := nTotReg
    oJson["lista_documentos"] := aDados

    (cAlias)->(dbCloseArea())
Else
    SetRestFault(404, EncodeUTF8("Nenhum documento encontrado."))
    Return .F.
EndIf
    Self:SetResponse( EncodeUTF8( oJson:ToJson() ) )
    Return .T.

/*
_____________________________________________________________________________
|____________________________________________________________________________|
|{Protheus.doc} WSFLAG @Author Alisson Oliveira @Since 14/08/2025|
|____________________________________________________________________________|
|@Description| Limpa o flag dos itens enviados no json|
| | |
|_________|___________________________________________________________|
|Caminho |@Type REST |
|_________|___________________________________________________________|
|GLPI | http://192.168.255.131/front/ticket.form.php?id= |
|Metodo HTTP: POST                                                            |
|@path /LIMPAFLAG                                                             |
|@example /LIMPAFLAG                                        |
|_________|___________________________________________________________|
|____________________________________________________________________________|
|____________________________________________________________________________|
| Historico de alteracoes: |
| 14|Alteração .... |
|____________________________________________________________________________|
*/
WSMETHOD POST LIMPAFLAG WSSERVICE WSFLAG
    LOCAL oJson      := JsonObject():New()
    LOCAL oCabec     := NIL
    LOCAL oItens     := NIL
    LOCAL oItem      := NIL
    LOCAL  oRes      := NIL
    LOCAL oRetorno   := JsonObject():New()
    LOCAL aResultados:= {}
    LOCAL aErros     := {}
    LOCAL cError     := ""
    LOCAL i          := 0
    LOCAL cXFilial   := ""
    LOCAL cTipoDoc   := ""
    LOCAL cTitulo    := ""
    LOCAL cPrefixo   := ""
    LOCAL cFlagAtual := ""
    LOCAL nRecno     := 0
    LOCAL lSucesso   := .F.
    LOCAL cMsg       := ""
    LOCAL dDataMovi  := CTOD("") 

    // Parâmetro de controle de limpeza de flag
    LOCAL cMvCtbapla := SuperGetMv("MV_CTBAPLA")
    IF Empty(cMvCtbapla)
        cMvCtbapla := "1" // Inativo por padrão
    ENDIF

    Self:SetContentType("application/json")
    
    // Recupera JSON enviado
    cError := oJson:FromJson(Self:GetContent())
    IF !Empty(cError)
        SetRestFault(400, "JSON inválido: " + cError)
        RETURN .F.
    ENDIF

    oCabec := oJson["cabecalho"]
    oItens := oJson["itens"]

    IF oCabec == NIL .OR. oItens == NIL
        SetRestFault(400, "Estrutura JSON incorreta. Esperado 'cabecalho' e 'itens'")
        RETURN .F.
    ENDIF

    cXFilial  := oCabec["filial"]
    cTipoDoc  := oCabec["tipo_documento"]
    dDataMovi := CToD(oCabec["data_movimentacao"])

    FOR i := 1 TO Len(oItens)
        oItem     := oItens[i]
        cTitulo   := oItem["titulo"]
        cPrefixo  := oItem["prefixo"]
        cFlagAtual:= oItem["flag"]
        nRecno    := oItem["recno"]
        lSucesso  := .F.
        cMsg      := ""

        // ====== Mapeamento do tipo_documento ======
        DO CASE
        CASE cTipoDoc == "SE1"
            dbSelectArea("SE1")
            SE1->(dbSetOrder(1)) // Ordem: FILIAL+PREFIXO+NUMERO
                IF SE1->(dbSeek(xfilial("SE1") + cPrefixo + cTitulo))
                IF RecLock("SE1", .F.)
                    SE1->E1_LA := "" // Limpa a flag
                    MsUnlock()
                    lSucesso := .T.
                    cMsg := "Flag limpa com sucesso"
                ELSE
                    cMsg := "Falha ao bloquear registro"
                ENDIF
            ELSE
                cMsg := "Documento não encontrado"
            ENDIF

        OTHERWISE
            cMsg := "Tipo de documento inválido"
        ENDCASE

        // Monta resultado de cada item
        oRes := JsonObject():New()
        oRes["titulo"]  := cTitulo
        oRes["status"]  := IIf(lSucesso, "OK", "ERRO")
        oRes["mensagem"]:= cMsg
        AAdd(aResultados, oRes)
    NEXT

    // Monta retorno final
    oRetorno["status"]   := IIf(Empty(aErros), "sucesso", "parcial")
    oRetorno["sucessos"] := aResultados
    oRetorno["falhas"]   := aErros

    Self:SetResponse(EncodeUTF8(oRetorno:ToJson()))

    // Fecha área usada
    IF cTipoDoc == "SE1"
        SE1->(dbCloseArea())
    ENDIF

RETURN .T.
