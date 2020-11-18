syms x
ecuacion = x^2;

start = 0;
finish = 10;
step = .01;

%diferencia en x = steps = base

puntos_x = start:step:finish;
area_acumulada = 0;
for i = 2:length(puntos_x)
    % disp("area acumulada: " + num2str(area_acumulada))
    alturaPequenia = obtenerAltura(ecuacion, puntos_x(i-1));
    alturaGrande = obtenerAltura(ecuacion, puntos_x(i));
    area_trapecio = obtenerAreaTrapecio(alturaPequenia, alturaGrande, step);
    area_acumulada = area_acumulada + area_trapecio;
end

disp(area_acumulada);

function surface = obtenerAreaTrapecio(small_height, tall_height, base)
    surface = base*(small_height + tall_height)/2;
end

function altura = obtenerAltura(eqn, punto)
    func = matlabFunction(eqn);
    altura = func(punto);
end
