%PVM_SCATTER		Reparte una variable Matlab entre varias instancias
%
%  info = pvm_scatter(porcion, var, msgtag, 'group', inst)
%
%  porcion	variable Matlab a recibir la porci�n correspondiente
%
%  var	en la instancia origen indicada, variable Matlab a repartir
%	en otras instancias no se usa su valor
%
%  msgtag   (int) tag deseado para los mensajes de scatter
%  group (string) nombre del grupo sobre cuyos elementos se reparte
%  inst     (int) instancia del grupo desde la que se reparte
%
%  info (int) c�digo de retorno
%	-21 PvmNoInst
%	 -2 PvmBadParam
%	-14 PvmSysErr
%
%	Se espera que todas las instancias del grupo hagan
%	 la misma llamada colectivamente, coincidiendo todos los
%	 argumentos salvo tal vez las variables porcion/var
%
%	Desde la instancia indicada se reparte var
%	Matlab almacena columnwise (�ltimo �ndice el m�s r�pido)
%	Las variables porcion no tienen que ser de las mismas dimensiones
%	 pero s� del mismo tama�o, tipo y complejidad
%
%	El tama�o y tipo de datos a enviar se deduce de la variable porcion
%	Si es compleja, la parte compleja se reparte despu�s de la real
%
%  Implementaci�n MEX completa: src/pvm_scatter.c, pvm/MEX/pvm_scatter.mexlx

