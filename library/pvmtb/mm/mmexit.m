function f = mmexit()
%MMEXIT		Finaliza la instancia MM (Matlab) hija que llama
%
%	Ver tambi�n: mmopen, mmclose, mmup, mmdown, mmkill

% En realidad es script
								%%%%%%%%%
	f=-1;							% default
    if ~pvme_is,error('mmexit: no hay sesi�n PVM arrancada')	%%%%%%%%%%
elseif ~mmis,	error('mmexit: no hay sesi�n MM  arrancada')	% stat chk
elseif	isempty (getenv('PVMEPID'))				%%%%%%%%%%
		error('mmexit: s�lo en instancias MM hijas')
else,	f= 0;	assignin('caller','MM_CMD','quit');

end

