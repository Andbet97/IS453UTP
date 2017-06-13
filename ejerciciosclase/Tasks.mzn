% Trabajo realizado por:
% Angelica Bibiana Lopez Velasquez, codigo 42153042
% Andres Felipe Betancurt Rivera, codig 1088028961
% Tema: Tareas y recursos
% La propuesta es realizar unas tareas con dependecias y consumo de recursos en el menor tiempo 
% cumpliendo las siguientes restricciones:
% -> Las tareas deben tener como requisito sus dependencias
% -> Las tareas no beben exigir mas del maximo de recursos

include "cumulative.mzn";

% Entradas
% Numero de tareas
int: n; 
% Numero de recursos
int: NDeRecursos; 
% Conjunto de Tareas
set of int: SQ = 1..n; 
% Conjunto de Recursos
set of int: MT = 1..NDeRecursos; 

% Duracion de cada tarea
array[SQ] of int: duration; 
% en el peor de los casos una tarea ira detras de otra empezando en el tiempo 1 (por eso '+ 1')
int: maxtime = sum(i in SQ)(duration[i]) + 1;
% Dependencias de cada tarea
array[SQ] of set of int: dependence;
% Maximo de recursos por tarea
array[MT] of int: maxDeRecurso; 
% lo que consume cada tarea (SQ) de cada recurso (MT)
array[MT, SQ] of int: RecursosPorTarea; 

% Maximo de recursos, asumiendo que voy a consumit todos en un tiempo x
int: recurso = sum(i in MT)(maxDeRecurso[i]);

% Conjunto de Recursos
set of int: RC = 0..recurso; 
% Conjunto de tiempo
set of int: TM = 1..maxtime; 

% tiempo total para realizar todas las tares
var TM: estimate; 

% variables de decision, se decide el tiempo de inicio de cada tarea
array[SQ] of var TM: time_start; 

% toda tarea debe realizarse despues de sus dependencias, si las tiene
constraint
  forall(i in SQ)(
    forall(j in dependence[i])(time_start[i] >= (time_start[j] + duration[j]))
    ); 

% Cada recurso no debe superar su maximo
constraint
  forall(i in MT)(
    cumulative(time_start, duration, [RecursosPorTarea[i, j] | j in SQ], maxDeRecurso[i])
    );

% calcular el tiempo total
constraint 
  estimate = max([time_start[i] + duration[i] | i in SQ]);

% minimizar el tiempo
solve minimize estimate;