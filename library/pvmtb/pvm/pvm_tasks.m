%PVM_TASKS		Informaci�n sobre tareas bajo PVM
%
%  [ntask tinfo] = pvm_tasks(where)
%
%  where (int) selector de �mbito
%        0        info sobre todas las tareas bajo PVM
%	 pvmd tid info sobre todas las tareas bajo dicho pvmd (ver pvm_config)
%	 tid      info sobre dicho tid
%
%  ntask (int) n�mero de tareas sobre las que se informa
%	<0 c�digo error
%	 PvmBadParam
%	 PvmSysErr
%	 PvmNoHost
%  tinfo (struct array pvmtaskinfo) informaci�n sobre las tareas
%	 tid	de la tarea
%	 ptid	del padre
%	 host	tid del pvmd
%	 flag	estado de la tarea
%	 aout	nombre del ejecutable (vac�o si empez� manualmente)
%
%  Implementaci�n MEX completa: src/pvm_tasks.c, pvm/MEX/pvm_tasks.mexlx

