%PVM_TIDTOHOST		Devuelve dtid del daemon (host en que est� la tarea)
%
%  dtid = pvm_tidtohost(tid)		* tid, dtid: int/array
%
%  tid	(int/array) tareas PVM
%  dtid	(int/array) tid de los daemons respectivos
%     >0 pvmd tid
%     -2 PvmBadParam
%    -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_tidtohost.c, pvm/MEX/pvm_tidtohost.mexlx

