%PVM_REG_RM		Registra la tarea como manejadora de recursos
%
%  [info hostinfo] = pvm_reg_rm
%
%  hostinfo (array struct pvmhostinfo) informaci�n sobre hosts
%	tid	tids del pvmd
%	name	hostname
%	arch	arquitectura
%	speed	velocidad relativa
%
%  info (int) c�digo de retorno
%       0 PvmOk
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_reg_rm.c, pvm/MEX/pvm_reg_rm.mexlx

