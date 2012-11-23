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

function res = _idft(X, i, j)

%   X must be square
    res = zeros(size(X);
    N = rows(X);
    for l = 0: N - 1
        for k = 0: N - 1
            res += X(l, k) * e^(i*2*pi*(i*l + j*m)/N);
        end
    end
end
