%PVM_CONFIG		Estado de la M�quina Virtual Paralela
%
%  [nhost narch hostinfo] = pvm_config
%
%  nhost (int) n�mero de hosts en PVM
%        <0 c�digo error
%       -14 PvmSysErr
%
%  narch (int) n�mero de arquitecturas diferentes
%
%  hostinfo (array struct pvmhostinfo) informaci�n sobre hosts
%           tid		tids del pvmd
%           name	hostname
%           arch	arquitectura
%           speed	velocidad relativa
%
%  Implementaci�n MEX completa: src/pvm_config.c, pvm/MEX/pvm_config.mexlx

