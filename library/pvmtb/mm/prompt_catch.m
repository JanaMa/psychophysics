%PROMPT_CATCH		Script para reanudaci�n de instancias MM (uso interno)
%
%	Permite al usuario ver el error antes de reanudar
%

fprintf      ('PVM   ??? ')
pvm_perror('');
disp([char(7) 'Matlab??? ' lasterr])
select(0,10);				% pulsar tecla � 10 s
eval(Try, Catch)

