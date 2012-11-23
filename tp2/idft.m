function res = idft(X)

%   x must be square
    res = zeros(size(X));
    N = rows(X);
    for n = 1: N - 1
        for m = 1: N - 1
            res(n,m) = _idft(X, n, m) /(N**2);
        end
    end
end
