%PVM_PARENT		Devuelve el tid de la tarea PVM que hizo spawn de �sta
%
%  tid = pvm_parent
%
%  tid (int) identificador de la tarea que hizo spawn de �sta
%      >0 ptid
%     -14 PvmSysErr
%     -23 PvmNoParent
%
%  Implementaci�n MEX completa: src/pvm_parent.c, pvm/MEX/pvm_parent.mexlx

