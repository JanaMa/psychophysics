function params = PlayDemo(trial, varargin)
    %set up enough to play a trial object in demo mode.
    defaults = struct...
        ( 'edfname',    '' ...
        , 'dummy',      1  ...
        , 'skipFrames', 1  ...
        , 'requireCalibration', 0 ...
        , 'hideCursor', 0 ...
        , 'aviout', '' ...
        , 'priority', 0 ...
        );
    
    if isfield(trial, 'getParams')
        defaults = namedOptions(struct(), trial.getParams(), defaults)
    end
    
    require(namedOptions(struct(), localExperimentParams(), defaults, varargin{:}), getScreen(), @initInput, trial.run)
end

function [release, par, next] = initInput(par)
    %initialize the input structure in the trial params.
    %which initializers...
    s = cellfun(@(name)par.input.(name).init, par.inputUsed, 'UniformOutput', 0);
    release = @noop;
    next = joinResource(s{:});
end