%PVM_MSTAT		Estado de una m�quina bajo PVM
%
%  mstat = pvm_mstat ('host')
%
%  host(string) nombre de las m�quina
%  mstat  (int) informaci�n de estado
%        0  PvmOk       El host funciona
%       -6  PvmHoHost   El host no pertenece a PVM
%      -22  PvmHostFail El host no funciona
%      -14  PvmSysErr   falla el PVMd local
%
%  Implementaci�n MEX completa: src/pvm_mstat.c, pvm/MEX/pvm_mstat.mexlx

