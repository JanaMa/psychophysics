%PVM_RECV		Recibe un mensaje, crea buffer recepci�n. Bloqueante.
%
%  bufid = pvm_recv(tid, msgtag)		* tid, bufid: int
%
%  tid    (int) identificador de la tarea que env�a. -1 para cualquiera
%  msgtag (int) c�digo del mensaje >=0. -1 para cualquiera
%  bufid  (int) <0 c�digo de estado
%      >0 nuevo buffer recepci�n
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_recv.c, pvm/MEX/pvm_recv.mexlx

