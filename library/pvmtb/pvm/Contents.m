% PVMTB - Implementaci�n MEX de las llamadas pvm_*
% Requiere linkado din�mico de las librer�as libpvm3.so, libgpvm3.so,
%                         y del programa pvmgs
%
% Control de la M�quina Virtual Paralela
%   PVM_START_PVMD	Arranque daemon PVMD, ver p�gina man pvmd(1PVM)
%   PVM_ADDHOSTS	A�ade hosts a la m�quina virtual PVM
%   PVM_DELHOSTS	Quita hosts de la m�quina virtual PVM
%   PVM_SPAWN		Arranca nuevos procesos bajo PVM
%   PVM_KILL		Termina tarea PVM
%   PVM_SENDSIG		Env�a una se�al a otra tarea PVM (p�gina man signal(7))
%   PVM_NOTIFY		Solicita que se notifiquen eventos PVM (host abajo...)
%   PVM_EXIT		Abandona PVM, ver p�gina manual     man pvm_exit(3PVM)
%   PVM_HALT		Mata PVM, ver p�gina manual     man pvm_halt(3PVM)
%   PVM_CATCHOUT	Captura stdout de tareas hijas en fichero
%   PVM_GETOPT		Devuelve el valor de alguna opci�n libPVM
%   PVM_SETOPT		Ajusta el valor de alguna opci�n libPVM
%   PVM_GETTMASK	Devuelve la m�scara de traza de una tarea o sus hijas
%   PVM_SETTMASK	Ajusta la m�scara de traza de una tarea o sus hijas
%   TEV_MASK_INIT	Inicializa bits en variable string m�scara de traza
%   TEV_MASK_SET	Activa bits en variable string m�scara de traza
%   TEV_MASK_UNSET	Borra bits en variable string m�scara de traza
%   TEV_MASK_CHECK	Comprueba bits en variable string m�scara de traza
%
%
% Informaci�n de la M�quina Virtual Paralela
%   PVM_CONFIG		Estado de la M�quina Virtual Paralela
%   PVM_MSTAT		Estado de una m�quina bajo PVM
%   PVM_TASKS		Informaci�n sobre tareas bajo PVM
%   PVM_PSTAT		Estado de un proceso bajo PVM
%   PVM_MYTID		Devuelve el tid de esta tarea PVM
%   PVM_PARENT		Devuelve el tid de la tarea PVM que hizo spawn de �sta
%   PVM_TIDTOHOST	Devuelve dtid del daemon (host en que est� la tarea tid)
%   PVM_PERROR		Escribe �ltimo errmsg PVM (spawned en /tmp/pvml.uid)
%   PVM_VERSION		Versi�n de PVM
%   PVM_ARCHCODE	C�digo de representaci�n de datos para archname
%   PVM_GETFDS		sockets abiertos bajo PVM (ejemplo man pvm_getfds(3PVM))
%   PVM_HOSTSYNC	Obtiene Reloj y Delta de un host PVM
%   PVM_SIBLINGS	N�mero de tareas (y TIDs) que fueron arrancadas juntas
%
% Env�o/Recepci�n de Mensajes
%   PVM_INITSEND	Limpia buffer env�o por defecto y ajusta codificaci�n
%   PVM_PACK		Empaqueta datos Matlab cualesquiera
%   PVM_UNPACK		Des-empaqueta datos Matlab cualesquiera
%   PVM_SEND		Env�a los datos del buffer de mensajes activo
%   PVM_RECV		Recibe un mensaje, crea buffer recepci�n. Bloqueante.
%   PVM_TRECV		Recibe un mensaje, crea buffer recepci�n. Con timeout.
%   PVM_NRECV		Recibe un mensaje, crea buffer recepci�n. No bloqueante.
%   PVM_PROBE		Comprueba si ha llegado un mensaje determinado
%   PVM_MCAST		Env�a buffer de mensajes activo a varias tareas PVM
%
%   PVM_PKINT		Empaqueta 1 entero
%   PVM_UPKINT		Desempaqueta 1 entero
%   PVM_PKSTR		Empaqueta 1 string null-terminated
%   PVM_UPKSTR		Desempaqueta 1 string null-terminated
%   PVM_PKDOUBLE	Empaqueta 1 double
%   PVM_UPKDOUBLE	Desempaqueta 1 double
%   PVM_PKMESG		Empaqueta un mensaje en otro mensaje
%   PVM_UPKMESG		Desempaqueta mensaje en otro mensaje
%   PVM_PKMESGBODY	Empaqueta cuerpo de mensaje (sin header) en otro mensaje
%
%   PVM_PSEND		Empaqueta/env�a arraydouble en una sola llamada PVM
%   PVM_PRECV		Recibe/desempaqueta arraydouble en una sola llamada PVM
%
% Buffers env�o/recepci�n
%   PVM_MKBUF		Crea un nuevo buffer de mensajes
%   PVM_FREEBUF		Libera un buffer de mensajes
%   PVM_BUFINFO		Informaci�n sobre buffer de mensajes
%   PVM_GETMINFO	Informaci�n sobre mensajes
%   PVM_SETMINFO	Ajusta informaci�n sobre mensajes
%   PVM_GETRBUF		Devuelve el identificador del buffer de recepci�n actual
%   PVM_GETSBUF		Devuelve el identificador del buffer de env�o actual
%   PVM_SETRBUF		Cambia el buffer de recepci�n actual
%   PVM_SETSBUF		Cambia el buffer de env�o actual
%
% Mailbox Global
%   PVM_PUTINFO		Almacena mensaje en el Mailbox Global
%   PVM_RECVINFO	Consulta mensaje en el Mailbox Global
%   PVM_DELINFO		Borra entrada en el Mailbox Global
%   PVM_GETMBOXINFO	Consulta mensajes en el Mailbox Global
%
% Grupos
%   PVM_JOINGROUP	Enrola en el grupo mencionado a la tarea que llama
%   PVM_FREEZEGROUP	Congela pertenencia din�mica al grupo
%   PVM_LVGROUP		Des-enrola del grupo mencionado a la tarea que llama
%   PVM_BARRIER		Sincronizaci�n de tareas en grupo
%   PVM_GETINST		Devuelve el n� instancia en un grupo de una tarea PVM
%   PVM_GETTID		Devuelve el TID de una instancia en un grupo
%   PVM_GSIZE		Devuelve el n� de instancias actualmente en el grupo
%   PVM_BCAST		Env�a buffer de mensajes activo a instancias grupo
%   PVM_REDUCE		Reduce variable Matlab de varias instancias a una sola
%   PVM_SCATTER		Reparte una variable Matlab entre varias instancias
%   PVM_GATHER		Reune variables Matlab de varias instancias en una sola
%
% Variables de Entorno
%   PVM_EXPORT		Marca variable de entorno para exportar con spawn
%   PVM_UNEXPORT	Des-Marca variable de entorno para exportar con spawn
%
% Contextos
%   PVM_GETCONTEXT	Obtiene el contexto actual
%   PVM_NEWCONTEXT	Solicita nuevo contexto
%   PVM_SETCONTEXT	Cambia a contexto nuevo
%   PVM_FREECONTEXT	Libera contexto existente (usado � solicitado)
%
% Registro de manejadores
%   PVM_REG_HOSTER	Registra la tarea como responsable de a�adir hosts PVM
%   PVM_REG_TASKER	Registra tarea como responsable de arrancar tareas PVM
%   PVM_REG_RM		Registra la tarea como manejadora de recursos
%   PVM_ADDMHF		Instala funci�n manejadora de mensajes
%   PVM_DELMHF		Desinstala funci�n manejadora de mensajes
%   PVM_RECVF		Redefine funci�n comparaci�n usada para aceptar mensajes
%
% Extensiones al PVM	(Implementaci�n .M)
%   PVME_DEFAULT_CONFIG	Copia (fichero) configuraci�n PVM a /tmp/pvmdefconf.uid
%   PVME_START_PVMD	Arranque daemon PVMD con comodidades, man pvmd(1PVM)
%   PVME_IS		Devuelve 0 si no hay PVM en ejecuci�n, 1 si lo hay
%   PVME_GIDS		TIDS de todas las instancias en un grupo
%   PVME_PACK		Empaqueta datos Matlab cualesquiera agrupados con {}
%   PVME_KILL		Termina tarea PVM
%   PVME_UPKNTFY	Desempaqueta mensaje de notificaci�n
%
% Utilidades
%   HOSTNAME	(M)	Devuelve el nombre del ordenador
%   UID		(M)	Devuelve el user-id seg�n Unix (id -u) como string
%   PUTENV		A�ade � cambia una variable de entorno
%   UNSETENV		Elimina una variable de entorno
%   SELECT		Ejercita syscall select(), algo as� como KeyPressed
%
% No documentadas
%   PVM_TICKLE		Diversos volcados de informaci�n y configuraci�n
%
% Obsoletas pero documentadas
%   PVM_ADVISE		Ajusta enrutado directo tareas PVM3.2 (ver pvm_setopt)
%   PVM_SERROR		Ajusta eco autom�tico errores PVM3.2 (ver pvm_setopt)
%   PVM_GETMWID		Consulta wait-id de un mensaje (ver pvm_getminfo)
%   PVM_SETMWID		Ajusta wait-id de un mensaje (ver pvm_setminfo)
%   PVM_DELETE		Borra datos del Mailbox PVM3.3 (ver pvm_delinfo)
%   PVM_INSERT		Almacena datos en el Mailbox PVM3.3 (ver pvm_putinfo)
%   PVM_LOOKUP		Consulta datos en Mailbox PVM3.3 (ver pvm_getmboxinfo)

