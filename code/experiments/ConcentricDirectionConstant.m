function this = ConcentricDirectionConstant(varargin)
    
    this = Experiment ...
        ( 'params', namedargs ...
            ( localExperimentParams() ...
            , 'skipFrames', 1  ...
            , 'priority', 0 ...
            , 'hideCursor', 0 ...
            , 'doTrackerSetup', 1 ...
            , 'inputUsed', {'keyboard', 'knob', 'eyes'} ...
            , 'eyelinkSettings.sample_rate', 1000 ...
            ) ...
        );

    this.trials.base = ConcentricTrial...
        ( 'extra', struct...
            ( 'r', 10 ...
            , 'globalVScalar', 0.5 ...
            , 'tf', 10 ...
            , 'wavelengthScalar', .05 ...
            , 'dt', 0.1 ...
            , 'widthScalar', 0.075 ...
            , 'durationScalar', 2/3 ...
            , 'nTargets', 10 ...
            , 'phase', 0 ...
            , 'globalDirection', 1 ...
            , 'localDirection', 1 ...
            , 'color', [0.5;0.5;0.5] / sqrt(2)...
            ) ...
        , 'requireFixation', 1 ...
        , 'fixationStartWindow', 3 ...
        , 'fixationSettle', 0.2 ...
        , 'fixationWindow', 4 ...
        , 'motion', CauchySpritePlayer ...
            ( 'process', CircularCauchyMotion ...
                ( 'x', 0 ...
                , 'y', 0 ...
                , 't', 0.15 ...
                , 'n', 4 ...
                , 'color', [0.5 0.5 0.5] ...
                , 'duration', 0.1 ...
                , 'order', 4 ...
                ) ...
            ) ...
        , 'maxResponseLatency', 0.350 ...
        , 'beepFeedback', 1 ...
        );
    
    this.trials.interTrialInterval = 0.8;
    
    %what worked well in the wheels demo is 0.75 dx, 0.75 wavelength, 0.15
    %dt, 5 velocity at 14 radius! The crowding was 3.1 degrees! Use the
    %same parameters at 10 degrees eccentricity.
    
    %the target and distractor are selected from a grid of stimulus
    %parameters.

%%
    %Add on the whole factorial of parameters to usthis.
    this.trials.add('extra.r', [80/27 10 20/3 40/9]);
    %this.trials.add({'extra.r'}, {80/27});
        
    %here we use constant stimuli... in number of targets.
    this.trials.add('extra.nTargets', [6 9 12 15 18 21 23 25]);
%%
        
    %variable onset
    this.trials.add('motion.process.t', ExponentialDistribution('offset', 0.15, 'max', 1.15, 'tau', 1));

    %randomize global and local direction....
    this.trials.add('extra.phase', UniformDistribution('lower', 0, 'upper', 2*pi));
    
    %here's where local and global are randomized
    this.trials.add('extra.globalDirection', [1 -1]);
    this.trials.add('extra.localDirection', [1 0 -1]);
    
    %await the input after the stimulus has finished playing.
    this.trials.add('awaitInput', @(b) max(b.motion.process.t + b.motion.process.dt .* (b.motion.process.n)));
    
    %this procedure translates the extra parmeters into lower level values.
    this.trials.add([], @appearance);
    function b = appearance(b)
        extra = b.extra;
        mot = b.motion.process;
        mot.setRadius(extra.r);
        mot.setDt(extra.dt);
        mot.setDphase(extra.dt .* extra.globalVScalar .* extra.globalDirection);
        wl = extra.r * extra.wavelengthScalar;
        mot.setWavelength(wl);
        mot.setWidth(extra.r .* extra.widthScalar);
        mot.setDuration(extra.durationScalar .* extra.dt);
        
        ph = mod(extra.phase + (0:extra.nTargets-1)/extra.nTargets*2*pi, 2*pi);
        %For balance we need to have three kinds of motion: supporting, opposing, and ambiguous.

        if extra.localDirection ~= 0
            mot.setPhase(ph);
            mot.setAngle(mod(ph*180/pi + 90, 360));
            mot.setVelocity(wl .* extra.tf .* extra.localDirection);
            mot.setColor(extra.color);
        else
            %The ambiguous motion is made up of two opposing motions superimposed,
            %so we have to double and elements (and reduce the contrast)
            %for that onthis.
            ph = reshape(repmat(ph, 2, 1), 1, []);
            mot.setPhase(ph);
            mot.setAngle(mod(ph*180/pi + 90, 360));
            mot.setVelocity(wl .* extra.tf * repmat([-1 1], 1, extra.nTargets));
            mot.setColor(extra.color / sqrt(2));
        end
        
        if sign(extra.localDirection) ~= -sign(extra.globalDirection)
            b.desiredResponse = -extra.globalDirection;
        else
            b.desiredResponse = 0;
        end
    end
    
    this.trials.reps = 5;
    this.trials.fullFactorial = 1;
    this.trials.requireSuccess = 1;
    this.trials.blockSize = 160;

    this.trials.startTrial = MessageTrial('message', @()sprintf('Use knob to indicate direction of rotation.\nPress knob to begin.\n%d blocks in experiment', this.trials.blocksLeft()));
    this.trials.endBlockTrial = MessageTrial('message', @()sprintf('Press knob to continuthis.\n%d blocks remain', this.trials.blocksLeft()));

    this.trials.blockTrial = EyeCalibrationMessageTrial...
        ( 'minCalibrationInterval', 0 ...
        , 'base.absoluteWindow', Inf ...
        , 'base.maxLatency', 0.5 ...
        , 'base.fixDuration', 0.5 ...
        , 'base.fixWindow', 4 ...
        , 'base.rewardDuration', 10 ...
        , 'base.settleTime', 0.3 ...
        , 'base.targetRadius', 0.2 ...
        , 'base.plotOutcome', 0 ...
        , 'base.onset', 0 ...
        , 'maxStderr', 0.5 ...
        , 'minN', 10 ...
        , 'maxN', 50 ...
        , 'interTrialInterval', 0.4 ...
        );

    this.trials.endTrial = MessageTrial('message', sprintf('All done!\nPress knob to save and exit.\nThanks!'));
    
    this.property__(varargin{:});
end