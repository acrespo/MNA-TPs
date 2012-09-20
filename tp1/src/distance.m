function [res] = compresionBruta1(first, second)

    a = imread(first);
    compimg = imread(second);

    mse = 0;
    maximum = 0;
    for i = 1:512
        for j = 1:512
            mse += (int32(compimg(i, j)) - int32(a(i, j)))^2;
            if maximum < a(i, j)
                maximum = a(i, j);
            end
        end
    end

    mse /= (512^2);
    printf("Square mean error is %g\n", mse);
    psnr = 20 * log10(maximum) - 10 * log10(mse);
    printf("PSNR is %g\n", psnr);

end
