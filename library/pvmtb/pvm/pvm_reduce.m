%PVM_REDUCE		Reduce variable Matlab de varias instancias a una sola
%
%  info = pvm_reduce('op', var, msgtag, 'group', inst)
%
%  op (string) operaci�n de reducci�n deseada ('Max', 'Min', 'Sum', 'Product')
%
%  var	variable Matlab reducible: char,int8,int16,int32,single,double
%	no se pueden reducir: cell,struct,sparse,object,opaque
%
%  msgtag   (int) tag deseado para los mensajes de reducci�n
%  group (string) nombre del grupo sobre cuyos elementos se reduce
%  inst     (int) instancia del grupo sobre la que se reduce
%
%  info (int) c�digo de retorno
%	-21 PvmNoInst
%	 -2 PvmBadParam
%	-14 PvmSysErr
%
%	Se espera que todas las instancias del grupo hagan
%	 la misma llamada colectivamente, coincidiendo todos los
%	 argumentos salvo tal vez la variable a reducir.
%
%	En la instancia indicada se recolecta el M�ximo/M�nimo/Suma/Producto
%	 de los respectivos elementos de las variables locales.
%	Las variables no tienen que ser de las mismas dimensiones
%	 pero s� del mismo tama�o, tipo y complejidad
%
%	El tama�o y tipo de datos a enviar se deduce de la variable
%	Si es compleja, la parte compleja se reduce despu�s de la real
%
%  Implementaci�n MEX completa: src/pvm_reduce.c, pvm/MEX/pvm_reduce.mexlx

