%PVM_MKBUF		Crea un nuevo buffer de mensajes
%
%  bufid = pvm_mkbuf [ (encoding) ]
%
%  encoding (int) codificaci�n deseada (opcional)
%         0 PvmDataDefault XDR (Default)
%         1 PvmDataRaw     sin codificaci�n
%         2 PvmDataInPlace los datos no se copian, se dejan donde est�n
%
%  bufid (int) identificador de buffer
%        <0 c�digo error
%        -2 PvmBadParam
%       -10 PvmNoMem
%
%  Implementaci�n MEX completa: src/pvm_mkbuf.c, pvm/MEX/pvm_mkbuf.mexlx

