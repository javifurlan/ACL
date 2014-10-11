#include<stdio.h>
#include<stdlib.h>
#include<dlfcn.h>

int main()
{
  void *handle;
  double (*cosine) (double); /*puntero a funcion*/
  
  // cargar libreria matematica
  handle = dlopen("libm.so",RTLD_LAZY);
  
  //obtener el link a la funcion cos de la libreria, obtengo un puntero a la funcion
  cosine = (double (*) (double)) dlsym(handle,"cos");
  printf("el coseno de 2 es : %f \n", cosine(2.0));
  dlclose(handle);
  exit(EXIT_SUCCESS);
  
}

