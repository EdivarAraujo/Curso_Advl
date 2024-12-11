#Include "PROTHEUS.CH"


User Function DIRETIVA()

  Local nValor1 := 10
  Local nValor2 := 20
  Local nResultado := 0

  nResultado := RECEBE(@nValor1, nValor2)

  Alert(cValToChar(nResultado))

Return

Static Function RECEBE(nValor1, nValor2)
  Local nRetorno := 0

  nValor1 := 20

  nRetorno := nValor1 * nValor2


Return(nRetorno)
