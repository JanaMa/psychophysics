function str = hostname()
%HOSTNAME		Devuelve el nombre del ordenador
%
%  'str' = hostname
%
%  Implementaci�n M total

[retcode str]=unix('hostname');
str(end)=[];

%		Durante el c�lculo se necesita crear un fichero temporal (/tmp)
% tmpfile = tempname;			% En un ficherillo
% unixcmd = ['!hostname >' tmpfile];	%  escribir el hostname local
% eval     (unixcmd);
% str     = textread(tmpfile,'%c')';	%  para poder leerlo en variable Matlab
% delete   (tmpfile);			% (ficherillo es s�lo paso intermedio)

