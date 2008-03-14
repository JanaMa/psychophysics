function e = SimpleSaccade(varargin)
    e = Experiment(varargin{:});
    
    e.trials.base = SimpleSaccadeTrial...
        ( 'targetLoc', CircularMotion ...
            ( 'radius', 8 ...
            , 'omega', 0 ...
            )...
        , 'targetBlankColor', 0.4875 ...
        , 'fixationTime', Inf ...
        , 'fixationOnset', 0.4 ...
        , 'maxLatency', 0.6 ...
        , 'fixationLatency', 1.0 ...
        , 'targetWindow', 6 ...
        , 'rewardSize', 20 ...
        , 'rewardTargetBonus', 0.100 ...
        , 'errorTimeout', 0.3 ...
        );
    
    e.trials.add('targetLoc.phase', UniformDistribution('lower', 0, 'upper', 2*pi));
    e.trials.add('targetLoc.omega', UniformDistribution('lower', -15/8, 'upper', 15/8));
    
    %target onset hazard from fixation
    e.trials.add('targetOnset', ExponentialDistribution('offset', 0.3, 'tau', 0.15));
    e.trials.add('targetBlank', ExponentialDistribution('offset', 0.2, 'tau', 0.15));
    e.trials.add('targetBlankColor', DiscreteStaircase...
        ( 'valueSet', linspace(127.5,121.5,7)/255 ... %stepping up the contrast is down the intensity
        , 'currentIndex', 7 ...
        , 'Nup', 3, 'Ndown', 1 ...
        ) );
    e.trials.add('cueTime', ExponentialDistribution('offset', 0.3, 'tau', 0.15));
    
    %target tracking time
    e.trials.add('targetFixationTime', ExponentialDistribution('offset', 0.4, 'tau', 0.2));
end