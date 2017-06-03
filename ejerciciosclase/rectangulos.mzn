int: n;
int: lado1;
int: lado2;
int: xmax = if lado1 <= lado2 then lado2 else lado1 endif;
int: ymax = if lado1 <= lado2 then lado1 else lado2 endif;

set of int: SQUARE = 1..n;

array[SQUARE] of int: L1i;
array[SQUARE] of int: L2i;

var 0..xmax: height;
var 0..xmax*ymax: area = height * ymax;

array[SQUARE] of var 0..xmax: x;
array[SQUARE] of var 0..ymax: y;
array[SQUARE] of var 0..xmax: Xi;
array[SQUARE] of var 0..ymax: Yi;

constraint
      forall(s in SQUARE)(
        (Xi[s] = L1i[s] /\ Yi[s] = L2i[s]) \/
        (Xi[s] = L2i[s] /\ Yi[s] = L1i[s]) );

constraint
      forall(s in SQUARE)(x[s] + Xi[s] <= height);

constraint
      forall(s in SQUARE)(y[s] + Yi[s] <= ymax);

constraint
      forall(i,j in SQUARE where i != j)(
        (x[i] + Xi[i] <= x[j] \/ x[j] + Xi[j] <= x[i]) \/
        (y[i] + Yi[i] <= y[j] \/ y[j] + Yi[j] <= y[i]) );

solve minimize area;

output  [show(xmax) ++ "\n"]++ % width, el lado mas largo
        [show(ymax) ++ "\n"]++ % height, el lado mas corto
        % (x, y, lado1, lado2)
        [show(x[i]) ++ show(y[i]) ++ show(Xi[i]) ++ show(Yi[i]) | i in SQUARE]++
        % coordenadas, largo y ancho del sobrante
        % height es la variable de decision en el rango 1..xmax
        [show(height) ++ "0" ++ show(xmax-height) ++ show(ymax)] 
