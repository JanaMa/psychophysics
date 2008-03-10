%PVM_BARRIER		Sincronizaci�n de tareas en grupo
%
%  info = pvm_barrier('group', count)	* info, count: int/array por comodidad
%
%  group (string) nombre del grupo
%  count (int)    n� instancias para superar la barrera
%  info  (int)    c�digo de retorno
%       0 PvmOk
%     -14 PvmSysErr
%      -2 PvmBadParam
%      -3 PvmMismatch
%     -19 PvmNoGroup
%     -20 PvmNotInGroup
%				info, count pueden ser arrays por comodidad de
%			implementaci�n (igual que pvm_getinst, pvm_gettid)
%
%  Implementaci�n MEX completa: src/pvm_barrier.c, pvm/MEX/pvm_barrier.mexlx

