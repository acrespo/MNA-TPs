function res = dft_test()

    threshold = 10**-10;
    for i = 1:1000
        a = rand(5, 5);
        distance = norm(dft(a) - fft2(a));

        if distance > threshold
            disp('Failed');
            disp(a);
        end
    end

end
