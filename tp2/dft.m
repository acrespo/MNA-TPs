function res = dft(x)

%   x must be square
    res = zeros(size(x));
    N = rows(x);
    for i = 1:N
        for j = 1:N
            res(i, j) = _dft(x, i, j);
        end
    end
end

function res = _dft(x, l, k)

%   X must be square
    res = 0;
    N = rows(x);
    for n = 1:N
        for m = 1:N
            res += x(n, m) * e^(-i*2*pi*((n - 1)*(l - 1) + (m - 1)*(k - 1))/N);
        end
    end
end
