function str = uid()
%UID			Devuelve el user-id seg�n Unix (id -u) como string
%
%  'str' = uid
%
%  Implementaci�n M total

[retcode str]=unix('id');
str=str(findstr(str,'=')+1:findstr(str,'(')-1);

