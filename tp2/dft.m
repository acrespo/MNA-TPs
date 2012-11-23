function res = dft(x) 

%   x must be square
    res = zeros(size(x));
    N = rows(x);
    for i = 1:(N - 1)
        for j = 1:(N - 1)
            res(i, j) = _dft(x, i, j);
        end
    end
end
