%PVM_SETRBUF		Cambia el buffer de recepci�n actual
%
%  oldbuf = pvm_setrbuf(bufid)
%
%  bufid (int) >0 buffer de recepci�n deseado
%              =0 para que no haya ninguno
%
%  oldbuf(int) antiguo buffer de recepci�n
%      <0 c�digo de error
%      -2 PvmBadParam
%     -16 PvmNoSuchBuf
%
%  Implementaci�n MEX completa: src/pvm_setrbuf.c, pvm/MEX/pvm_setrbuf.mexlx

