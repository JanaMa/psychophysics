%PVM_GSIZE		Devuelve el n� de instancias actualmente en el grupo
%
%  size = pvm_gsize('group')
%
%  group (string) nombre del grupo
%  size  (int)    n�mero de instancias en el grupo
%      <0 c�digo de error
%     -14 PvmSysErr
%     -19 PvmNoGroup
%      -2 PvmBadParam
%
%  Implementaci�n MEX completa: src/pvm_gsize.c, pvm/MEX/pvm_gsize.mexlx

