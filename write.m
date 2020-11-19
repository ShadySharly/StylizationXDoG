function [] = write(original_name, original, filtered, filtered_T)
% Se define el directorio en el que se almacenaran las imagenes de salida
newSubFolder = 'graphics\';

% Se verifica que el directorio exista, en caso contrario se crea la
% carpeta en el directorio raiz
if not(isfolder(newSubFolder))
    mkdir(newSubFolder)
end

% Se define el nombre del grafico de salida.
graphic_name = strcat('graphics\', original_name, 'filters.png');

% Para verificar que se almacenan los graficos correctamente, se muestran
% por pantalla los resultados.
graphics = figure,
subplot(1,3,1), imshow(original), title('Original'),
subplot(1,3,2), imshow(filtered), title('XDoG Filter'),
subplot(1,3,3), imshow(filtered_T), title('XDoG Filter Thresholded');

% Se exportan los graficos obtenidos con el nombre especificado.
exportgraphics(graphics, graphic_name);

end

