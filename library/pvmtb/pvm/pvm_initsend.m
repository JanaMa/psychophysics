%PVM_INITSEND		Limpia buffer env�o por defecto y ajusta codificaci�n
%
%  bufid = pvm_initsend [ (encoding) ]
%
%  encoding (int) codificaci�n deseada (opcional)
%      0 PvmDataDefault 0 XDR (Default)
%      1 PvmDataRaw     1 sin codificaci�n
%      2 PvmDataInPlace 2 los datos no se copian, se dejan donde est�n
%
%  bufid (int) identificador de buffer
%     <0 c�digo error
%     -2 PvmBadParam
%    -10 PvmNoMem
%
%  Implementaci�n MEX completa: src/pvm_initsend.c, pvm/MEX/pvm_initsend.mexlx

