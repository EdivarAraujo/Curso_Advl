#Include "Protheus.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MBrwSA3    Autor � Paulo Bindo        � Data �  26/10/21   ���
�������������������������������������������������������������������������͹��
���Descricao � cadastro SA3 COM MBRWOSE                                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP6 IDE                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MBrwSA3()
  Local cAlias := "SA3"
  Local aCores := {}
  Local cFiltra := ""

  Private cCadastro := "Cadastro de Vendedor"
  Private aRotina := {}
  Private aIndexA3 := {}
  Private bFiltraBrw:={||}

  //BOTOES MENU
  AADD(aRotina,{"Pesquisar" ,"PesqBrw" ,0,1})		//AADD(aRotina,{"Pesquisar" ,"AxPesqui",0,1})
  AADD(aRotina,{"Visualizar","AxVisual" ,0,2})
  AADD(aRotina,{"Incluir" ,"U_BInclui" ,0,3})		//AADD(aRotina,{"Incluir" ,"AxInclui",0,3})
  AADD(aRotina,{"Alterar" ,"U_BAltera" ,0,4})  	//AADD(aRotina,{"Alterar" ,"AxAltera" ,0,4})
  AADD(aRotina,{"Excluir" ,"U_BDeleta" ,0,5})		//AADD(aRotina,{"Excluir" ,"AxDeleta",0,5})
  AADD(aRotina,{"Legenda" ,"U_BLegenda" ,0,3})
  if RetCodUsr() # "000000"
    AADD(aRotina,{"Processa" ,"U_PBMsgRun()" ,0,6})
  Endif
  //CORES LEGENDA
  AADD(aCores,{"Z1_TIPO == 'M'" ,"BR_VERDE" })
  AADD(aCores,{"Z1_TIPO == 'D'" ,"BR_AMARELO" })

  dbSelectArea(cAlias)
  dbSetOrder(1)
  //+------------------------------------------------------------
  //| Cria o filtro na MBrowse utilizando a fun��o FilBrowse
  //+------------------------------------------------------------

  //cFiltra	:= ' SA3->Z1_FATOR > 10 '
  bFiltraBrw 	:={ || FilBrowse(cAlias,@aIndexSA3,@cFiltra) }
  Eval(bFiltraBrw)
  dbSelectArea(cAlias)
  dbGoTop()
  mBrowse(6,1,22,75,cAlias,,,,,,aCores)
  //+------------------------------------------------
  //| Deleta o filtro utilizado na fun��o FilBrowse
  //+------------------------------------------------
  EndFilBrw(cAlias,aIndexSA3)
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BInclui    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA INCLUSAO                                            ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

User Function BInclui(cAlias,nReg,nOpc)
  Local nOpcao := 0

  // nOpcao := AxInclui(cAlias,nReg,nOpc)
  If nOpcao == 1
    MsgInfo("Inclus�o efetuada com sucesso!")
  Else
    MsgInfo("N�o � permitido a inclus�o de um novo vendedor!")
  Endif


Return Nil


/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BAltera    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA ALTERACAO                                           ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
User Function BAltera(cAlias,nReg,nOpc)
  Local nOpcao := 0
  nOpcao := AxAltera(cAlias,nReg,nOpc)
  If nOpcao == 1
    MsgInfo("Altera��o efetuada com sucesso!")
  Else
    MsgInfo("Altera��o cancelada!")
  Endif
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BDeleta    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA EXCLUSAO                                            ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
User Function BDeleta(cAlias,nReg,nOpc)
  Local nOpcao := 0
  nOpcao := AxDeleta(cAlias,nReg,nOpc)
  If nOpcao == 1
    MsgInfo("Exclus�o efetuada com sucesso!")
  Else
    MsgInfo("Exclus�o cancelada!")
  Endif
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BLegenda   Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA LEGENDA                                             ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

User Function BLegenda()
  Local ALegenda := {}

  AADD(aLegenda,{"BR_VERDE" ,"Multiplica" })
  AADD(aLegenda,{"BR_AMARELO" ,"Divide" })
  BrwLegenda(cCadastro, "Legenda", aLegenda)
Return Nil
