%PVM_PSTAT		Estado de un proceso bajo PVM
%
%  stat = pvm_pstat(tid)	* extensi�n para arrays pvme_pstat
%
%  tid (int/array) tids de los cuales se desea informaci�n de estado
%  stat(int/array) informaci�n de estado
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%     -31 PvmNoTask
%
%  Implementaci�n MEX completa: src/pvm_pstat.c, pvm/MEX/pvm_pstat.mexlx

