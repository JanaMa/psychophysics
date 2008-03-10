%PVM_PUTINFO		Almacena mensaje en el Mailbox Global
%
%  index = pvm_putinfo('name', bufid, flags)
%
%  name  (string) nombre de entrada a a�adir a Mailbox
%  bufid (int)    id.buffer de env�o a asociar con entrada Mailbox
%  flags (int)    opciones, OR de los siguientes bits
%        0 PvmMboxDefault	instancia no persistente, simple, bloqueada
%        1 PvmMboxPersistent	permanece tras salida creador
%        2 PvmMboxMultiInstance	permite entradas m�ltiples con mismo nombre
%        4 PvmMboxOverWritable	permite que otra tarea sobreescriba
%
%  index (int) �ndice en Mailbox asignado por PVMd
%       <0 c�digo de error
%      -33 PvmExists : ya existe dicha clave (name)
%       -8 PvmDenied : ya hay una entrada bloqueada con dicho nombre
%       -2 PvmBadParam (bufid)
%      -16 PvmNoSuchBuf
%      -10 PvmNoMem
%
%  Implementaci�n MEX completa: src/pvm_putinfo.c, pvm/MEX/pvm_putinfo.mexlx

