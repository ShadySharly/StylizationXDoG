% /////////////////////////////////////////////////////////////////////////
close all
% IMAGENES %---------------------------------------------------------------
%--------------------------------------------------------------------------
% Si estan en el directorio raiz.
if not(isfolder('images'))
    imA = imread('Einstein.png');
    imB = imread('mujer.png');
    imC = imread('siberiano.png');
    imD = imread('tigre.png');

% Si las imagenes estan en un subdirectorio "images".
else
    imA = imread('images\Einstein.png');
    imB = imread('images\mujer.png');
    imC = imread('images\siberiano.png');
    imD = imread('images\tigre.png');
end

% XDoG %-------------------------------------------------------------------
%--------------------------------------------------------------------------
% Aplicacion del filtro
% xDoG(im, epsilon, sigma, phi, gamma);
imA_filtered = xDoG(imA, 0.0001, 1.4, 100, 0.99);
imB_filtered = xDoG(imB, 0.0005, 1, 230, 0.99);
imC_filtered = xDoG(imC, 0.0001, 1, 80, 0.99);
imD_filtered = xDoG(imD, -0.1, 1, 90, 0.99);

% XDoG Threshold %---------------------------------------------------------
%--------------------------------------------------------------------------
% Aplicacion del filtro Thresholding
% xDoG(im, epsilon, sigma, phi, gamma);
imA_thresholded = xDoG(imA, 0.03, 1, 80, 0.95);
imB_thresholded = xDoG(imB, 0.03, 1.5, 100, 0.94);
imC_thresholded = xDoG(imC, 0.03, 1.2, 100, 0.95);
imD_thresholded = xDoG(imD, 0.03, 1, 80, 0.92);

% GRAFICOS Y ESCRITURA %---------------------------------------------------
%--------------------------------------------------------------------------
write('Einstein', imA, imA_filtered, imA_thresholded);
write('Mujer', imB, imB_filtered, imB_thresholded);
write('Siberiano', imC, imC_filtered, imC_thresholded);
write('Tigre', imD, imD_filtered, imD_thresholded);

% /////////////////////////////////////////////////////////////////////////



