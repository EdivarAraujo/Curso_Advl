#Include "Protheus.ch"

/*/{Protheus.doc} Pricipal
)
@type atividade de escopo de variveis
@author edivar de araujo souza
@since 07/10/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/

Static cTexto := "Estatica"

User Function Pricipal()
	Local nNumero := 10
	Private dData := Date()

	if nNumero >= 10.5
		Alert("O numero é maior")
	Endif

	Filha()
return

Static Function Filha()
	Local nNumero := 20
	Private lContinua := .T.
  Public aDados :=  {1,3,7}
	cTexto :=  "ALTERADA"
	cTexto := cTexto + " NOVAMENTE" +Space(10)
  dData := dData + nNumero

	if !lContinua
		Alert("lContinua é falsa")
	else
		Alert("lContinua é verdadeira")
	Endif

	U_Secundaria()
return

User function Secundaria()
	Local nNumero := 30
	aDados :=  {,0,0,0}
	nResto := nNumero % 4
  cTexto := cTexto - " SEM ESPAÇO"

	if "ATEU" $ cTexto
		Alert("Contida")
	else
		Alert("Não estacontida")
	Endif

return
