function info = mmreduce(op, var)
%MMREDUCE	Reduce variable Matlab en la instancia MM madre
%
%  info = mmreduce('op', var)
%
%  op (string) operaci�n de reducci�n deseada ('Max', 'Min', 'Sum', 'Product')
%
%  var	variable Matlab reducible: char,int8,int16,int32,single,double
%	no se pueden reducir: cell,struct,sparse,object,opaque
%
%  info (int) c�digo de retorno
%	-21 PvmNoInst
%	 -2 PvmBadParam
%	-14 PvmSysErr
%
%	Se espera que todas las instancias del nivel hagan
%	 la misma llamada colectivamente, coincidiendo 'op'
%
%	En la instancia madre se recolecta el M�ximo/M�nimo/Suma/Producto
%	 de los respectivos elementos de las variables locales.
%
%	Ver tambi�n: mmsend, mmrecv, mmcast, mmscatter, mmgather

								%%%%%%%%%%
info=-1;							% defaults
if ~pvme_is,	error('mmreduce: PVM no est� arrancado'), end	%%%%%%%%%%
if ~mmis,	error('mmreduce: MM  no est� arrancado'), end	% stat chk
								%%%%%%%%%%
if nargin~=2,	error('mmreduce: se requieren 2 args'), end	%%%%%%%%%
if ~ischar(op),	error('mmreduce: arg#1 string'), end		% arg chk
if ~strcmp(op, 'Max') & ~strcmp(op, 'Min') &...			%%%%%%%%%
   ~strcmp(op, 'Sum') & ~strcmp(op, 'Product')
	error('mmreduce: arg#1 ''Max'',''Min'',''Sum'',''Product'''), end

[level, ctx, mmids, grpnam] =  mmlevel;				%%%%%%%%%
if isempty(mmids)						% sem chk
		error('mmreduce: nadie con quien reducir'), end	%%%%%%%%%
								%%%%%%%%
TAGMSG=667;							% REDUCE
info  = pvm_reduce(op, var, TAGMSG, grpnam, 0);			%%%%%%%%

