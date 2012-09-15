function [Q, T] = metodoQR(A)

    [n, m] = size(A);
    %T = hess(A);
    T = A;

    iterations = 0;
    previous = zeros(size(A));
    Q = eye(size(A));

    while norm(previous - T) > 10**-6

        previous = T;

        [Qk , R] = qr(T);

        T = R*Qk;
        Q = Q*Qk;

        iterations += 1;
    end

    for i = 1:n
        Q(:,i) = Q(:,i) / norm(Q(:,i));
    end

    disp("Number of iterations:"), disp(iterations);
end
