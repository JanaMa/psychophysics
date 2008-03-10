%PVM_HOSTSYNC		Obtiene Reloj y Delta de un host PVM
%
%  [info clk dlt] = pvm_hostsync(hTID)	* clk, dlt: struct timeval
%
%  hTID (int) TID del host (daemon pvm correspondiente)
%  info (int) c�digo retorno
%        0 PvmOk
%      -14 PvmSysErr
%       -6 PvmNoHost
%      -22 PvmHostFail
%
%  clk (struct) reloj del host
%  dlt (struct) delta (diferencia) con el reloj del host local
%	struct timeval: "sec", "usec"
%	ojo si dlt negativo, ver p�gina man pvm_hostsync(3PVM)
%
%  Implementaci�n MEX completa: src/pvm_hostsync.c, pvm/MEX/pvm_hostsync.mexlx

