%SELECT			Ejercita syscall select(), algo as� como KeyPressed
%
%  info = select [ (fildes [, timeout] ) ]
%
%  fildes (int arr) array de descriptores a observar en lectura
%		0 suele ser STDIN (default)
%		obtener otros descriptores con pvm_getfds()
%
%  timeout (double) tiempo m�ximo a esperar
%			si 0 � no indicado, retornar inmediatamente (default)
%  info 0 no hay nada
%      >0 #descriptores en los que se ha recibido algo para lectura
%      -1 error
%
%  Implementaci�n MEX completa: src/select.c, pvm/MEX/select.mexlx
%

