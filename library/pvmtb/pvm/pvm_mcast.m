%PVM_MCAST		Env�a buffer de mensajes activo a varias tareas PVM
%
%  info = pvm_mcast(tids, msgtag)		* tids: int/array
%
%  tids   (int/arr) vector de tids de las tareas PVM a recibir mensaje
%  msgtag (int) c�digo del mensaje >=0
%  info   (int) c�digo de estado
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%     -15 PvmNoBuf
%
%  Implementaci�n MEX completa: src/pvm_mcast.c, pvm/MEX/pvm_mcast.mexlx

