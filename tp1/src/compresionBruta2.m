function res = compresionBruta2(path, out, N, eig_function)

    a = imread(path);
    imshow(a) % muestro la imagen original
    b = im2col(a, [16,16], 'distinct');
    m = mean(b.');
    m = m.';
    M = repmat(m, 1, 1024);
    ds = double(b) - M; %se castea a double para evitar problemas al hacer la multiplicacion de ds. No esta definida para uint8.
    cc = cov(b');

    [V, D] = eig_function(cc);

    % ordeno los autovalores de mayor a menor
    D = diag(D);
    [D,i] = sort(D, 'descend');
    D = diag(D);
    V = V(:,i);

    % proyecto las primeras N autoimagenes

    pv = [];
    for i = 1:N
        pv(:,i) = V(:,i).' * ds;
    end

    % solamente considero las primeras N autoimagenes...
    d = M;
    for k = 1:1024
        for i = 1:N
            d(:,k) += pv(k,i) * V(:,i);
        end
    end

    compimg = col2im(d, [16,16], [512,512], 'distinct');
    compimg = uint8(compimg);
    imshow(compimg);

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


    imwrite(compimg, out);

end
