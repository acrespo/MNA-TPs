function tp2()

    x = load('saturno');
    colormap(gray(255));
    image(x');
    title('Imagen original');
    print('-dpng', './images/saturno.png');

    X = fft2(x);

    %print amplitude image
    %amp = normalization(abs(X), 0, 255);
    amp = abs(X);
    colormap(gray(255));
    image(amp');
    title('Imagen de la amplitud');
    print('-dpng', './images/amplitude.png');

    %print phase image
    phase = normalization(angle(X), 0, 255);
    colormap(gray(255));
    image(phase');
    title('Imagen de la fase');
    print('-dpng', './images/phase.png');

    %rebuild original image
    %rebuild = abs(ifft2(X));
    rebuild = real(ifft2(X));
    colormap(gray(255));
    image(rebuild');
    title('Imagen reconstruida con la Transformada Inversa Discreta');
    print('-dpng', './images/rebuild.png');

    %apply custom filter
    customFilteredImg = customFilter(X);
    colormap(gray(255));
    image(customFilteredImg');
    title('Imagen tras aplicación del filtro custom');

    %apply gauss filter
    gaussFilteredImg = gaussFilter(X);
    colormap(gray(255));
    image(gaussFilteredImg');
    title('Imagen tras aplicación del filtro gaussiano');

    %apply damero filter
    dameroFilteredImg = dameroFilter(X);
    colormap(gray(255));
    image(dameroFilteredImg');
    title('Imagen tras aplicación del filtro damero');

end
