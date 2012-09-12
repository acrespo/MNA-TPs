function [T, Q] = metodoQR(A)

	T = A;
	n = 0;
	previous = zeros(size(A));
	Q = eye(size(A));
	while norm(previous-T) > 10**-5
		previous = T;
		[Qk , R] = qr(T);
		T = R*Qk;
		n += 1;
		Q = Q*Qk;
	end
	disp("Number of iterations:"), disp(n);
end