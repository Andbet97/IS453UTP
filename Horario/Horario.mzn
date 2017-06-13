% Trabajo realizado por:
% Angelica Bibiana Lopez Velasquez, codigo 42153042
% Andres Felipe Betancurt Rivera, codigo 1088028961
% Tema: Proyecto Horario Academico
% La propuesta es organizar el horario de un semestre minimizando el numero de salones a usar
% cumpliendo las siguientes indicaciones:
% -> Las clases se deben realizar desde las 7 hastas las 18 horas
% -> Las Clases se impartiran 5 dias a la semana
% -> Se deben ocupar como maximo 15 salones, ya que solo se cuenta con estos
% Adicional a esto se propuso optimizar el umero de saloes, es decir, crear el horario utilizando 
% el numero más pequeño de salones posibles y tambien se planteo tener horas de almuerzo para los alumnos que
% van en bloque

include "cumulative.mzn";

int: numSessions; % Numero de materias
int: numLecturers; % Numero de profesores
int: numDays; % Dias de clase
int: numSlots; % Horas a la semana
int: numSlotsPerDay; % Horas al dia
int: availRooms; % salones disponibles
int: numPeriods; % Numero de semestres

set of int: Session = 0..(numSessions-1); % conjunto de sesiones
set of int: Slots = 1..numSlots; % conjunto de horas a la semana
set of int: Days = 0..(numDays-1); % conjunto de dias
set of int: Hours = 1..numSlotsPerDay; % conjunto de horas por dia
set of int: Perid = 0..(numPeriods-1); % conjunto de semestres
set of int: Rooms = 1..availRooms; % conjunto de salones disponibles
set of int: Teacher = 0..(numLecturers-1); % conjunto de profesores

array[Session] of int: duration; % Duracion de la sesion
array[Session] of int: teaching; % Profesor de cada sesion
array[Session] of int: period; % Semestre
array[Session] of int: group; % Grupo
array[Session] of int: roomRequirement; % Requerimiento especial

array[Session] of var Slots: S; % Hora de la clase
array[Session] of var Days: D; % Dia de la clase
array[Session] of var Hours: H; % Hora del día
%array[Perid, Days] of var 5..8: Lunch; % Horas de almuerzo
var Rooms: Salones; % Salones disponibles
array[Session] of var 1..1: unos; % arreglo de unos con indexacion 0..203

% Se establace el dia en base a la hora de inicio que se decicio, lo mismo para la hora del dia
constraint
  forall(i in Session)((S[i] div numSlotsPerDay = D[i]) /\ (S[i] mod numSlotsPerDay = H[i]));

% Si el grupo es el mismo, la materia debe verse en dias diferentes
constraint
  forall(i,j in Session where group[i] == group[j] /\ i != j)(D[i] != D[j]);

% Ninguna clase debe superar los tiempos limite
constraint
  forall(i in Session)(H[i] + duration[i] <= numSlotsPerDay);

% Ningun profesor puede estar dando dos clases al mismo tiempo
constraint
  forall(i, j in Session where teaching[i] == teaching[j] /\ i != j)((S[i] + duration[i] <= S[j]) \/
                                                                    (S[j] + duration[j] <= S[i]));
                                                               
% Se respeta una de las tres haras de almuerzo
constraint
  forall(i in Session)(
    (H[i] != 5 \/ H[i] != 6 \/ H[i] != 7)
    );

% verificar que no se usen mas de los salones que decide "Salones"
constraint
  cumulative(S, duration, unos, Salones);

solve minimize Salones;