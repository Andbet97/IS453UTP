int: n;

set of int: ARTICULOS = 1..n;
int: carticulos;

var 0..sum(i in ARTICULOS)(valor[i]*carticulos) : botin;
array[ARTICULOS] of var 0..carticulos : articulo;
array[ARTICULOS] of int : valor;
array[ARTICULOS] of int : peso;

int : pesoMax;

constraint
        sum(i in ARTICULOS)(peso[i]*articulo[i]) <= pesoMax;

constraint
        sum(i in ARTICULOS)(valor[i]*articulo[i]) = botin;

solve maximize botin;
