function [lambda, z] = potenciasInversasCorridasMejorado(alpha, A)
    
    z = ones(length(A), 1);
    w = zeros(length(A), 1);
    n = 0;
    while norm(z - w) > 10**(-14)
        n = n + 1;
        w = z;
		z = (A - alpha*eye(size(A))) \ w;   %Encontrar z / (A -uI)*z = x
        l = (z'*A*z) / (z'*z);
        if rcond(A - l*eye(length(A))) > 10**(-15)
            z = (A - l*eye(length(A))) \ z;
        end
        for i = 1:length(A)
            if abs(z(i)) == max(abs(z))
                break;
            end
        end
    z = z / z(i);
    end

    %lambda = (z'*A*z) / (z'*z);
    lambda = l;
end
