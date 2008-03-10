%PVM_SPAWN		Arranca nuevos procesos bajo PVM
%
%  [numt tids] = pvm_spawn('task', { ['arg' [,'arg']...] } , flag,'where',ntask)
%
%  numt (int) n�mero de tareas realmente arrancadas
%       <0    c�digo error (ver tids)
%     ==ntask �xito total
%
%  tids (int array[ntask]) tids de las tareas PVM arrancadas
%        si hubo error parcial, algunos tids pueden ser c�digos error
%	 -2 PvmBadParam
%	 -6 PvmNoHost
%	 -7 PvmNoFile
%	-10 PvmNoMem
%	-14 PvmSysErr
%	-27 PvmOutOfRes
%
%  task (string) nombre del programa, path absoluto, relativo...
%          PVM debe poder encontrarlo ($HOME/pvm3/bin/$PVM_ARCH por defecto)
%  args (cell array strings) argumentos al ejecutable, {} si no tiene
%
%  flag (int) OR l�gico de las siguientes opciones
%	  PvmTaskDefault 0	PVM escoge d�nde
%	  PvmTaskHost    1	'where' es hostname
%	  PvmTaskArch    2	'where' es archname
%	  PvmTaskDebug   4	arrancar bajo debugger (ver DEBUGGER en  ...)
%	  PvmTaskTrace   8	los procesos generar�n traza
%	  PvmMppFront
%	  PvmHostCompl  32	Usar todos menos los host indicados
%
%  where (string) nombre de host o arch. Si flag==0, se ignora
%  ntask (int)    n�mero de tareas a arrancar
%
%  Implementaci�n MEX completa: src/pvm_spawn.c, pvm/MEX/pvm_spawn.mexlx

