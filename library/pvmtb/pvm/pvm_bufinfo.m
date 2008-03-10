%PVM_BUFINFO		Informaci�n sobre buffer de mensajes
%
%  [info bfinfo] = pvm_bufinfo(bufid)	* bfinfo: struct [bytes,msgtag,tid]
%
%  bufid (int) identificador de buffer
%  info  (int) c�digo retorno
%        0 PvmOk
%      -16 PvmNoSuchBuf
%       -2 PvmBadParam
%  bfinfo (struct) informaci�n del mensaje en buffer
%          bytes, msgtag, tid de la tarea de la que proviene
%
%  Implementaci�n MEX completa: src/pvm_bufinfo.c, pvm/MEX/pvm_bufinfo.mexlx

