%PVM_NOTIFY		Solicita que se notifiquen eventos PVM (host abajo...)
%
%  info = pvm_notify(what, msgtag, (cnt | tids) )       * 3er arg seg�n 1�
%
%  what (int) tipo de evento a notificar
%       1 PvmTaskExit    Tarea acaba/muere.	Mensaje contiene TID acabado
%       2 PvmHostDelete  Host abajo/borrado.	Mensaje contiene TID PVMd "
%       3 PvmHostAdd     Host a�adido a m�quina virtual.
%                        Mensaje contiene #PVMds y TIDs PVMds en tabla
%       4 PvmRouteAdd    Ruta tarea-tarea abierta
%       5 PvmRouteDelete Ruta tarea-tarea cerrada
%  msgtag (int) c�digo del mensaje de notificaci�n >=0
%  cnt    (int) n�mero de notificaciones              (PvmHostAdd)
%                 se manda una cada vez que se modifica la tabla de Hosts
%                 nuevas llamadas pvm_notify alteran #notificaciones restantes
%                 llamar con cnt== 0 para interrumpir notificaciones
%                               ==-1 para reanudarlas
%  tids (int/array) vector TIDs cuya muerte notificar (TaskExit, HostDelete)
%
%  info (int) c�digo de estado
%       0 PvmOk
%      -2 PvmBadParam
%     -14 PvmSysErr
%
%  Implementaci�n MEX completa: src/pvm_notify.c, pvm/MEX/pvm_notify.mexlx

