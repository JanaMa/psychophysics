%PVM_KILL		Termina tarea PVM
%
%  info = pvm_kill(tid)			* tid,info: int/array
%
%  tid	(int/array) tarea PVM (no uno mismo, para eso pvm_exit() mejor)
%                   double � double array (info saldr� del mismo tama�o)
%  info (int/array) c�digo retorno
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_kill.c, pvm/MEX/pvm_kill.mexlx

