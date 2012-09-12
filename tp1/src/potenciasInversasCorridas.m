function [u, x] = potenciasInversasCorridas(x, A)
    
    
	previous = zeros(size(x));
    n = 0;
	while norm(previous-x) > 10**-5
		
		previous = x;
		u = (x'*A*x)/(x'*x); %u = R(x)
		z = (A - u*eye(size(A))) \ x;   %Encontrar z / (A -uI)*z = x
		x = z / norm(z);
        n +=1;
	end
    disp("Number of iterations: "), disp(n)
end
