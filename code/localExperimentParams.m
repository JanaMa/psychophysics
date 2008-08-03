function params = localExperimentParams()

%Judging from the machine we are running on, looks up experiment
%configuration parameters and the input devices we use.
c = Screen('Computer');

switch c.machineName
    case 'pastorianus' %this is the psychophysics rig
        params = struct ...
            ( 'requireCalibration', 1 ...
            , 'logfile', '' ...
            , 'dummy', 0 ...
            , 'priority', 0 ...
            , 'doTrackerSetup', 1 ...
            , 'screenNumber', 1 ...
            , 'resolution', {{800 600 120 32}} ...
            , 'imagingMode', 0 ... %radeon 9600 doesn't really support 16 bit imaging with blending modes...
            , 'edfname', '' ...
            , 'input', struct ...
                ( 'eyes', EyelinkInput() ...
                , 'knob', PowermateInput() ...
                , 'keyboard', KeyboardInput() ...
                ) ...
            );
    case 'cerevisiae' %this is my g4 laptop
        %i am only testing on this laptop
        params = struct ...
            ( 'subject', 'zzz' ...
            , 'edfname', '' ...
            , 'filename', '' ...
            , 'logfile', '' ...
            , 'requireCalibration', 0 ...
            , 'dummy', 1 ...
            , 'imagingMode', 0 ... %radeon 9600 doesn't really support 16 bit imaging with blending modes...
            , 'input', struct ...
                ( 'eyes', EyelinkInput() ...
                , 'keyboard', KeyboardInput() ...
                ) ...
            );
        
    case 'boulardii' %this is my monkey rig
        params = struct ...
            ( 'requireCalibration', 1 ...
            , 'dummy', 0 ...
            , 'priority', 9 ...
            , 'screenNumber', 1 ...
            , 'resolution', {{1024 768 120 32}} ...
            , 'imagingMode', kPsychNeed16BPCFloat ... % good graphics cards on this rig, get good imaging
            , 'input', struct ...
                ( 'eyes', LabJackInput() ... %unless using eyelink...?
                , 'keyboard', KeyboardInput() ...
                ) ...
            );
    otherwise
        params = struct();
end