function info=pvme_pack(varargin)
%PVME_PACK		Empaqueta datos Matlab cualesquiera agrupados con {}
%
%  info = pvme_pack(var [,var]...)	* info: int/array
%
%  info (int/array) vector c�digos retorno (tantos como vars)
%                                          (o menos, hasta 1er error)
%       0 PvmOk
%      -2 PvmBadParam (propio MEX, motivo: clase desconocida)
%     -24 PvmNotImpl  (propio MEX, motivo: empaquetamiento no implementado)
%     -10 PvmNoMem
%     -15 PvmNoBuf
%      -4 PvmOverflow
%
%  Implementaci�n MEX quasicompleta: src/pvm_pack.c, pvm/MEX/pvm_pack.mexlx

info=pvm_pack(varargin);

%
% La �nica utilidad de esta l�nea es conjuntar todos los argumentos
% en un cellarray, para que Matlab sepa cu�ntas variables van en el
% mensaje.
%
% PVM s�lo ofrece message-tag para saber qu� tipo de mensaje es.
% En funci�n del tag se debe adivinar cu�ntas variables y de qu� tipo
% van en el mensaje.
%
% Este m�todo (cell-array) permite saber de antemano que s�lo habr�
% una variable de tipo cellarray, y tras recibirla se podr� saber
% cu�ntas componentes tiene, e incluso cambiarles el nombre si se desea
%
% La �nica alternativa ser�a usar pvm_pack_.mexlx directamente
% enviando variables de 1 en 1. Si se permite enviar varias, hay
% que detectar el fin del mensaje por el m�todo de pasarse, lo
% que produce un warning "End of buffer" bastante enojoso, queda
% duda de si est� todo bien o algo ha salido mal.
%
