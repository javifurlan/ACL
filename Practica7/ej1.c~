#include <stdio.h>
#include <math.h>

char car;
int a,b, resultado;

void leer(){
	/*Modulo de lectura*/

	printf("Ingrese un caracter y dos numeros, luego presione ENTER: ");
	scanf("%c %d %d", &car, &a, &b );
}

int main(){
	leer(car,a,b);

	switch(car){
		case '+': resultado=a+b;
				  printf("%d + %d = %d\n",a,b,resultado);
				break;
		case '-': resultado=a-b;
				  printf("%d - %d = %d\n",a,b,resultado);
				break;
		case '*': resultado=a*b;
				  printf("%d * %d = %d\n",a,b,resultado);
				break;
		case '/': resultado=a/b;
				  printf("%d / %d = %d\n",a,b,resultado);
				break;
                case '^': resultado=pow(a,b);
                                  printf("%d ^ %d = %d\n",a,b,resultado);
                                break;
		default: 
				printf("ERROR!\n");
				break;
	}

}
