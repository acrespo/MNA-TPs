function [res] = compresionBruta1(path, out)

    a = imread(path);
    imshow(a) % muestro la imagen original
    b = im2col(a,[16,16], 'distinct');
    m = mean(b');
    m = m.';
    M = repmat(m,1,1024);
    d = col2im(M,[16,16],[512,512], "distinct");
    meanimg = uint8(d);
    imshow(meanimg); % muestro la imagen "media"

    mse = 0;
    maximum = 0;
    for i = 1:512
        for j = 1:512
            mse += (int32(meanimg(i, j)) - int32(a(i, j)))^2;
            if maximum < a(i, j)
                maximum = a(i, j);
            end
        end
    end
    mse /= (512^2);
    printf("Square mean error is %g\n", mse);
    psnr = 20 * log10(maximum) - 10 * log10(mse);
    printf("PSNR is %g\n", psnr);

imwrite(meanimg, out);

end
