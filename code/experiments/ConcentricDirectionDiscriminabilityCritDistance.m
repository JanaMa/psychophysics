
function this = ConcentricDirectionDiscriminabilityCritDistance(varargin)
    %fir s certain set oif local motion contrasts, and a certain set of
    %global motion contrasts, 

    this = ConcentricDirectionConstant();
    this.caller=getversion(1);
        
    this.trials.remove('extra.r');
    this.trials.remove('extra.nTargets');
    this.trials.remove('extra.globalDirection');
    this.trials.remove('extra.localDirection');
        
    % a reasonable value set for DX.
    %valueSet = [-.1 .* (3/2).^((10:-1:1)./2) -.1:.025:.1 .1 .* (3/2).^((1:10)./2)];
    %valueSet = [-.1 .* (3/2).^((15:-2:1)./2) -.1:.050:.1 .1 .* (3/2).^((1:2:15)./2)]
    %valueSet = [-.1 .* (3/2).^((7:-1:1).*3./4) -.1:.0375:.1 .1 .* (3/2).^((1:7).*3./4)]
    valueSet = [-.1 * 1.5.^(7:-1:1) -.1:.05:.1 .1 .* 1.5.^(1:7)];
    
    % a 3-down, 1-up staircase.
    makeDxUpperStaircase = @()DiscreteStaircase...
        ( 'criterion', @directionCorrect...
        , 'Nup', 1, 'Ndown', 3, 'useMomentum', 1 ...
        , 'valueSet', valueSet, 'currentIndex', 6);

    %a 3-up, 1-down staircase
    makeDxLowerStaircase = @()DiscreteStaircase...
        ( 'criterion', @directionCorrect...
        , 'Nup', 3, 'Ndown', 1, 'useMomentum', 1 ...
        , 'valueSet', valueSet, 'currentIndex', 15);

    makeDxUp4 = @()DiscreteStaircase...
        ( 'criterion', @directionCorrect...
        , 'Nup', 1, 'Ndown', 4, 'useMomentum', 1 ...
        , 'valueSet', valueSet, 'currentIndex', 6);

    %a 3-up, 1-down staircase
    makeDxLow4 = @()DiscreteStaircase...
        ( 'criterion', @directionCorrect...
        , 'Nup', 4, 'Ndown', 1, 'useMomentum', 1 ...
        , 'valueSet', valueSet, 'currentIndex', 15);

    
    % a 1-up, 1-down staircase.
    makeDxMiddleStaircase = @()DiscreteStaircase...
        ( 'criterion', @directionCorrect...
        , 'Nup', 1, 'Ndown', 1, 'useMomentum', 1 ...
        , 'valueSet', valueSet, 'currentIndex', 11);

    %plot([-.1 .* (3/2).^((10:-1:1)./3) -.1:.02:.1 .1 .* (3/2).^((1:15)./3)] )
    
    this.trials.addBefore...
        ( 'extra.phase' ...
        , {'extra.globalDirection', 'extra.localDirection'}...
        , { { 1, 1 }, { -1, -1 } })
    
    %Note that the staircases operate on both clockwise and
    %counterclockwise motion. Therefore I only need "upper" staircases for
    %the zero-local-contrast case (I can look for biases in
    %post-analysis.)
    %
    %Yes, this is a bit convoluted.
this.trials.addBefore...
        ( 'extra.phase' ...
        , { 'extra.r' ...
          , 'extra.nTargets' ...
          , 'extra.globalVScalar'...
          , 'extra.directionContrast'...
          } ...
%{
%introductory session, use 45 steps staircase and 4up/1down
%}
        , { { 20/3, 2,  makeDxUp4(),    .20} ...
          , { 20/3, 2,  makeDxLow4(),   .20} ...
          , { 20/3, 4,  makeDxUp4(),    .20} ...
          , { 20/3, 4,  makeDxLow4(),   .20} ...
          , { 20/3, 16, makeDxUp4(),    .20} ...
          , { 20/3, 16, makeDxLow4(),   .20} ...
          , { 20/3, 20, makeDxUp4(),    .20} ...
          , { 20/3, 20, makeDxLow4(),   .20} ...
%Four spacings x two contrasts
%}
          %{
        , { { 20/3, 6,  makeDxUpperStaircase(),   0.4} ...
          , { 20/3, 6,  makeDxLowerStaircase(),   0.4} ...
          , { 20/3, 12, makeDxUpperStaircase(),   0.4} ...
          , { 20/3, 12, makeDxLowerStaircase(),   0.4} ...
          , { 20/3, 18, makeDxUpperStaircase(),   0.4} ...
          , { 20/3, 18, makeDxLowerStaircase(),   0.4} ...
          , { 20/3, 24, makeDxUpperStaircase(),   0.4} ...
          , { 20/3, 24, makeDxLowerStaircase(),   0.4} ...
          , { 20/3, 6,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 6,  makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 12, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 12, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 18, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 18, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 24, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 24, makeDxLowerStaircase(),   1.0} ...
%}
%{
        , { { 20/3, 4,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 4,  makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 7,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 7,  makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 10, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 10, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 12, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 12, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 16, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 16, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 20, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 20, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 24, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 24, makeDxLowerStaircase(),   1.0} ...
%}
%{
        , { { 20/3, 4,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 4,  makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 7,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 7,  makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 10, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 10, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 12, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 12, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 16, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 16, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 20, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 20, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 24, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 24, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 28, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 28, makeDxLowerStaircase(),   1.0} ...
          
%}
%{
        , { { 20/3, 20, makeDxUpperStaircase(),   .10} ...
          , { 20/3, 20, makeDxLowerStaircase(),   .10} ...
          , { 20/3, 20, makeDxUpperStaircase(),   .20} ...
          , { 20/3, 20, makeDxLowerStaircase(),   .20} ...
          , { 20/3, 20, makeDxUpperStaircase(),   .40} ...
          , { 20/3, 20, makeDxLowerStaircase(),   .40} ...
          , { 20/3, 20, makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 20, makeDxLowerStaircase(),   1.0} ...
          , { 20/3, 5,  makeDxUpperStaircase(),   .10} ...
          , { 20/3, 5,  makeDxLowerStaircase(),   .10} ...
          , { 20/3, 5,  makeDxUpperStaircase(),   .20} ...
          , { 20/3, 5,  makeDxLowerStaircase(),   .20} ...
          , { 20/3, 5,  makeDxUpperStaircase(),   .40} ...
          , { 20/3, 5,  makeDxLowerStaircase(),   .40} ...
          , { 20/3, 5,  makeDxUpperStaircase(),   1.0} ...
          , { 20/3, 5,  makeDxLowerStaircase(),   1.0} ...
%for NJ, use 20 pct contrast and 4/16/20 targets
%for CJ, use 40 pct contrast and 4/18/22 targets
%for AS, use 30 pct contrast...
%}
%{
        , { { 10,     4, makeDxUpperStaircase(),    .30} ...
          , { 10,     4, makeDxLowerStaircase(),    .30} ...
          , { 20/3,   4, makeDxUpperStaircase(),    .30} ...
          , { 20/3,   4, makeDxLowerStaircase(),    .30} ...
          , { 40/9,   4, makeDxUpperStaircase(),    .30} ...
          , { 40/9,   4, makeDxLowerStaircase(),    .30} ...
          , { 80/27,  4, makeDxUpperStaircase(),    .30} ...
          , { 80/27,  4, makeDxLowerStaircase(),    .30} ...
          , { 10,     18, makeDxUpperStaircase(),   .30} ...
          , { 10,     16, makeDxLowerStaircase(),   .30} ...
          , { 20/3,   16, makeDxUpperStaircase(),   .30} ...
          , { 20/3,   16, makeDxLowerStaircase(),   .30} ...
          , { 40/9,   16, makeDxUpperStaircase(),   .30} ...
          , { 40/9,   16, makeDxLowerStaircase(),   .30} ...
          , { 80/27,  16, makeDxUpperStaircase(),   .30} ...
          , { 80/27,  16, makeDxLowerStaircase(),   .30} ...
          , { 10,     20, makeDxUpperStaircase(),   .30} ...
          , { 10,     20, makeDxLowerStaircase(),   .30} ...
          , { 20/3,   20, makeDxUpperStaircase(),   .30} ...
          , { 20/3,   20, makeDxLowerStaircase(),   .30} ...
          , { 40/9,   20, makeDxUpperStaircase(),   .30} ...
          , { 40/9,   20, makeDxLowerStaircase(),   .30} ...
          , { 80/27,  20, makeDxUpperStaircase(),   .30} ...
          , { 80/27,  20, makeDxLowerStaircase(),   .30} ...
%}
%{
        , { { 10,     4, makeDxUpperStaircase(),    .30} ...
          , { 10,     4, makeDxLowerStaircase(),    .30} ...
          , { 20/3,   4, makeDxUpperStaircase(),    .30} ...
          , { 20/3,   4, makeDxLowerStaircase(),    .30} ...
          , { 40/9,   4, makeDxUpperStaircase(),    .30} ...
          , { 40/9,   4, makeDxLowerStaircase(),    .30} ...
          , { 10,     8, makeDxUpperStaircase(),   .30} ...
          , { 10,     8, makeDxLowerStaircase(),   .30} ...
          , { 20/3,   8, makeDxUpperStaircase(),   .30} ...
          , { 20/3,   8, makeDxLowerStaircase(),   .30} ...
          , { 40/9,   8, makeDxUpperStaircase(),   .30} ...
          , { 40/9,   8, makeDxLowerStaircase(),   .30} ...
          , { 10,     16, makeDxUpperStaircase(),   .30} ...
          , { 10,     16, makeDxLowerStaircase(),   .30} ...
          , { 20/3,   16, makeDxUpperStaircase(),   .30} ...
          , { 20/3,   16, makeDxLowerStaircase(),   .30} ...
          , { 40/9,   16, makeDxUpperStaircase(),   .30} ...
          , { 40/9,   16, makeDxLowerStaircase(),   .30} ...
          , { 10,     20, makeDxUpperStaircase(),   .30} ...
          , { 10,     20, makeDxLowerStaircase(),   .30} ...
          , { 20/3,   20, makeDxUpperStaircase(),   .30} ...
          , { 20/3,   20, makeDxLowerStaircase(),   .30} ...
          , { 40/9,   20, makeDxUpperStaircase(),   .30} ...
          , { 40/9,   20, makeDxLowerStaircase(),   .30} ...
%}
      });
    
    this.trials.add('desiredResponse', 0);

    this.trials.reps = 1;
    this.trials.reps = floor(650 / this.trials.numLeft());
    this.trials.blockSize = ceil(this.trials.numLeft() / 5);
    
    
    %determines whether the detected mtoion direction aggrees with global
    %displacement.
    function correct = directionCorrect(trial, result)
        correct = 0;
        if result.success == 1
            gd = trial.property__('extra.globalDirection');
            ld = trial.property__('extra.localDirection');
            if (sign(gd) == -sign(ld))
                return
            end
            if gd == 0
                if result.response == -ld
                    correct = 1;
                else
                    correct = -1;
                end
            else
                if result.response == -gd;
                    correct = 1;
                else
                    correct = -1;
                end
            end
        end
    end
    
    this.property__(varargin{:});
end
