#Include "Protheus.ch"

/*/{Protheus.doc} zMiniForm
Função Mini Fórmulas, para executar fórmulas
@author Atilio
@since 17/12/2017
@version 1.0
@type function
@obs Assim como o fórmulas foi bloqueado no Protheus 12, cuidado ao deixar exposto no menu o Mini Fórmulas
/*/

User Function TESTAFUNC()
	Local aArea := GetArea()
	Local _aGrpUSR := {}
	Local _lDESENV := .F.
  Local _n := 0

	//Variaveis da tela
	Private oDlgForm
	Private oGrpForm
	Private oGetForm
	Private cGetForm := Space(250)
	Private oGrpAco
	Private oBtnExec
	//Tamanho da Janela
	Private nJanLarg := 500
	Private nJanAltu := 120
	Private nJanMeio := ((nJanLarg)/2)/2
	Private nTamBtn  := 048

	_aGrpUSR := UsrRetGrp()
	For _n:=1 to Len(_aGrpUSR)
		If ALLTRIM(_aGrpUSR[_n]) == "000000"
			_lDESENV := .T.
		Endif
	Next

	If !_lDESENV
		MsgStop("Usuário não autorizado, solicite acesso ao Administrador", "Operação não permitida")
		RETURN
	ENDIF

	//Criando a janela
	DEFINE MSDIALOG oDlgForm TITLE "TESTAFUNC - Execução de Formulas" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
	//Grupo Formula com o Get
	@ 003, 003  GROUP oGrpForm TO 30, (nJanLarg/2)-1        PROMPT "Formula: " OF oDlgForm COLOR 0, 16777215 PIXEL
	@ 010, 006  MSGET oGetForm VAR cGetForm SIZE (nJanLarg/2)-9, 013 OF oDlgForm COLORS 0, 16777215 PIXEL

	//Grupo acoes com o Botao
	@ (nJanAltu/2)-30, 003 GROUP oGrpAco TO (nJanAltu/2)-3, (nJanLarg/2)-1 PROMPT "Acoes: " OF oDlgForm COLOR 0, 16777215 PIXEL
	@ (nJanAltu/2)-24, nJanMeio - (nTamBtn/2) BUTTON oBtnExec PROMPT "Executar" SIZE nTamBtn, 018 OF oDlgForm ACTION(fExecuta()) PIXEL

	//Ativando a janela
	ACTIVATE MSDIALOG oDlgForm CENTERED
 
	RestArea(aArea)
Return

/*---------------------------------------*
 | Func.: fExecuta                       |
 | Desc.: Executa a formula digitada     |
 *---------------------------------------*/
 
Static Function fExecuta()
    Local aArea    := GetArea()
    Local cFormula := Alltrim(cGetForm)
    Local cError   := ""
    Local bError   := ErrorBlock({ |oError| cError := oError:Description})
    
    
    
    //Se tiver conteudo digitado
    If ! Empty(cFormula)
        oDlgForm:End()
        
        //Inicio a utilizacao da tentativa
        Begin Sequence
            &(cFormula)
        End Sequence
         
        //Restaurando bloco de erro do sistema
        ErrorBlock(bError)
         
        //Se houve erro, ser� mostrado ao usuario
        If ! Empty(cError)
            MsgStop("Houve um erro na formula digitada: "+CRLF+CRLF+cError, "Atencao")
        else
            MsgInfo("Rotina executada com sucesso!", "Processo Finalizado")
        EndIf
    EndIf
     
    RestArea(aArea)
Return
