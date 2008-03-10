%PVM_PROBE		Comprueba si ha llegado un mensaje determinado
%
%  bufid = pvm_probe(tid, msgtag)	* tid, bufid: int
%
%  tid    (int) identificador de la tarea que env�a. -1 para cualquiera
%  msgtag (int) c�digo del mensaje >=0. -1 para cualquiera
%  bufid  (int) <0 c�digo de estado
%      >0 nuevo buffer recepci�n. Permite pvm_bufinfo pero no pvm_unpack.
%                                 Llamar  pvm_recv para poder pvm_unpack
%       0 PvmOk (no ha llegado mensaje)
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_probe.c, pvm/MEX/pvm_probe.mexlx

