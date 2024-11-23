#include "protheus.ch"
#include "Rwmake.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} interface visual
Cria��o de tela para imput de dados

@author    Edivar de Araujo Souza
@version   11.3.10.201812061821
@since     21/06/2019
/*/

User Function IVisual()

  Local cTitulo := "Aula MSDIALOG"
  Local cTexto  :="CNPJ"
  Local cCGC    := Space(13)
  Local nOpca   := 0
  Private oDlg

  DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL
  @ 001,001 TO 040, 150 OF oDlg PIXEL
  @ 010,010 SAY cTexto SIZE 55, 07 OF oDlg PIXEL
  @ 010,050 MSGET cCGC SIZE 55, 11 OF oDlg PIXEL 	PICTURE "@R 99.999.999/9999-99" VALID ACGC(@cCGC)
  DEFINE SBUTTON FROM 010, 120 TYPE 1 ACTION (nOpca := 1,oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 020, 120 TYPE 2 ACTION (nOpca := 2,oDlg:End())ENABLE OF oDlg
  ACTIVATE MSDIALOG oDlg CENTERED

  If nOpca == 2
    Return
  EndIf

  MsgInfo("O CNPJ DIGITADO FOI:"+ cCGC)

Return
//*******************************************************************************
Static Function ACGC(cCGC)

  If cCGC # "1111111111111"
    MsgAlert("ERRO DE CGC", "ATENCAO")
    cCGC := "1111111111111"
    oDlg:Refresh()
  EndIf

Return
