#include "TOTVS.CH"

User Function TDialog() 
 // cria di�logo
 Local oDlg := TDialog():New(180,180,550,700,'Exemplo TDialog',,,,,CLR_BLACK,CLR_WHITE,,,.T.)
 // ativa di�logo centralizado
 oDlg:Activate(,,,.T.,{||msgstop('validou!'),.T.},,{||msgstop('iniciando?')} )
Return
