%PVM_SETTMASK		Ajusta la m�scara de traza de una tarea o sus hijas
%
%  info = pvm_settmask('who', mask)
%
%  who (string) 'Self'  para la propia tarea
%		'Child' para las tareas arrancadas a partir de ahora
%  mask(string) m�scara de TEV_MASK_LENGTH (36) chars a poner
%  info   (int) c�digo de retorno
%      0 PvmOk
%     -2 PvmBadParam
%
%  Implementaci�n MEX completa: src/pvm_settmask.c, pvm/MEX/pvm_settmask.mexlx

