%PVM_DELHOSTS		Quita hosts de la m�quina virtual PVM
%
%  [numh infos] = pvm_delhosts('host' [,'host']...)
%
%  host (string)nombres de los hosts a eliminar (al menos 1)
%  numh (int)	n�mero de hosts realmente quitados
%      ==nhost	�xito total
%        0	ver infos
%
%  infos (int array[nhost]) informaci�n de estado
%         si hubo error parcial, estado puede ser c�digo error
%	  0	PvmOk
%	 -2	PvmBadParam
%	-14	PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_delhosts.c, pvm/MEX/pvm_delhosts.mexlx

