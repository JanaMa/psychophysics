%PVM_PRECV		Recibe/desempaqueta arraydouble en una sola llamada PVM
%
%  [info bfinfo] = pvm_precv(tid, msgtag, 'vnam', len) *struct[bytes,msgtag,tid]
%
%  tid    (int) identificador de la tarea que env�a. -1 para cualquiera
%  msgtag (int) c�digo del mensaje >=0. -1 para cualquiera
%  vnam(string) nombre deseado para la variable desempaquetada
%  len    (int) longitud del array (n�mero de doubles a desempaquetar)
%		pvm_psend lo indica como 2� argout
%
%  bfinfo(struct) informaci�n del mensaje recibido y desempaquetado
%    bytes  (int) longitud actual del mensaje recibido
%    msgtag (int) tag actual del emisor
%    tid    (int) tid actual del emisor
%  info     (int) c�digo de estado
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_precv.c, pvm/MEX/pvm_precv.mexlx

