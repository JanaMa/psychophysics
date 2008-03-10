%PVM_PSEND		Empaqueta/env�a arraydouble en una sola llamada PVM
%
%  [info len] = pvm_psend(tid, msgtag, data)
%
%  tid    (int) identificador de la tarea a la que se manda el mensaje
%  msgtag (int) c�digo del mensaje >=0
%  data(double) array a empaquetar y enviar
%
%  len    (int) longitud a usar en el respectivo pvm_precv
%  info   (int) c�digo de estado
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_psend.c, pvm/MEX/pvm_psend.mexlx

