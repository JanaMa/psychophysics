%PVM_GETTMASK		Devuelve la m�scara de traza de una tarea o sus hijas
%
%  [info mask]= pvm_gettmask('who')
%
%  who (string) 'Self'  para la propia tarea
%		'Child' para las tareas arrancadas a partir de ahora
%  mask(string) m�scara de TEV_MASK_LENGTH (36) chars devuelta
%  info   (int) c�digo de retorno
%      0 PvmOk
%     -2 PvmBadParam
%
%  Implementaci�n MEX completa: src/pvm_gettmask.c, pvm/MEX/pvm_gettmask.mexlx

