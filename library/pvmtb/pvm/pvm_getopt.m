%PVM_GETOPT		Devuelve el valor de alguna opci�n libPVM
%
%  val = pvm_getopt(what)
%
%  val  (int)
%     >0 valor de la opci�n
%     -2 PvmBadParam
%  what (int) opci�n sobre la que se pregunta
%        PvmRoute              1    Pol�tica de Enrutamiento de Mensajes
%        PvmDebugMask          2    M�scara de depuraci�n libPVM
%        PvmAutoErr            3    Informe autom�tico de error
%        PvmOutputTid          4    Destino de stdout de tareas hijas
%        PvmOutputCode         5    Tag para stdout hijas
%        PvmTraceTid           6    Destino de traza de tareas hijas
%        PvmTraceCode          7    Tag para traza hijas
%        PvmTraceBuffer        8    Hacer buffer de traza para hijas
%        PvmTraceOptions       9    Opciones de traza para hijas
%        PvmFragSize          10    Tama�o de fragmento de mensajes
%        PvmResvTids          11    Permitir Tags y Tids reservados en mensajes
%        PvmSelfOutputTid     12    Destino de stdout
%        PvmSelfOutputCode    13    Tag para stdout
%        PvmSelfTraceTid      14    Destino de traza
%        PvmSelfTraceCode     15    Tag para traza
%        PvmSelfTraceBuffer   16    Hacer buffer de traza
%        PvmSelfTraceOptions  17    Opciones de traza
%        PvmShowTids          18    pvm_catchout imprime Tids hijas
%        PvmPollType          19    Pol�tica espera mensajes (shared memory)
%        PvmPollTime          20    Duraci�n de spinwait de mensajes
%        PvmOutputContext     21    Contexto stdout hijas
%        PvmTraceContext      22    Contexto traza hijas
%        PvmSelfOutputContext 23    Contexto stdout
%        PvmSelfTraceContext  24    Contexto traza
%        PvmNoReset           25    No matar tarea cuando reset
%
%  Implementaci�n MEX completa: src/pvm_getopt.c, pvm/MEX/pvm_getopt.mexlx

