function out = cabcross(xeval, yeval, varargin)

%on -10, 10
%spots = -9.75:0.5:9.75;
%{
s = namedOptions...
    ( struct() ...
    , 'x', [spots spots] ...
    , 'y', [spots -spots] + exp(-abs([spots spots]).^2/5) .* sign([spots -spots]) ...
    , 'orient', [repmat(-pi/4, size(spots)) - pi/4 * exp(-abs(spots)/5), repmat(pi/4, size(spots)) + pi/4 * exp(-abs(spots)/5)]...
    , 'semimajor', 0.2 ...
    , 'lambda', 0.5 ...
    , 'semimajor', 0.25 ...
    , 'semiminor', 0.25 ...
    , varargin{:} ...
    );
%}

%s.orient = s.orient + randn(size(s.orient))/10;


%what i try to do here is provide the "orientation" signal of wave
%undulatiing one way but the "posiition" signal of waves undulating the
%other
spots = linspace(-pi,pi,17);
spots = spots(2:2:end);

s = namedOptions...
    ( struct() ...
    , 'x', [1.2*cos(spots) - pi/2, pi/2 - 1.2*cos(spots)] ...
    , 'y', [spots spots] ... %or maybe base it on arc length...
    , 'orient', acos(sin([spots -spots]))/2 + pi/4 ...
    , 'lambda', 0.3 ...
    , 'semimajor', 0.15 ...
    , 'semiminor', 0.25 ...
    , varargin{:} ...
    );
%}

out = gabor(xeval, yeval, s)*255 + 127.5;

