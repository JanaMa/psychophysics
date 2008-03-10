function info = mmgather(var, porcion)
%MMGATHER	Reune variables Matlab de instancias hijas en madre
%
%  info = mmgather(var, porcion)
%
%  porcion	variable Matlab a juntar con otras
%
%  var	en la instancia madre, variable Matlab para la recolecci�n
%	en otras instancias no se usa su valor (usar [], {}, '', 0...)
%
%  info (int) c�digo de retorno
%	-21 PvmNoInst
%	 -2 PvmBadParam
%	-14 PvmSysErr
%
%	Se espera que todas las instancias del grupo hagan
%	 la misma llamada colectivamente
%
%	A la instancia indicada se env�an todas las porciones
%	Matlab almacena columnwise (�ltimo �ndice el m�s r�pido)
%
%	Ver tambi�n: mmsend, mmrecv, mmcast, mmreduce, mmscatter

								%%%%%%%%%%
info=-1;							% defaults
if ~pvme_is,	error('mmgather: PVM no est� arrancado'), end	%%%%%%%%%%
if ~mmis,	error('mmgather: MM  no est� arrancado'), end	% stat chk
								%%%%%%%%%%
if nargin<2,	error('mmgather: se requieren 2 args'), end	%%%%%%%%%
[level, ctx, mmids, grpnam] =  mmlevel;				% arg chk
if isempty(mmids)						%%%%%%%%%
		error('mmgather: nadie de quien recolectar'),end% sem chk
								%%%%%%%%%
TAGMSG=667;							% SCATTER
info  = pvm_gather(var, porcion, TAGMSG, grpnam, 0);		%%%%%%%%%

