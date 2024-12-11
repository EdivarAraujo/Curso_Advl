#include "protheus.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MkBrwSz1   Autor � Paulo Bindo        � Data �  26/10/21   ���
�������������������������������������������������������������������������͹��
���Descricao � MARKBROWSE SZ1         E                                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP6 IDE                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/
USER FUNCTION MkBrwSz1()
	Local aCpos := {}
	Local aCampos := {}
	Local nI := 0
	Local cAlias := "SZ1"
	Private aRotina := {}
	Private cCadastro := "Cadastro de UM por Clientes"
	Private aRecSel := {}

    //BOTOES
	AADD(aRotina,{"Visualizar Lote","U_VisLote",0,5})

    //CAMPOS DO BROWSE
	AADD(aCpos, "Z1_OK" )
	AADD(aCpos, "Z1_FILIAL" )
	AADD(aCpos, "Z1_CLIENT" )
	AADD(aCpos, "Z1_LOJA" )
	AADD(aCpos, "Z1_PRODUT" )
	AADD(aCpos, "Z1_FATOR" )
	dbSelectArea("SX3")
	dbSetOrder(2)
	For nI := 1 To Len(aCpos)
		IF dbSeek(aCpos[nI])
			AADD(aCampos,{X3_CAMPO,"",IIF(nI==1,"",Trim(X3_TITULO)),Trim(X3_PICTURE)})
		ENDIF
	Next

	DbSelectArea(cAlias)
	DbSetOrder(1)
	MarkBrow(cAlias,aCpos[1],"Z1_TIPO == ' '",aCampos,.F.,		GetMark(,"SZ1","Z1_OK"))
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � VisLote   Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � VISUALIZA LOTE SZ1                                         ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
USER FUNCTION VisLote()
	Local cMarca := ThisMark()
	Local nX := 0
	Local lInvert := ThisInv()
	Local cTexto := ""
	Local cEOL := CHR(10)+CHR(13)
	Local oDlg
	Local oMemo
	DbSelectArea("SZ1")
	dbSetOrder(1)
	DbGoTop()

	While !EOF()

		IF SZ1->Z1_OK == cMarca .AND. !lInvert
			AADD(aRecSel,{SZ1->(Recno()),SZ1->Z1_CLIENT, SZ1->Z1_LOJA, SZ1->Z1_PRODUT})
		ELSEIF SZ1->Z1_OK != cMarca .AND. lInvert
			AADD(aRecSel,{SZ1->(Recno()),SZ1->Z1_CLIENT,SZ1->Z1_LOJA, SZ1->Z1_PRODUT})
		ENDIF
		dbSkip()
	Enddo

	IF Len(aRecSel) > 0
		cTexto := "Cliente | Loja | Cod.Produto "+cEol
		// "1234567890123456789012345678901234567890
		// "CCCCCC | LL | NNNNNNNNNNNNNNNNNNNN +cEol

		For nX := 1 to Len(aRecSel)
			cTexto+=aRecSel[nX][2]+Space(1)+"|"+Space(2)+aRecSel[nX][3] + Space(3)+"|"
			cTexto += Space(1)+SUBSTRING(aRecSel[nX][4],1,20)+Space(1)
			cTexto += cEOL
		Next nX

		DEFINE MSDIALOG oDlg TITLE "Clientes Selecionados" From 000,000 TO 350,400 PIXEL
		@ 005,005 GET oMemo VAR cTexto MEMO SIZE 150,150 OF oDlg PIXEL
		oMemo:bRClicked := {||AllwaysTrue()}
		DEFINE SBUTTON FROM 005,165 TYPE 1 ACTION oDlg:End() ENABLE OF oDlg PIXEL
		ACTIVATE MSDIALOG oDlg CENTER
		LimpaMarca()
	ENDIF
RETURN

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � LimpaMarca Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � LIMPA O QUE ESTA MARCADO                                   ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
STATIC FUNCTION LimpaMarca()
	Local nX := 0
	For nX := 1 to Len(aRecSel)
		SZ1->(DbGoto(aRecSel[nX][1]))
		RecLock("SZ1",.F.)
		SZ1->Z1_OK := SPACE(2)
		MsUnLock()
	Next nX
Return()
