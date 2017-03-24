%Problema de SEND MORE MONEY

var 1..9 : S;
var 0..9 : E;
var 0..9 : N;
var 0..9 : D;
var 1..9 : M;
var 0..9 : O;
var 0..9 : R;
var 0..9 : Y;

constraint S != E;
constraint S != N;
constraint S != D;
constraint S != M;
constraint S != O;
constraint S != R;
constraint S != Y;
constraint E != N;
constraint E != D;
constraint E != M;
constraint E != O;
constraint E != R;
constraint E != Y;
constraint N != D;
constraint N != M;
constraint N != O;
constraint N != R;
constraint N != Y;
constraint D != M;
constraint D != O;
constraint D != R;
constraint D != Y;
constraint M != O;
constraint M != R;
constraint M != Y;
constraint O != R;
constraint O != Y;
constraint R != Y;
constraint S*1000+E*100+N*10+D+M*1000+O*100+R*10+E = M*10000+O*1000+N*100+E*10+Y;

solve satisfy;
