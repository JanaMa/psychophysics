function mhid = pvm_addmhf(src, tag, ctx, MatlabCMD)
%PVM_ADDMHF		Instala funci�n manejadora de mensajes
%
%  mhid = pvm_addmhf(src, tag, ctx, 'MatlabCMD')
%
%  src   (int) tid de la tarea PVM fuente del mensaje a manejar
%  tag   (int) tag                        del mensaje a manejar
%  ctx   (int) contexto PVM en que se envi� el  "     a manejar
%  MatlabCMD (string) comando de manejo del   mensaje
%			debe aceptar 1 arg num�rico (bufid)
%
%  mhid  (int) >=0 identificador asignado por PVM al manejador
%     -33 PvmExists	ya hay manejador con ese (src,tag,ctx)
%
%  Implementaci�n MEX quasi-completa: src/pvm_mhf.c, pvm/MEX/pvm_mhf.mexlx

mhid = pvm_mhf('add', src, tag, ctx, MatlabCMD);
