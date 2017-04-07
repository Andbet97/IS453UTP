int: n;

set of int: ARTICULOS = 1..n;

var 0..sum(i in ARTICULOS)(valor[i]) : botin;
array[ARTICULOS] of var 0..1 : articulo;
array[ARTICULOS] of int : valor;
array[ARTICULOS] of int : peso;

int : pesoMax;

constraint
        sum(i in ARTICULOS)(peso[i]*articulo[i]) <= pesoMax;

constraint
        sum(i in ARTICULOS)(valor[i]*articulo[i]) = botin;

solve maximize botin;
