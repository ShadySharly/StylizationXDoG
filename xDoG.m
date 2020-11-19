function filtered_image = xDoG(input_image, epsilon, sigma, phi, gamma)
% Como el mecanismo de detección de bordes esta basado en el Laplaciano de
% Gauss, se emplea un k que aproxime el GoD a este valor, el cual
% corresponde a un factor de relacion entre las desviaciones estandar de
% las dos funciones gaussianas a utilizar mas adelante.
k = 1.6;

% Se convierte la imagen de entrada a escala de grises
im = rgb2gray(input_image);

% Se obtiene la imagen en su representacion de presicion doble, para el
% caso de utilizar imagenes a eleccion del usuario que esten fuera de las
% incluidas en este proyecto.
im = im2double(im);

% GAUSS FILTER
% Antes de obtener la diferencia gaussiana de una image, es necesario
% obtener las dos funciones gaussianas correspondientes, aplicando a una de
% estas el factor k. Para ambas funciones se considera la desviacion
% estandar de entrada para su distribucion.
im_gaussA = imgaussfilt(im, sigma);
im_gaussB = imgaussfilt(im, k * sigma);

% Ahora que se tienen las dos funciones se determina la diferencia de
% ambas.
im_Dx = im_gaussA - (gamma * im_gaussB);

% Se extraen las dimensiones
[n, m] = size(im_Dx);

% Se calcula la XDoG recorriendo la matriz
for row = 1: n
    for col = 1: m
        % Primero caso
        if im_Dx (row, col) < epsilon
            im_Dx (row, col) = 1;
        
        % Segundo caso
        else
            im_Dx (row, col) = 1 + tanh(phi * (im_Dx(row, col))); 
            
        end
    end    
end

% Ahora que ya se tiene la matriz resultante del proceso, se retorna como
% una imagen en escala de grises
filtered_image = mat2gray(im_Dx);

end

