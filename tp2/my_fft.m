function y = my_fft(x)
> n = length(x);
> if n == 1
>    y = x;
> else
>    m = n/2;
>    y_top = my_fft(x(1:2:n));
>    y_bottom = my_fft(x(2:2:n));
>    d = exp(-2 * pi * i / n) .^ (0:m-1);
>    z = d .* y_bottom;
>    y = [ y_top + z , y_top - z ];
> end
> endfunction
