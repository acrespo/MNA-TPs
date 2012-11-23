function res = customFilter(X)

%    X must be square
    filter = ones(size(X));
    for i = 1: 400
        for j = 190:210 
            filter(i, j) = 0; 
        end
    end
    for i = 190:210
        for j = 1:400
            filter(i, j) = 0;
        end
    end

    res = filter .* X;
end
