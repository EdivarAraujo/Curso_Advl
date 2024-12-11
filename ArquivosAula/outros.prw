
	Private cCadastro := "Cadastro UM Cliente"

	Private aRotina := { ,;
		{"Pesquisar","AxPesqui",0,1} ,;
		{"Visualizar","AxVisual",0,2} ,;
		{"Alterar","AxAltera",0,4} ,;
		{"Incluir","AxInclui",0,3} ,;
		{"Excluir","AxDeleta",0,5} ,;
		}

	Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock
	Private cString := "SZ1"
	Private cCondicao	:= ""
	Private aIndSB1		:= {}
	Private cCampo
	Private aCampos := {}
	Private nCalc := 0
	Private nAcer := 0
	Private lVerdadeiro := .F.
	Private dData := Ctod("10/01/2021")

	//1-Nome, 2-Marca, 3- Combustivel, 4- Som, 5-Ano, 6-Preço, 7-Placa Preta
	Private aVeiculos := {}

	aVeiculos := {}

	AAdd(aVeiculos,{"FUSCA", "VW", "GASOLINA", .F., 1964, 30000, })
	AAdd(aVeiculos,{"CHEVETE", "VW", "GASOLINA", .T., 1976, 10000, })
	AAdd(aVeiculos,{"LANDAL", "FORD", "GASOLINA", .T., 1970, 100000, })

	//COLOCAR TODOS OS ITENS COMO NÃO VENDIDOS
	For xx:= 1 to Len(aVeiculos)
		aVeiculos[xx,7] := .F.
	Next


	//COPIA DE ARRAY DE VEICULOS
	AVEIC2 := AClone(aVeiculos)

	//COLOCAR LANDAU COMO VENDIDO
	nPos := AScan(AVEIC2,{|x| x[1] == "LANDAL"})
	AVEIC2[nPos,7] := .T.


	//APAGAR O ITEM VENDIDO
	For xx:= 1 to Len(AVEIC2)
		if AVEIC2[xx,7]
			ADel(AVEIC2,xx)
			ASize(AVEIC2,Len(AVEIC2)-1)
		endif
	Next

	AVEIC2 := ASort(aTemp,,,{|x,y| x[1] < y[1]})

	//BLOCO DE CODIGO



	/*

	cNum2 := AllTrim(Str(nNumero))
	cNum2 := AllTrim(cNum2)

	cAsc := Asc("A")
	cCHR := Chr(cAsc)

	cTexto := At("U","PAULO")
	cTexto := RAt("U","PAULOU")
	cTexto2 := "EDIVAR"
	nNumCar := Len(cTexto2)
	cTexto2 := Lower("EDIVAR")
	CNomeCli := PadR("Edivar de Araujo Souza", 10, "*")

	Stuff("PPQQQPP",3,3,"RRR")

	cNomeCli := SubStr("Edivar de Araujo Souza", 1,6)

	CNomeCli := StrTran("Edivar de Araujo Souza", "o", "z")


	If nResult > 0
		ALERT("Maior que 0")
	elseif nResult < 0
		ALERT("Menor que 0")
	elseif nResult == 0
		ALERT("Igual a 0")
	elseif nResult <= 0
		ALERT("Menor ou igual a 0")
	elseif nResult >= 0
		ALERT("Maior ou igual 0")
	elseif nResult <> 0
		ALERT("Diferente de 0")
	elseif nResult # 0
		ALERT("Diferente de 0")
	elseif nResult != 0
		ALERT("Não igual a 0")
	EndIf

	if nResult > 0 .And. "TESTE" $ cBranco
	 Alert("Teste de E ok")
	elseif nResult > 0 .Or. "TESTE" $ cBranco
	  Alert("Teste de OU ok")
	elseif .Not.(nResult > 0) .Or. !("TESTE" $ cBranco)
	  Alert("Teste de OU ok")
	elseif !(nResult > 0 .And. "TESTE" $ cBranco)
	  Alert("Não aconteceu")
	EndIf

	nResult := nCalc
	nResult := nResult + nCalc //OU
 	nResult += nCalc
	nResult -= nCalc
	nResult	 *= nCalc
	nResult /= nCalc
	// nResult **= 5 // OU
	//nResult ^= 5
	//nNumero  %= 2

	nCont := 0
	nCont2 := 10

	while nCont < 10
	 nNumero += 2
	 nCalc += 1
	 nAcer += 3

	 nCont ++
	 nCont2 --
	end
   nNumero := nCalc := nAcer := 0

   //=================================================================================================================

	 nTotal := Abs(100 - 1000)
	 nNumero := NoRound(10.398, 1)

	 if ValType(cUsuario) == "C"
	 EndIf

	 if Type("dDia") # "D"
	   dDia := Date()
   EndIf

	 if dDia == dDia2
	 EndIf

	dbSelectArea("SZ1")
	dbSetOrder(1)
	*/

	/*
	//ASort(aCampos,,,{|x,y|x[1]<y[1]})


	dbSelectArea(cString) //ABRE A TABELA SZ1s
	mBrowse( 6,1,22,75,cString,aCampos,cCampo)

	If !Empty(cCampo) .And. !Empty(cString);//ENTER
		.And. Len(aCampos) > 0

	EndIf

	*/
