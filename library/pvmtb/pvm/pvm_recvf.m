function pvm_recvf(MatlabCMD)
%PVM_RECVF		Redefine funci�n comparaci�n usada para aceptar mensajes
%
%  pvm_recvf [ ('MatlabCMD') ]
%
%  MatlabCMD (string) comando de comparaci�n de mensajes
%			debe aceptar 3 args num�ricos (bufid,int,tag)
%	     (vac�o)  para volver a dejar la funci�n inicial
%
%  Implementaci�n MEX completa: src/pvm_recvf.c, pvm/MEX/pvm_recvf.mexlx
%
%	SINOPSIS PARA MatlabCMD
%
%  cc = function(bufid, tid, tag)
%
%  bufid(int) identificador de mensaje a comparar
%  tid  (int) tid de tarea PVM deseada por el usuario
%  tag  (int) tag de mensaje "
%
%  cc   (int)	c�digo de condici�n para indicar a PVM que debe...
%	<0	retornar inmediatamente con este c�digo de error
%	 0	no tomar este mensaje (bufid)
%	 1	s� tomar este mensaje, dejar de scanear mensajes
%	>1	rango para este mensaje, seguir escaneando y quedarse con m�x.
%
%	Ver p�gina man pvm_recvf(3PVM)

