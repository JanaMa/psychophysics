function this = FilledDisk(loc_, radius_, color_)
%A graphics object that draws a disk at a specified location.
%
%loc_ : the coordinates (in degrees) of the center of the disk.
%radius_: the radius of the disk in degrees.
%color_: the color of the disk.
%
%See also Drawer, Drawing.

%----- public interface -----
this = inherit(...
    Drawer(),...
    public(...
        @prepare,...
        @draw, @bounds,...
        @getLoc, @setLoc, @getRadius, @setRadius,...
        @getColor, @setColor, @getVisible, @setVisible)...
    );

%----- private instance variables (plus those that are arguments) -----

toPixels_ = [];
visible_ = 0;

%----- methods -----
    function draw(window)
        if visible_
            center = toPixels_(loc_);
            corner = toPixels_(loc_ + repmat(radius_, 1, 2));
            rad = norm(corner - center);
            Screen('gluDisk', window, color_, center(1), center(2), rad);
        end
    end

    function b = bounds
        disp = repmat(radius_, 1, 2);
        center = loc_;
        b = ([center - disp, center + disp]);
    end

    function prepare(params)
        toPixels_ = transformToPixels(params.cal);
    end

%manually declare accessors, for speed inside the function.
    function l = getLoc
        l = loc_;
    end

    function l = setLoc(l)
        loc_ = l;
    end

    function r = getRadius
        r = radius_;
    end

    function r = setRadius(l)
        radius_ = r;
    end

    function c = getColor
        c = color_;
    end

    function c = setColor(c)
        color_ = c;
    end

    function v = getVisible
        v = visible_;
    end

    function v = setVisible(v)
        visible_ = v;
    end
end
