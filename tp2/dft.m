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

function res = _dft(x, i, j)

%   X must be square
    res = 0;
    N = rows(x);
    for n = 1:N
        for m = 1:N
            res += x(n, m) * e^(-i*2*pi*(n*i + m*j)/N);
        end
    end
end
