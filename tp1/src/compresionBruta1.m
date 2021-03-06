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

    imwrite(meanimg, out);

end
