%PVM_NRECV		Recibe un mensaje, crea buffer recepci�n. No bloqueante.
%
%  bufid = pvm_nrecv(tid, msgtag)		* tid, bufid: int
%
%  tid    (int) identificador de la tarea que env�a. -1 para cualquiera
%  msgtag (int) c�digo del mensaje >=0. -1 para cualquiera
%  bufid  (int) <0 c�digo de estado
%      >0 nuevo buffer recepci�n
%       0 PvmOk (no hay mensaje esperando recepci�n)
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_nrecv.c, pvm/MEX/pvm_nrecv.mexlx

