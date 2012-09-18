function res = compresionBruta2(path, out, count, eig_function)

    a = imread(path);
    imshow(a) % muestro la imagen original
    b = im2col(a, [16,16], 'distinct');
    m = mean(double(b.'));
    m = m.';
    M = repmat(m, 1, 1024);
    ds = double(b) - M;
    cc = cov(double(b'));

    [V, D] = eig_function(cc);

    % ordeno los autovalores de mayor a menor
    D = diag(D);
    [D,i] = sort(D, 'descend');
    D = diag(D);
    V = V(:,i);

    % proyecto las primeras N autoimagenes

    pv = [];
    for i = 1:count
        pv(:,i) = V(:,i).' * ds;
    end

    % solamente considero las primeras autoimagenes...
    d = M;
    for k = 1:1024
        for i = 1:count
            d(:,k) += pv(k,i) * V(:,i);
        end
    end

    compimg = col2im(d, [16,16], [512,512], 'distinct');
    compimg = uint8(round(compimg));
    imshow(compimg);
    imwrite(compimg, out);

end
