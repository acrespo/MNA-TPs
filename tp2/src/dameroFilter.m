function res = dameroFilter(X)

%    X must be square
    filter = ones(size(X));
    N = rows(X);
    for i = 1:N
        for j = 1:N
            if (rem(i + j, 2) == 0) 
                filter(i, j) = 0;
            end
        end
    end
    res = filter .* X;
end

