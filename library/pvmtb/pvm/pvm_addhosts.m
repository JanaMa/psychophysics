%PVM_ADDHOSTS		A�ade hosts a la m�quina virtual PVM
%
%  [numh infos] = pvm_addhosts('host' [,'host']...)
%
%  host (string)nombres de los hosts a a�adir (al menos 1)
%  numh (int)  	n�mero de hosts realmente a�adidos
%       ==nhost(#elementos en hosts) �xito total
%	  0	ver infos
%	 -2	PvmBadParam
%	-30	PvmAlready
%	-14	PvmSysErr
%
%  infos (int array[nhost]) tids de los daemon PVMd arrancados
%        si hubo error parcial, algunos tids pueden ser c�digos error
%	 -2	PvmBadParam
%	 -6	PvmNoHost
%	-29	PvmCantStart
%	-28	PvmDupHost
%	-26	PvmBadVersion
%	-27	PvmOutOfRes
%
%  Implementaci�n MEX completa: src/pvm_addhosts.c, pvm/MEX/pvm_addhosts.mexlx

