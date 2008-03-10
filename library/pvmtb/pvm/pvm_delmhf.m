function info = pvm_delmhf(mhid)
%PVM_DELMHF		Desinstala funci�n manejadora de mensajes
%
%  info = pvm_delmhf(mhid)
%
%  mhid  (int) identificador PVM del manejador de mensajes a eliminar
%  info  (int) c�digo de retorno
%	0 PvmOk
%      -2 PvmBadParam
%     -32 PvmNotFound
%
%  Implementaci�n MEX quasi-completa: src/pvm_mhf.c, pvm/MEX/pvm_mhf.mexlx

info = pvm_mhf('del', mhid);
