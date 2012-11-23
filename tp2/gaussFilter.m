function res = gaussFilter(X)

%    X must be square
    filter = zeros(size(X));
    N = rows(X);
    for i = 1:N
        for j = 1:N
            filter(i, j) = e^(-0.1 * (i^2 + 1^2));
        end
    end
    res = filter .* X;
end
