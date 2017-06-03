include "cumulative.mzn";

int: Nmaterias;
int: DiurnaNocturna;
int: Nsemestre = if DiurnaNocturna == 0 then 10 else 12 endif;
int: minCredito;
int: maxCredito;

set of int: MATERIAS = 1..Nmaterias;
set of int: SEMESTRES = 1..Nsemestre;

array[MATERIAS] of int:  materias;
array[MATERIAS] of set of int:  dependencias;
array[MATERIAS] of int:  simultaneos;
array[MATERIAS] of int:  creditos;

array[MATERIAS] of var SEMESTRES:  mesh;

var minCredito..maxCredito: cred;

array [MATERIAS] of var 1..1: unos;

constraint
  cumulative(mesh, unos, creditos, cred);

var 5..8: Nm;

constraint
  cumulative(mesh, unos, unos, Nm);

constraint
  forall(i in MATERIAS)(mesh[i] == mesh[simultaneos[i]]);

constraint
  forall(i in MATERIAS)(forall(s in dependencias[i])( mesh[i] > mesh[s]));

%solve minimize Nm;
solve minimize cred;
