function obj = finalize(obj)

    if ~isfield(obj, 'method__')
        error('finalize:notAnObject', 'Argument is not an object and cannot be finalized.');
    end
    
    methods = obj.method__();
    
    obj = unwrapMethods(obj);
    function obj = unwrapMethods(obj)
        for m = methods'
            obj.(m{:}) = obj.method__(m{:});
        end
    end

    obj.method__ = @method__;
    function val = method__(name, val)
        switch nargin
            case 0
                val = methods;
            case 1
                val = obj.(name);
            otherwise
                error('finalize:cannotModify','cannot override methods in finalized objects.');
        end
    end

    %properties stay unmodified?
end