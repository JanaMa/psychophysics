%PVM_GETMBOXINFO	Consulta mensajes en el Mailbox Global
%
%  [info mbinfo] = pvm_getmboxinfo('pattern')	* mbinfo: struct pvmmboxinfo
%
%  pattern(string) expresi�n regular (* para todo)
%  info   (int)    c�digo de retorno
%       0 PvmOk
%     -10 PvmNoMem
%      -8 PvmDenied
%
%  mbinfo (struct pvmmboxinfo) informaci�n sobre las entradas en Mailbox Global
%   campos:(string) name	nombre de la clase
%             (int) nentries	n�mero de entradas para esta clase (nombre)
%   (int[nentries]) indices	�ndices      de las sucesivas entradas
%   (int[nentries]) owners	propietarios de las sucesivas entradas
%   (int[nentries]) flags	flags        de las sucesivas entradas
%
%  Implementaci�n MEX completa: pvm_getmboxinfo.c, pvm_getmboxinfo.mexlx

