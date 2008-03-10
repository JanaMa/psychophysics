function info = mmscatter(porcion, var)
%MMSCATTER	Reparte variable Matlab entre las instancias del nivel
%
%  info = mmscatter(porcion, var)
%
%  porcion	variable Matlab a recibir la porci�n correspondiente
%
%  var	en la instancia madre, variable Matlab a repartir
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
%	Desde la instancia madre se reparte var
%	Matlab almacena columnwise (�ltimo �ndice el m�s r�pido)
%
%	Ver tambi�n: mmsend, mmrecv, mmcast, mmreduce, mmgather

								%%%%%%%%%%
info=-1;							% defaults
if ~pvme_is,	error('mmscatter: PVM no est� arrancado'), end	%%%%%%%%%%
if ~mmis,	error('mmscatter: MM  no est� arrancado'), end	% stat chk
								%%%%%%%%%%
if nargin<2,	error('mmscatter: se requieren 2 args'), end	%%%%%%%%%
[level, ctx, mmids, grpnam] =  mmlevel;				% arg chk
if isempty(mmids)						%%%%%%%%%
		error('mmscatter: nadie con quien repartir'),end% sem chk
								%%%%%%%%%
TAGMSG=667;							% SCATTER
info  = pvm_scatter(porcion, var, TAGMSG, grpnam, 0);		%%%%%%%%%

