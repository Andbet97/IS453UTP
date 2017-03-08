#include <stdio.h>
#include <stdlib.h>

struct nodo {
  int info;
  int V[7];
  struct nodo *sig;
};

struct nodo *Push(struct nodo *p, int elem, int Vec[], int t)  //Agregar elementos a la pila
{
  int i;
  struct nodo *q;
  q = (struct nodo*)malloc (sizeof(struct nodo));
  q->info = elem;
  for (i = 0; i <= t; i++){
    q->V[i] = Vec[i];
  }
  if(p == NULL){
  q->sig=q;
  p = q;
  }
  else{
  	q->sig = p->sig;
  	p->sig= q;
  }
  return p;
}

struct nodo Pop(struct nodo **p)  //ELiminar elementos de la pila
{
  int i;
	struct nodo result;
	struct nodo *temp;
	if(*p != NULL)
	{
    if(*p == ((*p)->sig)){
		result.info = (*p)->info;
    for (i = 0; i < 7; i++){
      result.V[i] = (*p)->V[i];
    }
		free(*p);
		*p = NULL;
		}
    else{
		temp = (*p)->sig;
		(*p)->sig = temp->sig;
    result.info = temp->info;
    for (i = 0; i < 7; i++){
      result.V[i] = temp->V[i];
    }
		free(temp);
	  }
	}
	return result;
}


int main ()
{
  struct nodo *P, pop;
  int result = 0;
  int valor , Vec[8] = {7, 50, 100, 200, 500, 1000, 2000, 5000};
  P = NULL;
  printf("Ingrese la cantidad a devolver\n");
  scanf("%d", &valor);
  P = Push(P, valor, Vec, Vec[0]);
  while(P != NULL){
    pop = Pop(&P);
    if ((pop.info > 0)&&(pop.V[0] > 1)){
      int i;
      int nuevo = pop.info - pop.V[1];
      P = Push(P, nuevo, pop.V, pop.V[0]);
      int NV[pop.V[0]];
      for (i = 0; i <= pop.V[0]; i++){
        if (i == 0){
          NV[0] = pop.V[0]-1;
        }
        if (i >= 2){
          NV[i-1] = pop.V[i];
        }
      }
      P = Push(P, pop.info, NV, NV[0]);
    }
    if (pop.info == 0){
      result++;
    }
  }
  printf("Posibles combinaciones: %d\n", result);
  return 0;
}
