function tp2()

    x = load('../data/saturno');
    colormap(gray(255));
    image(x');
    title('Imagen original');
    print('-dpng', '../images/saturno.png');

    X = fft2(x);

    %print amplitude image
    amp = abs(X);
    image(amp');
    title('Imagen de la amplitud');
    print('-dpng', '../images/amplitude.png');

    %print phase image
    phase = normalization(angle(X), 0, 255);
    image(phase');
    title('Imagen de la fase');
    print('-dpng', '../images/phase.png');

    %rebuild original image
    rebuild = real(ifft2(X));
    image(rebuild');
    title('Imagen reconstruida con la Transformada Inversa Discreta');
    print('-dpng', '../images/rebuild.png');

    %apply custom filter
    customFilteredImg = normalization(real(ifft2(customFilter(X))), 0, 255);
    image(customFilteredImg');
    title('Imagen tras aplicacion del filtro custom');
    print('-dpng', '../images/customFilter.png');

    %apply gauss filter
    gaussFilteredImg = normalization(real(ifft2(gaussFilter(X))), 0, 255);
    image(gaussFilteredImg');
    title('Imagen tras aplicacion del filtro gaussiano');
    print('-dpng', '../images/gaussFilterNorm.png');

    %apply damero filter
    dameroFilteredImg = normalization(real(ifft2(dameroFilter(X))), 0, 255);
    image(dameroFilteredImg');
    title('Imagen tras aplicacion del filtro damero');
    print('-dpng', '../images/dameroFilterNorm.png');

end
