%PVM_SETSBUF		Cambia el buffer de env�o actual
%
%  oldbuf = pvm_setsbuf(bufid)
%
%  bufid (int) >0 buffer de env�o deseado
%              =0 para que no haya ninguno
%
%  oldbuf(int) antiguo buffer de env�o
%      <0 c�digo de error
%      -2 PvmBadParam
%     -16 PvmNoSuchBuf
%
%  Implementaci�n MEX completa: src/pvm_setsbuf.c, pvm/MEX/pvm_setsbuf.mexlx

