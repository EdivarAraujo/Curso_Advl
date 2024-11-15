#INCLUDE "rwmake.ch"
#INCLUDE "Protheus.ch"
#Include "TOTVS.ch"

/*/
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁMOD2  ╨ Autor Ё Paulo Bindo        ╨ Data Ё  15/04/11   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Descricao Ё Cadastro de Usuario x Rotinas                              ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP6 IDE                                                    ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
/*/

User Function MOD2(cCodUsu,cRotUsu)

	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Declaracao de Variaveis                                             Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

	Private cCadastro := "Cadastro de Usuarios x Rotinas"
	Private NOPCX := 0

	//зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Monta um aRotina proprio                                            Ё
	//юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

	Private aRotina := { {"Pesquisar","AxPesqui",0,1} ,;
		{"Visualizar","U_CFGAT2Vis",0,2} ,;
		{"Incluir","U_CFGAT2Inc",0,3} ,;
		{"Alterar","U_CFGAT2Alt",0,4} ,;
		{"Copiar","U_CFGAT2Cop",0,4} ,;
		{"Excluir","U_CFGAT2Exc",0,5},;
		{"Testar","U_CFGAT2TST",0,6}}//,;




	Private cString := "SZB"

	dbSelectArea("SZB")
	dbSetOrder(1)

	dbSelectArea(cString)
	mBrowse( 6,1,22,75,cString)


Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁCFGAT2Vis ╨Autor  ЁPaulo Bindo         ╨ Data Ё  03/17/04   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁVisualizacao do SZB                                         ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
User Function CFGAT2Vis(cAlias,nReg,nOpcX)
	Local i := nB := 0
	Private NUSADO,AHEADER,ACOLS,CCLIENTE,CLOJA
	Private DDATA,NLINGETD,CTITULO,AC,AR,ACGD
	Private CLINHAOK,CTUDOOK,LRETMOD2
	Private nTotaNota := 0
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Opcao de acesso para o Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// 3,4 Permitem alterar getdados e incluir linhas
	// 6 So permite alterar getdados e nao incluir linhas
	// Qualquer outro numero so visualiza
	nOpcx:=2
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aHeader                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	OpenSxs(,,,,,"SX3TRB","SX3",,.F.)
	cTabela := "SZB"
	nUsado:=0
	aHeader:={}
	aGetSD := {}

	If Select("SX3TRB") > 0
		dbSelectArea('SX3TRB')
		SX3TRB->( dbSetOrder( 1 ) ) //ORDENA POR ALIAS
		SX3TRB->( dbGoTop(  ) )
		If SX3TRB->( msSeek( cTabela ) )
			While SX3TRB->(!Eof()) .AND. SX3TRB->&('X3_ARQUIVO')==cTabela

				IF X3USO(SX3TRB->&('x3_usado')) .AND. cNivel >= SX3TRB->&('x3_nivel') .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_CODUSU" .And. ;
						Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_NOMEUSU" .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_MSBLQL"
					nUsado++
					AADD(aHeader,{ TRIM(SX3TRB->&('x3_titulo')), SX3TRB->&('x3_campo'), SX3TRB->&('x3_picture'),;
						SX3TRB->&('x3_tamanho'), SX3TRB->&('x3_decimal'),SX3TRB->&('x3_valid'),;
						SX3TRB->&('x3_usado'), SX3TRB->&('x3_tipo'), SX3TRB->&('x3_arquivo'), SX3TRB->&('X3_CONTEXT') } )
					Aadd( aGetSD, SX3TRB->&('X3_CAMPO'))
				Endif


				SX3TRB->(dbSkip())
			End
		Endif
		SX3TRB->( DbCloseArea() )
	Endif

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aCols                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aCOLS := Array(1,Len(aHeader)+1)

	For i:=1 to Len(aHeader)
		cCampo:=Alltrim(aHeader[i,2])
		If alltrim(aHeader[i,2])=="ZB_ITEM"
			aCOLS[1][i] := "0001"
		Else
			aCols[1][i]   := CRIAVAR(alltrim(aHeader[i][2]))
		Endif
	Next i
	aCOLS[1][Len(aHeader)+1] := .F.
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Cabecalho do Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

	cCodigo := SZB->ZB_CODUSU
	cNomeU	:= SZB->ZB_NOMEUSU
	//cBloq   := SZB->ZB_MSBLQL
	nCnt := 0

	dbSelectArea("SZB")
	dbSetOrder(1)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			dbSkip()
		End
	EndIf
	aCols:=Array(nCnt,Len(aHeader)+1)

	nCnt := 0
	dbSelectArea("SZB")
	dbSetOrder(4)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			For nB:=1 To Len(aHeader)
				cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
				cCampo := AllTrim(aHeader[nB][2])
				aCols[nCnt, cVar] := &cCampo
			Next
			dbSelectArea("SZB")
			dbSkip()
		End
	EndIf
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Rodape do Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nLinGetD:=0

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Cabecalho do Modelo 2      Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aC:={}
	// aC[n,1] = Nome da Variavel Ex.:"cCliente"
	// aC[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aC[n,3] = Titulo do Campo
	// aC[n,4] = Picture
	// aC[n,5] = Validacao
	// aC[n,6] = F3
	// aC[n,7] = Se campo e' editavel .t. se nao .f.

	AADD(aC,{"cCodigo"	,{15,010} ,"Codigo          :"	,"@R 99999999"	,".T.","USR"	,.F.})
	AADD(aC,{"cNomeU"	,{15,100} ,"Nome            :"	,""				,".T.", 	,.F.})
	//AADD(aC,{"cBloq"	,{30,010} ,"Bloqueado       :"	,			  ,		,		,.T.})

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Rodape do Modelo 2         Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aR:={}
	// aR[n,1] = Nome da Variavel Ex.:"cCliente"
	// aR[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aR[n,3] = Titulo do Campo
	// aR[n,4] = Picture
	// aR[n,5] = Validacao
	// aR[n,6] = F3
	// aR[n,7] = Se campo e' editavel .t. se nao .f.

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com coordenadas da GetDados no modelo2                 Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aSize := MsAdvSize()
	aObjects := {}
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 015, .t., .f. } )
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects )
	aPosGet := MsObjGetPos(aSize[3]-aSize[1],315,{{220}} )
	nGetLin := aPosObj[2,1]


	aCordW :={aSize[7],0,aSize[6],aSize[5]}
	aCGD:={75,5,218,310}
	aGetEdit := {}
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Validacoes na GetDados da Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cLinhaOk:="AlwaysTrue()"
	cTudoOk:="AlwaysTrue()"
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Chamada da Modelo2                                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// lRetMod2 = .t. se confirmou
	// lRetMod2 = .f. se cancelou
	lRetMod2:=Modelo2(cCadastro,aC,aR,aCGD,nOpcx,cLinhaOk,cTudoOk,aGetSD,,,,aCordW,.F.)
	// No Windows existe a funcao de apoio CallMOd2Obj() que retorna o
	// objeto Getdados Corrente

Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁCFGAT2Inc ╨Autor  ЁPaulo Bindo         ╨ Data Ё  03/16/04   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁInclusao de dados no Z07                                    ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

User Function CFGAT2Inc(cAlias,nReg,nOpcX)
	Local i:= nB:= nA:= 0
	Private NUSADO,AHEADER,ACOLS,CCLIENTE,CLOJA
	Private DDATA,NLINGETD,CTITULO,AC,AR,ACGD
	Private CLINHAOK,CTUDOOK,LRETMOD2,cCodigo
	Private nTotaNota := 0
	Private cNomeU

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Opcao de acesso para o Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// 3,4 Permitem alterar getdados e incluir linhas
	// 6 So permite alterar getdados e nao incluir linhas
	// Qualquer outro numero so visualiza
	nOpcx:=3
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aHeader                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	OpenSxs(,,,,,"SX3TRB","SX3",,.F.)
	cTabela := "SZB"
	nUsado:=0
	aHeader:={}
	aGetSD := {}

	If Select("SX3TRB") > 0
		dbSelectArea('SX3TRB')
		SX3TRB->( dbSetOrder( 1 ) ) //ORDENA POR ALIAS
		SX3TRB->( dbGoTop(  ) )
		If SX3TRB->( msSeek( cTabela ) )
			While SX3TRB->(!Eof()) .AND. SX3TRB->&('X3_ARQUIVO')==cTabela

				IF X3USO(SX3TRB->&('X3_USADO')) .AND. cNivel >= SX3TRB->&('X3_NIVEL') .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_CODUSU" .And. ;
						Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_NOMEUSU" .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_MSBLQL"
					nUsado++
					AADD(aHeader,{ TRIM(SX3TRB->&('X3_TITULO')), SX3TRB->&('X3_CAMPO'), SX3TRB->&('X3_PICTURE'),;
						SX3TRB->&('X3_TAMANHO'), SX3TRB->&('X3_DECIMAL'),SX3TRB->&('X3_VALID'),;
						SX3TRB->&('X3_USADO'), SX3TRB->&('X3_TIPO'), SX3TRB->&('X3_ARQUIVO'), SX3TRB->&('X3_CONTEXT') } )
					Aadd( aGetSD, SX3TRB->&('X3_CAMPO'))
				Endif


				SX3TRB->(dbSkip())
			End
		Endif
		SX3TRB->( DbCloseArea() )
	Endif
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aCols                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aCOLS := Array(1,Len(aHeader)+1)

	For i:=1 to Len(aHeader)
		cCampo:=Alltrim(aHeader[i,2])
		If alltrim(aHeader[i,2])=="ZB_ITEM"
			aCOLS[1][i] := "0001"
		Else
			aCols[1][i]   := CRIAVAR(alltrim(aHeader[i][2]))
		Endif
	Next i
	aCOLS[1][Len(aHeader)+1] := .F.
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Cabecalho do Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cCodigo := Space(06)
	cNomeU	:= Space(30)
	//cBloq   := Space(01)

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Rodape do Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nLinGetD:=0

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Cabecalho do Modelo 2      Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aC:={}
	// aC[n,1] = Nome da Variavel Ex.:"cCliente"
	// aC[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aC[n,3] = Titulo do Campo
	// aC[n,4] = Picture
	// aC[n,5] = Validacao
	// aC[n,6] = F3
	// aC[n,7] = Se campo e' editavel .t. se nao .f.


	AADD(aC,{"cCodigo"	,{15,010} ,"Codigo          :"	,"@R 99999999"	,"","US1"	,.T.})
	AADD(aC,{"cNomeU"	,{15,100} ,"Nome            :"	,""				,".T.",	  	,.F.})
	//AADD(aC,{"cBloq"	,{30,010} ,"Bloqueado       :"	,			  ,		,		,.T.})

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Rodape do Modelo 2         Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aR:={}
	// aR[n,1] = Nome da Variavel Ex.:"cCliente"
	// aR[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aR[n,3] = Titulo do Campo
	// aR[n,4] = Picture
	// aR[n,5] = Validacao
	// aR[n,6] = F3
	// aR[n,7] = Se campo e' editavel .t. se nao .f.

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com coordenadas da GetDados no modelo2                 Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aSize := MsAdvSize()
	aObjects := {}
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 015, .t., .f. } )
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects )
	aPosGet := MsObjGetPos(aSize[3]-aSize[1],315,{{220}} )
	nGetLin := aPosObj[2,1]


	aCordW :={aSize[7],0,aSize[6],aSize[5]}
	aCGD:={75,5,218,310}
	aGetEdit := {}
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Validacoes na GetDados da Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cLinhaOk:=".T."
	cTudoOk:=".T."
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Chamada da Modelo2                                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// lRetMod2 = .t. se confirmou
	// lRetMod2 = .f. se cancelou
	lRetMod2:=Modelo2(cCadastro,aC,aR,aCGD,nOpcx,cLinhaOk,cTudoOk,aGetSD,,"+ZB_ITEM",,aCordW,.T.)
	// No Windows existe a funcao de apoio CallMOd2Obj() que retorna o
	// objeto Getdados Corrente
	If lRetMod2
		For nA:=1 To Len(aCols)
			If !( aCols[nA][Len(aHeader)+1] )
				nI	:= aScan(aHeader,{|x| UPPER(AllTrim(x[2]))=="ZB_ITEM" })
				If  !Empty(aCols[nA,nI])
					RecLock("SZB",.T.)
					ZB_CODUSU  	:= cCodigo
					ZB_NOMEUSU 	:=  UsrRetName(cCodigo)
					//				ZB_MSBLQL	:= cBloq
					For nB:=1 To Len(aHeader)
						cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
						xConteudo := aCols[ nA, cVar ]
						cCampo := AllTrim(aHeader[nB][2])
						Replace &cCampo With xConteudo
					Next
					SZB->(MsUnlock())
				EndIf
			EndIf
		Next
		Return
	Else
		Return
	EndIf
Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁRDTKC7Alt ╨Autor  ЁPaulo Bindo         ╨ Data Ё  03/17/04   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁAltera a tabela de premissas                                ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/
User Function CFGAT2Alt(cAlias,nReg,nOpcX)
	Local i:= nB:= nA:= 0
	Private NUSADO,AHEADER,ACOLS,CCLIENTE,CLOJA
	Private DDATA,NLINGETD,CTITULO,AC,AR,ACGD
	Private CLINHAOK,CTUDOOK,LRETMOD2
	Private nTotaNota := 0
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Opcao de acesso para o Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// 3,4 Permitem alterar getdados e incluir linhas
	// 6 So permite alterar getdados e nao incluir linhas
	// Qualquer outro numero so visualiza
	nOpcx:=4
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aHeader                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	OpenSxs(,,,,,"SX3TRB","SX3",,.F.)
	cTabela := "SZB"
	nUsado:=0
	aHeader:={}
	aGetSD := {}

	If Select("SX3TRB") > 0
		dbSelectArea('SX3TRB')
		SX3TRB->( dbSetOrder( 1 ) ) //ORDENA POR ALIAS
		SX3TRB->( dbGoTop(  ) )
		If SX3TRB->( msSeek( cTabela ) )
			While SX3TRB->(!Eof()) .AND. SX3TRB->&('X3_ARQUIVO')==cTabela

				IF X3USO(SX3TRB->&('X3_USADO')) .AND. cNivel >= SX3TRB->&('X3_NIVEL') .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_CODUSU" .And. ;
						Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_NOMEUSU" .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_MSBLQL"
					nUsado++
					AADD(aHeader,{ TRIM(SX3TRB->&('X3_TITULO')), SX3TRB->&('X3_CAMPO'), SX3TRB->&('X3_PICTURE'),;
						SX3TRB->&('X3_TAMANHO'), SX3TRB->&('X3_DECIMAL'),SX3TRB->&('X3_VALID'),;
						SX3TRB->&('X3_USADO'), SX3TRB->&('X3_TIPO'), SX3TRB->&('X3_ARQUIVO'), SX3TRB->&('X3_CONTEXT') } )
					Aadd( aGetSD, SX3TRB->&('X3_CAMPO'))
				Endif


				SX3TRB->(dbSkip())
			End
		Endif
		SX3TRB->( DbCloseArea() )
	Endif
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aCols                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aCOLS := Array(1,Len(aHeader)+1)

	For i:=1 to Len(aHeader)
		cCampo:=Alltrim(aHeader[i,2])
		If alltrim(aHeader[i,2])=="ZB_ITEM"
			aCOLS[1][i] := "0001"
		Else
			aCols[1][i]   := CRIAVAR(alltrim(aHeader[i][2]))
		Endif
	Next i
	aCOLS[1][Len(aHeader)+1] := .F.
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Cabecalho do Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

	cCodigo := SZB->ZB_CODUSU
	cNomeU	:= SZB->ZB_NOMEUSU
	//cBloq   := SZB->ZB_MSBLQL

	nCnt := 0

	dbSelectArea("SZB")
	dbSetOrder(1)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			dbSkip()
		End
	EndIf
	If nCnt == 0
		Help(" ",1,"NOITENS")
		Return
	EndIf

	aCols		:=	Array(nCnt,Len(aHeader)+1)
	aRecnos	:=	Array(nCnt)

	nCnt := 0
	dbSelectArea("SZB")
	dbSetOrder(4)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			For nB:=1 To Len(aHeader)
				cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
				cCampo := AllTrim(aHeader[nB][2])
				aCols[nCnt, cVar] := &cCampo
			Next
			aCOLS[nCnt][Len(aHeader)+1] := .F.
			dbSelectArea("SZB")
			dbSkip()
		End
	EndIf
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Rodape do Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nLinGetD:=0

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Cabecalho do Modelo 2      Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aC:={}
	// aC[n,1] = Nome da Variavel Ex.:"cCliente"
	// aC[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aC[n,3] = Titulo do Campo
	// aC[n,4] = Picture
	// aC[n,5] = Validacao
	// aC[n,6] = F3
	// aC[n,7] = Se campo e' editavel .t. se nao .f.

	AADD(aC,{"cCodigo"	,{15,010} ,"Codigo          :"	,"@R 99999999"	,".T.","USR"	,.F.})
	AADD(aC,{"cNomeU"	,{15,100} ,"Nome            :"	,""				,".T.",	  	,.F.})
	//AADD(aC,{"cBloq"	,{30,010} ,"Bloqueado       :"	,			  ,		,		,.T.})

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Rodape do Modelo 2         Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aR:={}
	// aR[n,1] = Nome da Variavel Ex.:"cCliente"
	// aR[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aR[n,3] = Titulo do Campo
	// aR[n,4] = Picture
	// aR[n,5] = Validacao
	// aR[n,6] = F3
	// aR[n,7] = Se campo e' editavel .t. se nao .f.

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com coordenadas da GetDados no modelo2                 Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aSize := MsAdvSize()
	aObjects := {}
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 015, .t., .f. } )
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects )
	aPosGet := MsObjGetPos(aSize[3]-aSize[1],315,{{220}} )
	nGetLin := aPosObj[2,1]


	aCordW :={aSize[7],0,aSize[6],aSize[5]}
	aCGD:={75,5,218,310}
	aGetEdit := {}
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Validacoes na GetDados da Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cLinhaOk:=".T."
	cTudoOk:=".T."
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Chamada da Modelo2                                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// lRetMod2 = .t. se confirmou
	// lRetMod2 = .f. se cancelou
	lRetMod2:=Modelo2(cCadastro,aC,aR,aCGD,nOpcx,cLinhaOk,cTudoOk,aGetSD,,"+ZB_ITEM",,aCordW,)
	// No Windows existe a funcao de apoio CallMOd2Obj() que retorna o
	// objeto Getdados Corrente
	If lRetMod2
		nI	:= aScan(aHeader,{|x| UPPER(AllTrim(x[2]))=="ZB_ITEM" })
		cItem := aCols[1,nI]
		dbSelectArea("SZB")
		dbSetOrder(4)
		dbSeek(xFILIAL()+cCodigo+cItem)
		While !EOF() .And. cCodigo== SZB->ZB_CODUSU
			For nA:=1 To Len(aCols)
				nI	:= aScan(aHeader,{|x| UPPER(AllTrim(x[2]))=="ZB_FUNCAO" })
				If  !Empty(aCols[nA,nI])
					nI	:= aScan(aHeader,{|x| UPPER(AllTrim(x[2]))=="ZB_ITEM" })
					If aCols[nA,nI] == SZB->ZB_ITEM
						If !( aCols[nA][Len(aHeader)+1] )	//GRAVA OS CAMPOS DA LINHA
							RecLock("SZB",.F.)
							For nB:=1 To Len(aHeader)
								cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
								xConteudo := aCols[ nA, cVar ]
								cCampo := AllTrim(aHeader[nB][2])
								Replace &cCampo With xConteudo
							Next
							SZB->(MsUnlock())
						Else	//CASO A LINHA ESTEJA DELETADA NO ACOLS APAGA DA BASE
							dbSelectArea("SZB")
							dbSetOrder(4)
							If dbSeek(xFILIAL()+cCodigo+aCols[nA,nI])
								RecLock("SZB",.F.)
								dbDelete()
								dbUnLock()
							EndIf
						EndIf
						dbSkip()
						Loop
					Else	//INCLUI O NOVO REGISTRO
						RecLock("SZB",.T.)
						ZB_CODUSU  	:= cCodigo
						ZB_NOMEUSU 	:= cNomeU
						//					ZB_MSBLQL	:= cBloq
						If !( aCols[nA][Len(aHeader)+1] )
							For nB:=1 To Len(aHeader)
								cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
								xConteudo := aCols[ nA, cVar ]
								cCampo := AllTrim(aHeader[nB][2])
								Replace &cCampo With xConteudo
							Next
						EndIf
						SZB->(MsUnlock())
						dbSkip()
						Loop
					EndIf
				EndIf
			Next
		End
		Return

	Else
		Return
	EndIf

Return


/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁCFGAT2Exc ╨Autor  ЁPaulo Bindo         ╨ Data Ё  03/16/04   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁExclusao de dados no Z07                                    ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

User Function CFGAT2Exc(cAlias,nReg,nOpcX)
	Local i:= nB:= 0
	Private NUSADO,AHEADER,ACOLS,CCLIENTE,CLOJA
	Private DDATA,NLINGETD,CTITULO,AC,AR,ACGD
	Private CLINHAOK,CTUDOOK,LRETMOD2
	Private nTotaNota := 0
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Opcao de acesso para o Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// 3,4 Permitem alterar getdados e incluir linhas
	// 6 So permite alterar getdados e nao incluir linhas
	// Qualquer outro numero so visualiza
	nOpcx:=5
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aHeader                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	OpenSxs(,,,,,"SX3TRB","SX3",,.F.)
	cTabela := "SZB"
	nUsado:=0
	aHeader:={}
	aGetSD := {}

	If Select("SX3TRB") > 0
		dbSelectArea('SX3TRB')
		SX3TRB->( dbSetOrder( 1 ) ) //ORDENA POR ALIAS
		SX3TRB->( dbGoTop(  ) )
		If SX3TRB->( msSeek( cTabela ) )
			While SX3TRB->(!Eof()) .AND. SX3TRB->&('X3_ARQUIVO')==cTabela

				IF X3USO(SX3TRB->&('X3_USADO')) .AND. cNivel >= SX3TRB->&('X3_NIVEL') .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_CODUSU" .And. ;
						Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_NOMEUSU" .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_MSBLQL"
					nUsado++
					AADD(aHeader,{ TRIM(SX3TRB->&('X3_TITULO')), SX3TRB->&('X3_CAMPO'), SX3TRB->&('X3_PICTURE'),;
						SX3TRB->&('X3_TAMANHO'), SX3TRB->&('X3_DECIMAL'),SX3TRB->&('X3_VALID'),;
						SX3TRB->&('X3_USADO'), SX3TRB->&('X3_TIPO'), SX3TRB->&('X3_ARQUIVO'), SX3TRB->&('X3_CONTEXT') } )
					Aadd( aGetSD, SX3TRB->&('X3_CAMPO'))
				Endif


				SX3TRB->(dbSkip())
			End
		Endif
		SX3TRB->( DbCloseArea() )
	Endif
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aCols                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aCOLS := Array(1,Len(aHeader)+1)

	For i:=1 to Len(aHeader)
		cCampo:=Alltrim(aHeader[i,2])
		If alltrim(aHeader[i,2])=="ZB_ITEM"
			aCOLS[1][i] := "0001"
		Else
			aCols[1][i]   := CRIAVAR(alltrim(aHeader[i][2]))
		Endif
	Next i
	aCOLS[1][Len(aHeader)+1] := .F.
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Cabecalho do Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды

	cCodigo := SZB->ZB_CODUSU
	cNomeU	:= SZB->ZB_NOMEUSU
	//cBloq   := SZB->ZB_MSBLQL

	nCnt := 0

	dbSelectArea("SZB")
	dbSetOrder(1)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			dbSkip()
		End
	EndIf
	aCols:=Array(nCnt,i)

	nCnt := 0
	dbSelectArea("SZB")
	dbSetOrder(4)
	If dbSeek(xFilial()+cCodigo)
		While !EOF() .And. ZB_CODUSU ==  cCodigo
			nCnt:=nCnt+1
			For nB:=1 To Len(aHeader)
				cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
				cCampo := AllTrim(aHeader[nB][2])
				aCols[nCnt, cVar] := &cCampo
			Next
			dbSelectArea("SZB")
			dbSkip()
		End
	EndIf
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Rodape do Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nLinGetD:=0

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Cabecalho do Modelo 2      Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aC:={}
	// aC[n,1] = Nome da Variavel Ex.:"cCliente"
	// aC[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aC[n,3] = Titulo do Campo
	// aC[n,4] = Picture
	// aC[n,5] = Validacao
	// aC[n,6] = F3
	// aC[n,7] = Se campo e' editavel .t. se nao .f.

	AADD(aC,{"cCodigo"	,{15,010} ,"Codigo          :"	,"@R 99999999"	,".T.","USR"	,.F.})
	AADD(aC,{"cNomeU"	,{15,100} ,"Nome            :"	,""				,".T.",	  	,.F.})
	//AADD(aC,{"cBloq"	,{30,010} ,"Bloqueado       :"	,			  ,		,		,.F.})

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Rodape do Modelo 2         Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aR:={}
	// aR[n,1] = Nome da Variavel Ex.:"cCliente"
	// aR[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aR[n,3] = Titulo do Campo
	// aR[n,4] = Picture
	// aR[n,5] = Validacao
	// aR[n,6] = F3
	// aR[n,7] = Se campo e' editavel .t. se nao .f.

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com coordenadas da GetDados no modelo2                 Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aSize := MsAdvSize()
	aObjects := {}
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 015, .t., .f. } )
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects )
	aPosGet := MsObjGetPos(aSize[3]-aSize[1],315,{{220}} )
	nGetLin := aPosObj[2,1]


	aCordW :={aSize[7],0,aSize[6],aSize[5]}
	aCGD:={75,5,218,310}
	aGetEdit := {}
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Validacoes na GetDados da Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cLinhaOk:="AlwaysTrue()"
	cTudoOk:="AlwaysTrue()"
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Chamada da Modelo2                                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// lRetMod2 = .t. se confirmou
	// lRetMod2 = .f. se cancelou
	lRetMod2:=Modelo2(cCadastro,aC,aR,aCGD,nOpcx,cLinhaOk,cTudoOk,aGetSD,,,,aCordW,.F.)
	// No Windows existe a funcao de apoio CallMOd2Obj() que retorna o
	// objeto Getdados Corrente

	If lRetMod2
		dbSelectArea("SZB")
		dbSetOrder(4)
		IF dbSeek(xFilial()+cCodigo)
			While !Eof() .and. ZB_CODUSU == cCodigo
				RecLock("SZB",.F.)
				dbDelete()
				dbUnLock()
				dbSkip()
			End
		EndIf
	EndIf
Return

/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁRDTKC7Cop ╨Autor  ЁPaulo Bindo         ╨ Data Ё  03/23/04   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁCopia de registro p/ Inclusao de dados no Z07               ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

User Function CFGAT2Cop(cAlias,nReg,nOpcX)
	Local i:= nB:= nA:= 0
	Private NUSADO,AHEADER,ACOLS,CCLIENTE,CLOJA
	Private DDATA,NLINGETD,CTITULO,AC,AR,ACGD
	Private CLINHAOK,CTUDOOK,LRETMOD2,cCodigo
	Private nTotaNota := 0
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Opcao de acesso para o Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// 3,4 Permitem alterar getdados e incluir linhas
	// 6 So permite alterar getdados e nao incluir linhas
	// Qualquer outro numero so visualiza
	nOpcx:=3
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aHeader                                             Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	OpenSxs(,,,,,"SX3TRB","SX3",,.F.)
	cTabela := "SZB"
	nUsado:=0
	aHeader:={}
	aGetSD := {}

	If Select("SX3TRB") > 0
		dbSelectArea('SX3TRB')
		SX3TRB->( dbSetOrder( 1 ) ) //ORDENA POR ALIAS
		SX3TRB->( dbGoTop(  ) )
		If SX3TRB->( msSeek( cTabela ) )
			While SX3TRB->(!Eof()) .AND. SX3TRB->&('X3_ARQUIVO')==cTabela

				IF X3USO(SX3TRB->&('X3_USADO')) .AND. cNivel >= SX3TRB->&('X3_NIVEL') .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_CODUSU" .And. ;
						Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_NOMEUSU" .And. Trim(SX3TRB->&('X3_CAMPO')) <> "ZB_MSBLQL"
					nUsado++
					AADD(aHeader,{ TRIM(SX3TRB->&('X3_TITULO')), SX3TRB->&('X3_CAMPO'), SX3TRB->&('X3_PICTURE'),;
						SX3TRB->&('X3_TAMANHO'), SX3TRB->&('X3_DECIMAL'),SX3TRB->&('X3_VALID'),;
						SX3TRB->&('X3_USADO'), SX3TRB->&('X3_TIPO'), SX3TRB->&('X3_ARQUIVO'), SX3TRB->&('X3_CONTEXT') } )
					Aadd( aGetSD, SX3TRB->&('X3_CAMPO'))
				Endif


				SX3TRB->(dbSkip())
			End
		Endif
		SX3TRB->( DbCloseArea() )
	Endif
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Montando aCols                                               Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aCOLS := Array(1,Len(aHeader)+1)

	For i:=1 to Len(aHeader)
		cCampo:=Alltrim(aHeader[i,2])
		If alltrim(aHeader[i,2])=="ZB_ITEM"
			aCOLS[1][i] := "0001"
		Else
			aCols[1][i]   := CRIAVAR(alltrim(aHeader[i][2]))
		Endif
	Next i
	aCOLS[1][Len(aHeader)+1] := .F.
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Cabecalho do Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cCodigo := Space(06)
	cNomeU	:= Space(30)
	cCodCop := SZB->ZB_CODUSU

	nCnt := 0

	dbSelectArea("SZB")
	dbSetOrder(1)
	If dbSeek(xFilial()+cCodCop)
		While !EOF() .And. ZB_CODUSU ==  cCodCop
			nCnt:=nCnt+1
			dbSkip()
		End
	EndIf
	If nCnt == 0
		MsgInfo("Nenhum item foi selecionado!","SEM REGISTROS!")
		Return
	EndIf

	aCols		:=	Array(nCnt,Len(aHeader)+1)
	aRecnos	:=	Array(nCnt)

	nCnt := 0
	dbSelectArea("SZB")
	dbSetOrder(4)
	If dbSeek(xFilial()+cCodCop)
		While !EOF() .And. ZB_CODUSU ==  cCodCop
			nCnt:=nCnt+1
			For nB:=1 To Len(aHeader)
				cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
				cCampo := AllTrim(aHeader[nB][2])
				aCols[nCnt, cVar] := &cCampo
			Next
			aCOLS[nCnt][Len(aHeader)+1] := .F.
			dbSelectArea("SZB")
			dbSkip()
		End
	EndIf


	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Variaveis do Rodape do Modelo 2                              Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	nLinGetD:=0

	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Cabecalho do Modelo 2      Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aC:={}
	// aC[n,1] = Nome da Variavel Ex.:"cCliente"
	// aC[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aC[n,3] = Titulo do Campo
	// aC[n,4] = Picture
	// aC[n,5] = Validacao
	// aC[n,6] = F3
	// aC[n,7] = Se campo e' editavel .t. se nao .f.

	AADD(aC,{"cCodigo"	,{15,010} ,"Codigo          :"	,"@R 99999999",".T.","USR"	,.T.})
	//AADD(aC,{"cNomeU"	,{15,100} ,"Nome            :"	,"@R 99999999",".T.",	  	,.T.})

	///здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com descricao dos campos do Rodape do Modelo 2         Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aR:={}
	// aR[n,1] = Nome da Variavel Ex.:"cCliente"
	// aR[n,2] = Array com coordenadas do Get [x,y], em Windows estao em PIXEL
	// aR[n,3] = Titulo do Campo
	// aR[n,4] = Picture
	// aR[n,5] = Validacao
	// aR[n,6] = F3
	// aR[n,7] = Se campo e' editavel .t. se nao .f.

	//AADD(aR,{"nTotaNota"  ,{220,010},"Total Nota","@E 999",,,.F.})
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Array com coordenadas da GetDados no modelo2                 Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	aSize := MsAdvSize()
	aObjects := {}
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 100, .t., .t. } )
	AAdd( aObjects, { 100, 015, .t., .f. } )
	aInfo := { aSize[ 1 ], aSize[ 2 ], aSize[ 3 ], aSize[ 4 ], 3, 3 }
	aPosObj := MsObjSize( aInfo, aObjects )
	aPosGet := MsObjGetPos(aSize[3]-aSize[1],315,{{220}} )
	nGetLin := aPosObj[2,1]


	aCordW :={aSize[7],0,aSize[6],aSize[5]}
	aCGD:={75,5,218,310}
	aGetEdit := {}
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Validacoes na GetDados da Modelo 2                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	cLinhaOk:=".T."
	cTudoOk:=".T."
	//здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
	//Ё Chamada da Modelo2                                           Ё
	//юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
	// lRetMod2 = .t. se confirmou
	// lRetMod2 = .f. se cancelou
	lRetMod2:=Modelo2(cCadastro,aC,aR,aCGD,nOpcx,cLinhaOk,cTudoOk,aGetSD,,"+ZB_ITEM",,aCordW,.T.)
	// No Windows existe a funcao de apoio CallMOd2Obj() que retorna o
	// objeto Getdados Corrente

	If lRetMod2
		For nA:=1 To Len(aCols)
			If !( aCols[nA][Len(aHeader)+1] )
				nI	:= aScan(aHeader,{|x| UPPER(AllTrim(x[2]))=="ZB_ITEM" })
				If  !Empty(aCols[nA,nI])
					RecLock("SZB",.T.)
					ZB_CODUSU  	:= cCodigo
					ZB_NOMEUSU 	:=  UsrRetName(cCodigo)
					//				ZB_MSBLQL	:= cBloq
					For nB:=1 To Len(aHeader)
						cVar      := AScan( aHeader, { |x| AllTrim( x[2] ) == AllTrim(aHeader[nB][2]) } )
						xConteudo := aCols[ nA, cVar ]
						cCampo := AllTrim(aHeader[nB][2])
						Replace &cCampo With xConteudo
					Next
					SZB->(MsUnlock())
				EndIf
			EndIf
		Next
	EndIf
Return




/*/
	эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
	╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
	╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
	╠╠ЁFun┤┘o	 ЁCFGAT2FIL Ё Autor ЁPaulo Bindo	        Ё Data Ё 24/11/05 Ё╠╠
	╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
	╠╠ЁDescri┤┘o ЁSELECIONA FILIAL                                  		  Ё╠╠
	╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
	╠╠ЁSintaxe	 Ё          												  Ё╠╠
	╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
	╠╠Ё Uso		 Ё Generico 												  Ё╠╠
	╠╠юддддддддддадддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
	╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ/*/
User Function CFGAT2FIL(l1Elem,lTipoRet)

	Local cTitulo := ""
	Local MvPar
	Local MvParDef:= ""

	Private aSit:={}
	l1Elem := If (l1Elem = Nil , .F. , .T.)

	DEFAULT lTipoRet := .T.

	cAlias := Alias() 					 // Salva Alias Anterior

	IF lTipoRet
		MvPar:=&(Alltrim(ReadVar()))	 // Carrega Nome da Variavel do Get em Questao
		mvRet:=Alltrim(ReadVar())		 // Iguala Nome da Variavel ao Nome variavel de Retorno
	EndIF

	aSit := {;
		"0101 - " + "Sem Uso",;
		"9901 - " + "Teste";
		}

	MvParDef:= "123456789A"

	/*               
	f_Opcoes(Variavel de Retorno,;
	Titulo da Coluna com as opcoes,;
	Opcoes de Escolha (Array de Opcoes),;
	String de Opcoes para Retorno,;
	Nao Utilizado,;
	Nao Utilizado,;
	Se a Selecao sera de apenas 1 Elemento por vez,;
	Tamanho da Chave,;
	No maximo de elementos na variavel de retorno,;
	Inclui Botoes para Selecao de Multiplos Itens,;
	Se as opcoes serao montadas a partir de ComboBox de Campo ( X3_CBOX ),;
	Qual o Campo para a Montagem do aOpcoes,;
	Nao Permite a Ordenacao,;
	Nao Permite a Pesquisa	 )
	*/					

	IF lTipoRet
		IF f_Opcoes(@MvPar,cTitulo,aSit,MvParDef,12,49,l1Elem)  // Chama funcao f_Opcoes
			&MvRet := mvpar                                                                          // Devolve Resultado
		EndIF
	EndIF

	dbSelectArea(cAlias) 								 // Retorna Alias

Return( IF( lTipoRet , .T. , MvParDef ) )



/*/
	эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
	╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
	╠╠зддддддддддбддддддддддбдддддддбдддддддддддддддддддддддбддддддбдддддддддд©╠╠
	╠╠ЁFun┤┘o	 ЁCFGAT2FIL Ё Autor ЁPaulo Bindo	        Ё Data Ё 24/11/05 Ё╠╠
	╠╠цддддддддддеддддддддддадддддддадддддддддддддддддддддддаддддддадддддддддд╢╠╠
	╠╠ЁDescri┤┘o ЁSELECIONA FILIAL                                  		  Ё╠╠
	╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
	╠╠ЁSintaxe	 Ё          												  Ё╠╠
	╠╠цддддддддддедддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд╢╠╠
	╠╠Ё Uso		 Ё Generico 												  Ё╠╠
	╠╠юддддддддддадддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды╠╠
	╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ/*/
User Function CFGAT2TST()


	dbSelectArea("SM0")
	cCodUsr := RetCodUsr()

	If !U_CHECAFUNC(cCodUsr,"MOD2")
		MsgStop("UsuАrio sem premissЦo para utilizar esta rotina","CHECAFUNC")
		Return(lRet)
	EndIf

Return


	/*
эээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээээ
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
╠╠иммммммммммяммммммммммкмммммммяммммммммммммммммммммкммммммяммммммммммммм╩╠╠
╠╠╨Programa  ЁChecaFunc ╨Autor  ЁPaulo Bindo         ╨ Data Ё  04/18/11   ╨╠╠
╠╠лммммммммммьммммммммммймммммммоммммммммммммммммммммйммммммоммммммммммммм╧╠╠
╠╠╨Desc.     ЁVERIFICA SE O USUARIO TEM PERMISSAO PARA USAR A ROTINA      ╨╠╠
╠╠╨          Ё                                                            ╨╠╠
╠╠лммммммммммьмммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╧╠╠
╠╠╨Uso       Ё AP                                                         ╨╠╠
╠╠хммммммммммомммммммммммммммммммммммммммммммммммммммммммммммммммммммммммм╪╠╠
╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠
ъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъъ
*/

User Function ChecaFunc(cUsuCod,cFuncaoU)
	Local lRet := .F.
	Local aArea := GetArea()
	Local cQuery
	Local cParFil := "1"

	If ValType(cUsuCod) == "U"
		MsgStop("UsuАrio sem premissЦo para utilizar esta rotina","CHECAFUNC")
		RestArea(aArea)
		Return(lRet)
	ElseIf	ValType(cFuncaoU) == "U"
		RestArea(aArea)
		MsgStop("UsuАrio sem premissЦo para utilizar esta rotina","CHECAFUNC")
		Return(lRet)
	EndIf

	//COMENTEI PARA A AULA
	//quando for adminitrador  libera
	/*
	If cUsuCod $ "000000"
		Return(.T.)
	EndIf
	*/
	If cFilAnt == "01" .And. cEmpAnt == "01"
		cParFil := "1"
	ElseIf xFilial("SF2") == "01" .And. cEmpAnt == "99"
		cParFil := "2"
	EndIf


	cQuery := " SELECT COUNT(ZB_CODUSU) NCOUNT FROM "+RetSqlName("SZB")+" WITH(NOLOCK)"
	cQuery += " WHERE ZB_CODUSU = '"+cUsuCod+"' AND ZB_FUNCAO = '"+cFuncaoU+"'"
	cQuery += " AND ZB_MSBLQL <> '1' AND D_E_L_E_T_ <> '*' AND ZB_ATIVO = 'S'"
	cQuery += " AND ZB_FILUSO LIKE '%"+cParFil+"%'"

	MemoWrite("CHECAFUNC.SQL",cQuery)
	dbUseArea( .T., "TOPCONN", TCGENQRY(,,cQuery),"TRBCH", .F., .T.)

	dbSelectArea("TRBCH")
	If TRBCH->NCOUNT > 0
		lRet := .T.
	EndIf
	TRBCH->(dbCloseArea())
	RestArea(aArea)
Return(lRet)
