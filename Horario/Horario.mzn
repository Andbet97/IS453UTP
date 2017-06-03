% Fecha de sustentacion 7 de Junio, maximo 8 (desde las 8am)
% Fecha de parcial final 8 
include "cumulative.mzn";

int: numSessions; % Numero de materias
int: numLecturers; % Numero de profesores
int: numDays; % Dias de clase
int: numSlots; % Horas a la semana
int: numSlotsPerDay; % Horas al dia
int: availRooms; % salones disponibles
int: numPeriods; % Numero de semestres

set of int: SQ = 0..(numSessions-1); % conjunto de sesiones
set of int: SL = 0..(numSlots-1); % conjunto de horas a la semana
set of int: Days = 0..(numDays-1); % conjunto de dias
set of int: Hours = 0..(numSlotsPerDay-1); % conjunto de horas por dia
set of int: Perid = 0..(numPeriods-1); % conjunto de semestres
set of int: Rooms = 1..availRooms; % conjunto de salones disponibles

array[SQ] of int: duration; % Duracion de la sesion
array[SQ] of int: teaching; % Profesor de cada sesion
array[SQ] of int: period; % Semestre
array[SQ] of int: group; % Grupo
array[SQ] of int: roomRequirement; % Requerimiento especial

array[SQ] of var SL: S; % Hora de la clase
array[SQ] of var Days: D; % Dia de la clase
array[SQ] of var Hours: H; % Hora del día
array[Perid, Days] of var 4..7: Lunch; % Horas de almuerzo
var Rooms: Salones; % Salones disponibles
array[SQ] of var 1..1: unos; % arreglo de unos con indexacion 0..203
var SL: maximo;

% Se establace el dia en base a la hora de inicio que se decicio, lo mismo para la hora del dia
constraint
  forall(i in SQ)(S[i] div numSlotsPerDay = D[i] /\ S[i] mod numSlotsPerDay = H[i]);

% Si el grupo es el mismo, la materia debe verse en dias diferentes
constraint
  forall(i,j in SQ where group[i] == group[j] /\ i != j)(D[i] != D[j]);

% Ninguna clase debe superar los tiempos limite
constraint
  forall(i in SQ)(H[i] + duration[i] <= numSlotsPerDay);

% Ningun profesor puede estar dando dos clases al mismo tiempo
constraint
  forall(i,j in SQ where teaching[i] == teaching[j] /\ i != j)(S[i] + duration[i] <= S[j] \/
                                                               S[j] + duration[j] <= S[i]);
                                                               
% Cada periodo tiene horas decididas de almuerzo, por lo tanto ninguna clase de un periodo determinado 
% puede tener clases en estas horas de almuerzo
constraint
  forall(i in SQ)(
    H[i] + duration[i] <= Lunch[period[i], D[i]] \/ Lunch[period[i], D[i]] + 1 <= S[i]
    ); 

%constraint
  %cumulative(S, duration, unos, Salones);

constraint
  maximo = max(S);

solve satisfy;