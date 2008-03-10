function info = pvme_sendsig(tid, signum)
%PVME_SENDSIG		Manda se�al a tarea PVM
%
%  info = pvme_sendsig(tid, signum)	* extensi�n para arrays de pvm_sendsig
%

if ~isnumeric(tid)|...
   ~isnumeric(signum),	error('se requieren 2 args num�ricos'), end

info=zeros(size(tid));			% Preallocate
for i=1:length(info)
  info(i)=pvm_sendsig(tid(i), signum);
end

