#INCLUDE "PROTHEUS.CH"
#INCLUDE "PRTOPDEF.CH"
#INCLUDE "TOTVS.CH"
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "RESTFUL.CH"

#DEFINE AFIELDS_JSON 4

WSRESTFUL TJFLAG DESCRIPTION "Limpa flag - Contabilidade Gerencial"
    WSDATA Fields      AS STRING   OPTIONAL
    WSDATA Page        AS INTEGER  OPTIONAL
    WSDATA PageSize    AS INTEGER  OPTIONAL
    WSDATA Type        AS STRING   OPTIONAL
    WSDATA idTitulo    AS STRING   OPTIONAL
    WSDATA E1_EMISSAO  AS DATE     OPTIONAL
    WSDATA E1_VENCREA  AS DATE     OPTIONAL
    WSDATA E1_PREFIXO  AS STRING   OPTIONAL
    WSDATA E1_TIPO     AS STRING   OPTIONAL
    WSDATA E1_NUM      AS STRING   OPTIONAL
    WSDATA E1_CLIENTE  AS STRING   OPTIONAL
    WSDATA E1_PARCELA  AS STRING   OPTIONAL
    WSDATA E1_FILIAL   AS STRING   OPTIONAL
    WSDATA E1_LOJA     AS STRING   OPTIONAL
    WSDATA E1_NATUREZ  AS STRING   OPTIONAL
    WSDATA E1_NOMCLI   AS STRING   OPTIONAL
    WSDATA E1_VALOR    AS NUMERIC  OPTIONAL

    WSMETHOD GET LISTADOCS ;
        DESCRIPTION 'Retorna todos os títulos' ;
        WSSYNTAX '/api/framework/v1/genericList{Fields}' ;
        PATH 'listadocs'
ENDWSRESTFUL

WSMETHOD GET LISTADOCS WSSERVICE TJFLAG
    Local aRet     := .T.
    Local aTitulos := {}
    Local cWhere   := "D_E_L_E_T_ = ' '"
    Local cQuery   := ""
    Local cJson    := ""
    Local cUsuario := GetUserName()

    ConOut("Usuário logado: " + cUsuario)

    If Empty(cUsuario)
        Self:SetResponse('{"error": "Usuário não logado"}', 401)
        Return .F.
    EndIf

    // Monta os filtros conforme os parâmetros recebidos
    If !Empty(Self:E1_EMISSAO)
        cWhere += " AND E1_EMISSAO >= '" + dtos(Self:E1_EMISSAO) + "'"
    EndIf

    If !Empty(Self:E1_VENCREA)
        cWhere += " AND E1_VENCREA <= '" + dtos(Self:E1_VENCREA) + "'"
    EndIf

    If !Empty(Self:E1_PREFIXO)
        cWhere += " AND E1_PREFIXO = '" + Self:E1_PREFIXO + "'"
    EndIf

    If !Empty(Self:E1_TIPO)
        cWhere += " AND E1_TIPO = '" + Self:E1_TIPO + "'"
    EndIf

    If !Empty(Self:E1_NUM)
        cWhere += " AND E1_NUM = '" + Self:E1_NUM + "'"
    EndIf

    If !Empty(Self:E1_CLIENTE)
        cWhere += " AND E1_CLIENTE = '" + Self:E1_CLIENTE + "'"
    EndIf

    If !Empty(Self:E1_PARCELA)
        cWhere += " AND E1_PARCELA = '" + Self:E1_PARCELA + "'"
    EndIf

    If !Empty(Self:E1_FILIAL)
        cWhere += " AND E1_FILIAL = '" + Self:E1_FILIAL + "'"
    EndIf

    If !Empty(Self:E1_LOJA)
        cWhere += " AND E1_LOJA = '" + Self:E1_LOJA + "'"
    EndIf

    If !Empty(Self:E1_NATUREZ)
        cWhere += " AND E1_NATUREZ = '" + Self:E1_NATUREZ + "'"
    EndIf

    If !Empty(Self:E1_NOMCLI)
        cWhere += " AND E1_NOMCLI LIKE '%" + Self:E1_NOMCLI + "%'"
    EndIf
    
    If !Empty(Self:E1_VALOR)
        cWhere += " AND E1_VALOR = " + Str(Self:E1_VALOR, 15, 2)
    EndIf

    cQuery := "SELECT\n" +;
              "    E1_FILIAL,\n" +;
              "    E1_PREFIXO,\n" +;
              "    E1_NUM,\n" +;
              "    E1_PARCELA,\n" +;
              "    E1_TIPO,\n" +;
              "    E1_NATUREZ,\n" +;
              "    E1_NOMCLI,\n" +;
              "    E1_LOJA,\n" +;
              "    E1_EMISSAO,\n" +;
              "    E1_VENCREA,\n" +;
              "    E1_VALOR,\n" +;
              "    E1_CLIENTE\n" +;
              "FROM SE1010 WHERE " + cWhere

    DbUseArea(.T., "TOPCONN", , "QRYTIT", .F., .T.)
    DbSelectArea("QRYTIT")
    TcQuery(cQuery)

    While !QRYTIT->(Eof())
        Aadd(aTitulos, { ;
            {"E1_FILIAL",    QRYTIT->E1_FILIAL}, ;
            {"E1_PREFIXO",   QRYTIT->E1_PREFIXO}, ;
            {"E1_NUM",       QRYTIT->E1_NUM}, ;
            {"E1_PARCELA",   QRYTIT->E1_PARCELA}, ;
            {"E1_TIPO",      QRYTIT->E1_TIPO}, ;
            {"E1_NATUREZ",   QRYTIT->E1_NATUREZ}, ;
            {"E1_CLIENTE",   QRYTIT->E1_CLIENTE}, ;
            {"E1_LOJA",      QRYTIT->E1_LOJA}, ;
            {"E1_EMISSAO",   QRYTIT->E1_EMISSAO}, ;
            {"E1_VENCREA",   QRYTIT->E1_VENCREA}, ;
            {"E1_VALOR",     QRYTIT->E1_VALOR}, ;
            {"E1_NOMCLI",    QRYTIT->E1_NOMCLI} ;
        })
        QRYTIT->(DbSkip())
    EndDo

    QRYTIT->(DbCloseArea())

    // Monta o JSON de resposta incluindo o usuario logado
    cJson := FwJsonSerialize({{"usuario", cUsuario}, {"items", aTitulos}, {"hasNext", .F.}}, .T., .T.)
    Self:SetResponse(cJson)

Return aRet


