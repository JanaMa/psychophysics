%PVM_GETINST		Devuelve el n� instancia en un grupo de una tarea PVM
%
%  inum = pvm_getinst('group', tid)     * inum, tid: int/array
%
%  group (string) nombre del grupo
%  tid  (int/arr) identificador tarea PVM
%  inum (int/arr) n� instancia dentro del grupo
%     <0 c�digo de error
%    -14 PvmSysErr
%     -2 PvmBadParam
%    -19 PvmNoGroup
%    -20 PvmNotInGroup
%
%  Implementaci�n MEX completa: src/pvm_getinst.c, pvm/MEX/pvm_getinst.mexlx

