int: n;
set of int: SQUARE = 1..n;
int: maxl = sum(i in SQUARE)(i);

var n..maxl: height;
var n..maxl: width;
var 0..n*maxl: area = height * width;

array[SQUARE] of var 0..maxl: x;
array[SQUARE] of var 0..maxl: y;
array[SQUARE] of int: size = [ i | i in SQUARE ];

constraint
      forall(s in SQUARE)(x[s] + s <= width);

constraint
      forall(s in SQUARE)(y[s] + s <= height);

constraint
      forall(i,j in SQUARE where i != j)(
        (x[i]+i <= x[j] \/ x[j]+j <= x[i]) \/ (y[i]+i <= y[j] \/ y[j]+j <= y[i]) );
      
solve minimize area;

output ["Area de desperdicio= ", show(area-sum(i in SQUARE)(i*i)),"\n",
         "X= ", show(x), "\n",
         "Y= ", show(y), "\n",];
