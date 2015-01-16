#include <iostream>
#include <string>
using namespace std;

class A{
    public: 
       virtual int m(int x){
            return m1(x);        
        }
       virtual int m1(int x){
            x -= 10;  // resta 10       
            return x;        
        }
};

class B: public A{
        int m1(int x){
            x += 8;  // suma 10
            return x;    
	}
};

int main(void){
    int x = 0;
    A *e = new B();
    cout << e -> m(x); //muestra por pantalla
    return 1;
}
