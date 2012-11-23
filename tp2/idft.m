function res = idft(X)

%   x must be square
    res = zeros(rows(X));
    N = rows(X);
    for n = 1:N
        for m = 1:N
            res(n,m) = _idft(X, n, m) /(N**2);
        end
    end
end

function res = _idft(X, n, m)

%   X must be square
    res = 0;
    N = rows(X);
    for l = 1:N
        for k = 1:N
            res += X(l, k) * e^(i*2*pi*((n - 1)*(l - 1) + (m - 1)*(k - 1))/N);
        end
    end
end
