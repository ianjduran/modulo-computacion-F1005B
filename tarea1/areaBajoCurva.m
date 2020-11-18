
% Ecuacion de la grafica
syms x
ecuacion = x^2;

% Parametros modificables
start = 0;
finish = 10;
step = .008;

%diferencia en x = steps = base

puntos_x = start:step:finish;
area_acumulada = 0;

for i = 2:length(puntos_x)
    disp("area acumulada: " + num2str(area_acumulada))
    %% PARA CALCULAR CON RECTANGULOS
    
    % base mas pequeña que .01 para un area mas exacta
    area_cuadrado = obtenerAreaCuadrado(ecuacion,puntos_x(i-1),puntos_x(i));
    area_acumulada = area_acumulada + area_cuadrado;
    
    
    %% PARA CALCULAR CON TRAPECIOS
    %{
    area_trapecio = obtenerAreaTrapecio(ecuacion ,puntos_x(i-1), puntos_x(i), step);
    area_acumulada = area_acumulada + area_trapecio;
    %}
end

disp(area_acumulada);


%% DEFINICION DE FUNCIONES

% Funcion que halla el area de un cuadrado,
function surf = obtenerAreaCuadrado(eqn, punto_inicial, punto_final)
    diffX = punto_final - punto_inicial;
    height = obtenerAltura(eqn, punto_inicial);
    surf = diffX*height;
end


% Funcion que obtiene la base del trapecio
function surface = obtenerAreaTrapecio(eqn, punto_inicial, punto_final, base)
    % Obtiene la altura en el punto izquierdo
    small_height = obtenerAltura(eqn, punto_inicial);
    % Obtiene la altura en el punto derecho
    big_height = obtenerAltura(eqn, punto_final);
    % Calcula la altura y la devuelve
    surface = base*(small_height + big_height)/2;
end

% Funcion que obtiene la altura suponiendo que parte de y=0.
function altura = obtenerAltura(eqn, punto)
    func = matlabFunction(eqn);
    altura = func(punto);
end
