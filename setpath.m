function setpath()%sets the path appropriate for eye tracking code to function.%this is sort of an experiment; i'd like as much of the path management%to be automated as possible.%get all the library paths and the root code path%subdirectories ought to be managed by a pakage/namespace system, if%matlab would only provide a namespace system.%all the library paths (dependent on OS version)if strcmp(computer, 'MAC') || strcmp(computer, 'GLNX86') || strcmp(computer, 'MACI')    %p is the path to the directory this file lives in    p = fileparts(mfilename('fullpath'));        libpath = [...        genpath(fullfile(p, 'code')) pathsep ...        genpath(fullfile(p, 'data')) pathsep ...        genpath(fullfile(p, 'analysis')) pathsep ...        genpath(fullfile(p, 'library', 'mexes')) pathsep ...        genpath(fullfile(p, 'library', 'osx')) pathsep ...	genpath(fullfile(p, 'library', 'pMatlab', 'matlabMPI', 'src')) pathsep ...	genpath(fullfile(p, 'library', 'pMatlab', 'src')) pathsep ...        ];%pMatlab is more promising than PVM... PVM might be useful in make process control though?%        genpath(fullfile(p, 'library', 'pvmtb')) pathsep ...elseif strcmp(computer, 'MAC2')	%OS9 equivalent code. We aren't currently running on OS 9, but this	%stands.	    %in matlab 5, there is no way to determine the full path to the    %currently running file. we have to use 'which' to make a wild and    %potentially wrong guess.    fullpath = which(mfilename, '-all');     if length(fullpath) > 1		warning(['more than one ' mfilename ' on path, may be making' ...				 'a a bad guess']); %ignore warning in matlab7.2, this is meant to run in matlab5.	elseif length(fullpath) == 0		error('cannot find any path for the running file!');	end		p = fileparts(fullpath{1});    	% we need findstr for this script.	% Often we have to re-implement functions from newer versions of   	% matlab to make reasonable code work on matlab 5. The	% matlab5_compensation library directory	% contains such implementations.	compensation_path = fullfile(p, 'library', 'matlab5_compensation');    addpath(compensation_path);		%undocumented matlab 5 feature: 'genpath' requires a second	%argument specifying whether to traverse the matlab toolbox	%directory.        %FIXME: need namespacing	libpath = [...        genpath(fullfile(p, 'code'), 1) pathsep ...        genpath(fullfile(p, 'data'), 1) pathsep ...        genpath(fullfile(p, 'library', 'os9'),1)]; else    error('setpath:unsupported_arch', 'Unsupported architecture %s', computer);endlibpath = split(libpath, pathsep);%filter out unnecessary and private pathsindexnogood = [ ...    internalstrmatch([filesep '.svn'], libpath); ...    internalstrmatch([filesep '.bundle'], libpath); ...    internalstrmatch([filesep '@'], libpath); ...    internalstrmatch([filesep 'private'], libpath); ...    internalstrmatch([filesep '.FBC'], libpath); ...    ];libpath(indexnogood) = [];%nosvn = ~cellfun( \%    @length, \%    regexp(libpath, '(\.svn|\.bundle|/private|.FBC)', 'match') ); %nosvn is now a logical array thanks to negation%libpath = libpath(nosvn);%finally use the code and data paths. These paths are not added recursively%because I would prefer to use some explicit namespace mechanism to avoid%naming conflicts, like every other reasonable programming language provides.%libpath = { fullfile(p, 'code'), fullfile(p, 'data'), libpath{:} };addpath(libpath{:});%incidentally set up the PVM toolbox?%if exist('startupTBpvm.m', 'file')%    setenv('PVMTB_ROOT', fileparts(which('startupTBpvm')));%    startupTBpvm%end%-----helper functions-----function c = split(string, delimiter)    %split a long string delimited by a character into a cell array of     %strings. Quite slow compared to the regexp solution.    %where the delimiter occurs    indices = findstr(delimiter, string);    starts = [1 (indices+1)];    ends = [indices-1 length(string)];    %make a cell array of strings.    %For-loop for compatibility with MATLAB 5, ugh.    c = cell(length(starts),1);    for i = [1:length(starts);starts;ends]        [index, start, stop] = deal(i(1), i(2), i(3));        c{index} = string(start:stop);    endfunction m = internalstrmatch(str, strs)    %like strmatch, except that matches do not have to be at the beginning    %of the string. Needed because this script needs to work with matlab 5,    %and matlab 5's string handling functions are almost nonexistent	%(no regexps)    if ~isa(strs, 'cell')        strs = cellstr(strs);    end        matches = zeros(size(strs));        for i = 1:prod(size(strs));		%use feval because strfind might not have		%been on the path when this script started        if feval('strfind',strs{i}, str)           matches(i) = 1;        end    end        m = find(matches);