function info = mmcast(varargin)
%MMCAST		Envia variables Matlab a todas las instancias MM del nivel
%
%  info = mmcast ( ['metoo',] var [,var]... )
%
%  'metoo' Si est� presente como primer argumento, tambi�n se mandan
%		las variables a la propia instancia con pvm_send
%
%	Por defecto se utiliza pvm_bcast para enviar s�lo a las otras
%
%  var		Cualesquiera variables Matlab
%
%	Ver tambi�n: mmsend, mmrecv, mmreduce, mmscatter, mmgather
%
								%%%%%%%%%%
info=-1;							% defaults
if ~pvme_is,	error('mmcast: PVM no est� arrancado'), end	%%%%%%%%%%
if ~mmis,	error('mmcast: MM  no est� arrancado'), end	% stat chk
								%%%%%%%%%%
metoo = 0;							%%%%%%%%%
if ~isempty(varargin) & ischar(varargin{1})			% arg chk
	metoo=strcmp(varargin{1},'metoo');			%%%%%%%%%
	if metoo, varargin(1)=[]; end
end
if isempty(varargin),	error('mmcast: nada para enviar'), end	%%%%%%%%%
[level, ctx, mmids, grpnam] =  mmlevel;				% sem chk
if  isempty (mmids) & ~metoo					%%%%%%%%%
			error('mmcast: nadie a quien enviar'), end
								%%%%%%
TAGMSG=667;							% CAST
info  =	pvm_initsend;						%%%%%%
	if info<0,	pvm_perror('mmcast'), return, end
info  = pvme_pack(varargin{:});
	if info<0,	pvm_perror('mmcast'), return, end

if ~isempty(mmids)
	info = pvm_bcast(grpnam,TAGMSG);			% remote
	if info<0,	pvm_perror('mmcast'), return, end	%%%%%%%%
end
if metoo
	info = pvm_send(pvm_mytid,TAGMSG);			% local
	if info<0,	pvm_perror('mmcast'), return, end	%%%%%%%
end

