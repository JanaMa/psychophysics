%PVM_FREEZEGROUP	Congela pertenencia din�mica al grupo
%
%  info = pvm_freezegroup('group', size)   * info, size: int/array por comodidad
%
%  group (string) nombre del grupo
%  size  (int)    tama�o deseado del grupo para congelar
%  info  (int)    c�digo de retorno
%       0 PvmOk
%     -14 PvmSysErr
%      -2 PvmBadParam
%     -18 PvmDupGroup
%     -20 PvmNotInGroup
%      -3 PvmMismatch
%				info, size pueden ser arrays por comodidad de
%			implementaci�n (igual que pvm_getinst, pvm_gettid)
%
%  Implementaci�n MEX completa: pvm_freezegroup.c, pvm_freezegroup.mexlx

