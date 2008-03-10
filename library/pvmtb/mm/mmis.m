function info = mmis()
%MMIS		Comprueba si hay sesi�n MM
%
%  info = mmis
%
%  info	0 Si no est� arrancado PVM � no se ha usado mmopen a�n
%	1 Si ya se ha usado mmopen (se comprueba mbox MMLEVELS)
%
%	Ver tambi�n:	mmlevel, mmlevels, mmmyid, mmparent

if ~pvme_is, info=0; return, end

[info mbinfo] = pvm_getmboxinfo('MMLEVELS');
if info,info=	0;			% PvmOk==0
else,	info=length(mbinfo);		% debe haber s�lo 1 anotaci�n MMLEVELS
end

