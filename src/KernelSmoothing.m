function [ya,va,aa]=KernelSmoothing(vector,ancho,ventana,dibujo);

%KernelSmoothing: Suavizado Kernel de funciones unidimensionales
%
%Suavizado Kernel de funciones unidimensionales equiespaciadas
%basado en la funcion alcub de Alvaro Page
%
%uso:
%    [ya,va,aa]=KernelSmoothing(vector,ancho,ventana,dibujo)
%
%
%Ejemplos:
%   [ya,va,aa]=KernelSmoothing(vector,15,'bartlett','draw')
%   [ya,va,aa]=KernelSmoothing(vector,15)
%
%ARGUMENTOS DE ENTRADA
%
%   vector: Es el vector de entrada
%   ancho : Ancho de banda
%   ventana: (opcional) El tipo de ventana a utilizar
%   dibujo: (opcional) Se quieren dibujos del ajuste ('draw')
%
%VARIABLES DE SALIDA
% ya = vector columna (1,N) con las salidas ajustadas
% va = derivada de y, ajustada
% aa = derivada segunda de y, ajustada
%
% CONDICIONES DE USO. ESTE PROGRAMA ES ADECUADO PARA SUAVIZAR CURVAS:
% Con sobremuestreo. La frecuencia de muestreo debe ser mas de 40 veces
% la frecuencia del ciclo principal.
% Si no hay sobremuestreo, deben usarse splines
% No se desea que la curva pase por puntos especificos, sino por un
% promedio.
% No hay subarmonicos acusados. En caso contrario, deben usarse esplines o
% ajustes de orden superior (quinto)
%
% Realizado por José Ramón Ruiz y Juanma Belda




%Analizamos los parametros de entrada a la función
% switch nargin
%     case 2
%         if nargout == 0
%             Dibuja = 1;
%         else
%             Dibuja = 0;
%         end
%         ventana = 'gausswin';
%     case 3
%         Dibuja = 0;
%     case 4
%         if strcmp(dibujo,'draw')
%             Dibuja = 1;
%         else
%             Dibuja = 0;
%         end
%     otherwise
%         error('Número de parámetros de entrada erróneos');
% end


ancho = 3.01 * ancho;

%Nos aseguramos que el vector de entrada no es una matriz multidimensional
% if length(size(vector))~=2
%     error('Dimensiones del vector de entrada erróneas');
% end
% 
% %Nos aseguramos de que es un vector
% if min(size(vector))~=1
%     error('Algoritmo solo aplicable a vectores')
% end

%Forzamos que sea un vector columna
if size(vector,1) == 1
    vector = vector';
end

%Nos generamos el vector x
max_x = fix((ancho - 1)/2);
vector_x = (-max_x : 1 : max_x)';

%Cambiamos la definicion de la anchura
ancho = length(vector_x);

%Nos creamos la ventana
% mVentana = feval(ventana, ancho);
mVentana = gausswin(ancho);
mVentana = mVentana ./ max(mVentana); %Nos aseguramos de que el máximo es siempre 1

%Puntos añadidos
relleno = round(max_x);

%Nos generamos la matriz A (que siempre es la misma)
a(1,1) = nansum(mVentana .* (vector_x .^ 6));
a(1,2) = nansum(mVentana .* (vector_x .^ 5));
a(1,3) = nansum(mVentana .* (vector_x .^ 4));
a(1,4) = nansum(mVentana .* (vector_x .^ 3));
a(2,4) = nansum(mVentana .* (vector_x .^ 2));
a(3,4) = nansum(mVentana .* vector_x);
a(4,4) = nansum(mVentana);
a(2,1)=a(1,2);
a(2,2)=a(1,3);
a(2,3)=a(1,4);
a(3,1)=a(2,2);
a(3,2)=a(2,3);
a(3,3)=a(2,4);
a(4,1)=a(1,4);
a(4,2)=a(2,4);
a(4,3)=a(3,4);

%De la matriz A vamos a necesitar solo la inversa, asi que la calculamos
inv_a = inv(a);

%A la matriz que vamos a medir le añadimos al inicio y al final valores
%para hacer mas rápido el algoritmo
tam_vector = length(vector);
t = vector(tam_vector);

vector = [ones(relleno,1) .* vector(1); vector];
vector = [vector; ones(relleno,1) .* t];

%Si dibujamos sacamos la banderita
% if Dibuja
%     h = waitbar(0, 'Calculando...');
% end

%Resevamos memoria para que vaya más rápido
ya = zeros(tam_vector,1);
va = ya;
aa = ya;


%Hacemos los cálculos
for i = 1 : tam_vector
    %Extraemos la parte del vector de interes
    y = vector(i : i + ancho - 1);
    
    %Nos creamos la matriz b
    b(1,1)= nansum(mVentana .* y .* (vector_x .^ 3));
    b(2,1)= nansum(mVentana .* y .* (vector_x .^ 2));
    b(3,1)= nansum(mVentana .* y .* vector_x);
    b(4,1)= nansum(mVentana .* y);
    
    %Realizamos el ajuste por minimos cuadrados
    c = inv_a * b;
    
    %Si dibujamos tambien sacamos la banderita
%     if Dibuja
%         if ~mod(i,100)
%             waitbar(i/tam_vector,h);
%         end
%     end
    
    %Sacamos los valores
    ya(i,1)=c(4); 
    va(i,1)=c(3);
    aa(i,1)=2*c(2);
end

% if Dibuja
%     close(h) %Cerramos el waitbar
%     
%     %hacemos los dibujos
%     subplot(2,1,1);
%         plot(vector(relleno + 1: tam_vector + relleno),'r');
%         hold on
%         plot(ya,'b');
%         title('ajuste');
%         
%     subplot(2,2,3);
%         plot(va)
%         title('velocidad');
%         
%     subplot(2,2,4);
%     plot(aa,'y')
%     title('aceleración');
% end
    
