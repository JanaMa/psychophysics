%PVM_TRECV		Recibe un mensaje, crea buffer recepci�n. Con timeout.
%
%  bufid = pvm_trecv(tid, msgtag, tmout)	* tid, bufid: int * tmout: real
%
%  tid    (int) identificador de la tarea que env�a. -1 para cualquiera
%  msgtag (int) c�digo del mensaje >=0. -1 para cualquiera
%  tmout (real) tiempo m�ximo de espera (unidad secs, precisi�n usecs)
%               0 como pvm_nrecv       (probe-return)
%              [] como pvm_recv        (esperar indefinidamente)
%  bufid (int) <0 c�digo de estado
%      >0 nuevo buffer recepci�n
%       0 PvmOk (pas� el tmout sin recibirse mensaje)
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_trecv.c, pvm/MEX/pvm_trecv.mexlx

