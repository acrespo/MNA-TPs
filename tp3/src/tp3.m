function tp3(dim, iterations)

	uN = zeros(dim, dim);
	u0 = zeros(dim, dim);
	u0(dim / 2, dim / 2) = 100000;

	k = 0.025;
	v0 = 2;
	f0 = 1/3600;

	deltaT = 0.0001;
	h = 0.01;

	colormap(gray(255));
	image(u0);
	print('-dpng', strcat('../images/iteration-1.png'));

	%print the images of the radioactive cloud at each instant
	uPrev = u0;
	for t = 2:iterations
		
		uN = processIteration(t, v0, f0, k, h, deltaT, uPrev);
		image(uN);
		print('-dpng', strcat('../images/iteration-', num2str(t), '.png'));
		uPrev = uN;
	end
end

function ret = windSpeed(t, v0, f0)
    ret = [ v0 * cos( 2*pi*f0*t ), v0 * sin( 2*pi*f0*t ) ];
end

function ret = processIteration(t, v0, f0, k, h, deltaT, uPrev)

	ret = zeros(size(uPrev));
	vX = windSpeed(t, v0, f0)(1);
	vY = windSpeed(t, v0, f0)(2);
	
	for i = 2:length(uPrev) - 1
		for j = 2:length(uPrev) - 1
			dUdX = (uPrev(i+1, j) - uPrev(i-1, j)) / (2*h);
			dUdY = (uPrev(i, j+1) - uPrev(i, j-1)) / (2*h);
			
			d2Ud2x = (uPrev(i+1, j) - 2 * uPrev(i, j) + uPrev(i-1, j)) / h^2;
			d2Ud2y = (uPrev(i, j+1) - 2 * uPrev(i, j) + uPrev(i, j-1)) / h^2;
			
			ret(i, j) = 2 * deltaT * ( k * ( d2Ud2x + d2Ud2y ) - (vX*dUdX) - (vY*dUdY)) + uPrev(i,j);
		end
	end
end