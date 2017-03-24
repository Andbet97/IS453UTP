int : cantidad = 9550;

array [1..11] of var 0..100 : monedas;
array [1..11] of int : denom = [50, 100, 200, 500, 1000, 2000, 5000, 10000,
                                20000, 50000, 100000];

var 0..10000 : totalMonedas;

constraint sum(i in 1..11)(monedas[i]*denom[i]) = cantidad;
constraint sum(i in 1..11)(monedas[i]) = totalMonedas;

solve minimize totalMonedas;
