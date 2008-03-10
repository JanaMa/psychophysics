function info = pvme_start_pvmd(varargin)
%PVME_START_PVMD	Arranque daemon PVMD con comodidades, man pvmd(1PVM)
%
%  info = pvme_start_pvmd [ ( ['arg' [,'arg']...]  [,'hostfile']  [,block] ) ]
%
%    block  0 retorna inmediatamente
%         !=0 retorna tras a�adir los hosts (valor por defecto)
%             �ltimo argumento, opcional
%
%    hostfile  fichero de hosts PVM, debe existir en Matlab path
%              incompatible con conflines, si existe se ignoran conflines
%              pen�ltimo o �ltimo argumento, opcional
%              si tampoco hay conflines, es como si se hubiera puesto 'd'
%
%    arg  (-option | confline) opci�n pvmd o l�nea hostfile
%          -option: -dmask -nname -s -S -f
%           confline: hostname [*] lo=logname so=passwd dx=file ep=path
%                               wd=workdir sp=speed bx=debugger ip=hostname
%
%	   'd' para usar configuraci�n por defecto (ver pvm_default_config)
%              Incompatible con cualesquiera otras conflines (se ignorar�n)
%              Si no hay conflines ni hostfile, es como si se hubiera puesto 'd'
%              Primer argumento
%
%    info  0 PvmOk
%        -28 PvmDupHost
%        -14 PvmSysErr
%
%  Implementaci�n M parcial: pvm_start_pvmd.c, pvm_start_pvmd.mexlx

info = 0;					% Deber�a ser PvmOk
if nargin>0
  block=varargin{end};
  if isnumeric(block), varargin(end)=[];
  else,        block=1;         end
else,          block=1;         end

if ~iscellstr(varargin)
  info = -2;					% Deber�a ser PvmBadParam
  error('argumentos deben ser strings, salvo block')
else
  if isempty(varargin), hostfile=['/tmp/pvmdefconf.' uid];	% Como si 'd'
  else
    hostfile=varargin{end};
    if hostfile(1)=='-', hostfile=[];	% No hay hostfile, es �ltima -option
    else				% No es -option
      hostfile=which(hostfile);		%  intentar sacarlo del Matlab path
      if ~isempty(hostfile)		%  existe, interpretar como hostfile
        varargin(end)=[];		% Dejar args s�lo
      end
    end
  end
  lasto=0; opts={};
  lastc=0; cnfg={};
  for i=1:length(varargin)		% Si no hay args, for no hace nada
    elmnt=varargin{i};
    if elmnt(1)=='-', lasto=lasto+1; opts(lasto)={elmnt};
    else            , lastc=lastc+1; cnfg(lastc)={elmnt};
    end
  end
  if lastc~=0 ...			% Existen l�neas de configuraci�n
   &~isempty(hostfile)			% y fichero de configuraci�n
    warn=[hostfile ' existe, y hay l�neas conf' ...
    char(10) '         Se ignorar�n las l�neas de configuraci�n'];
              warning(warn);
    info = -3;				% Deber�a ser PvmMismatch
    lastc=0; cnfg={};			% Ignorar l�neas conf
  end
  if lastc~=0		% Hay l�neas de configuraci�n (fichero ya no)
    if cnfg{1}=='d'		% Se trata de configuraci�n por defecto
      hostfile=['/tmp/pvmdefconf.' uid];	% Incluso si no existe,
      if lastc>1			% Y existen m�s l�neas de configuraci�n
        warn=['se indic� configuraci�n por defecto, y hay l�neas conf' ...
        char(10) '         Se ignorar�n las l�neas de configuraci�n'];
                  warning(warn);
        info = -3;			% Deber�a ser PvmMismatch
      end
    else					% se ignorar�n conflines
      hostfile=tempname; lastc=-1;	% Si no, pasarlas mediante fichero
      fid=fopen(hostfile,'w');		% lastc==-1 recuerda que es temporal
      for i=1:length(cnfg), fprintf(fid, '%s\n', cnfg{i}); end
      fclose(fid);
    end
  end			% fichero se pasa como �ltimo arg a pvm_start_pvmd()
  if ~isempty(hostfile), lasto=lasto+1; opts(lasto)={hostfile}; end

  info = pvm_start_pvmd(opts,block);

  if lastc<0, delete(hostfile); end	% Si lo creamos, lo borramos
end

