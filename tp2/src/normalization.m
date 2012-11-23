function res = normalization(x, low, top)

    res = zeros(size(x));
    _max = max(max(x));
    _min = min(min(x));

    res = (x - _min) / (_max - _min) * (top - low) + low;

end
