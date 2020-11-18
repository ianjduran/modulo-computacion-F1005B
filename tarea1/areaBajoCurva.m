syms x
ecuacion = x^2;

start = 0;
finish = 10;
step = .5;

%diferencia en x = steps = base

puntos_x = start:step:finish;
area_acumulada = 0;
for i = 2:length(puntos_x)
    % disp("area acumulada: " + num2str(area_acumulada))
    area_trapecio = obtenerAreaTrapecio(ecuacion ,puntos_x(i-1), puntos_x(i), step);
    area_acumulada = area_acumulada + area_trapecio;
end

disp(area_acumulada);

function surface = obtenerAreaTrapecio(eqn, punto_inicial, punto_final, base)
    small_height = obtenerAltura(eqn, punto_inicial);
    big_height = obtenerAltura(eqn, punto_final);
    surface = base*(small_height + big_height)/2;
end

function altura = obtenerAltura(eqn, punto)
    func = matlabFunction(eqn);
    altura = func(punto);
end
