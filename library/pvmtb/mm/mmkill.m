function info = mmkill(inums)
%MMKILL		Mata instancias MM (Matlab)
%
%  info = mmkill(inums)
%
%  inums (int/array) n�meros de instancia MM
%
%  info  (int/array) C�digos de retorno PVM
%
%	Ver tambi�n: mmopen, mmclose, mmup, mmdown, mmexit

info = -1;							%%%%%%%%%%
    if ~pvme_is,error('mmkill: no hay sesi�n PVM arrancada')	% stat chk
elseif ~mmis,	error('mmkill: no hay sesi�n MM  arrancada')	%%%%%%%%%%
else
  if any(inums==0)						%%%%%%%%%
		error('mmkill: no se puede matar madre'), end	% arg chk
 [level ctx mmids grpnam] = mmlevel;				%%%%%%%%%
  kids = pvm_gettid(grpnam, inums);				% sem chk
  kf   = find(kids<0);						%%%%%%%%%
  if ~isempty(kf)
		disp(['instancia MM #'	int2str(inums(kf))])
		disp(['PVM tids #'	int2str(kids (kf))])
		warning('mmkill: no existe'),   kids (kf)=[]; end
					
  if isempty(kids)
		warning('mmkill: nada para matar'), end	% se conf�a que notify
							% borre mmids-tids
  info=pvm_kill(kids); end
end

