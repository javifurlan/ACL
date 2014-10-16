package ej8;

public class Par {
	private int x,y;
	
	private static int  id=0;
	
	public Par(){
		x=0;
		y=0;
		id++;
	}
	
	public Par(int n,int m){
		x=n;
		y=m;
		id++;
	}
	
	private int getFirstComponent() {
		return this.x;		
	}
	
	private int getSecondComponent(){
		return this.y;
	}
	
	private void setFirstComponent(int n){
		this.x=n;
	}
	
	private void setSecondComponent(int n){
		this.y=n;
	}
	
	public void finalize(){
		
		System.out.println("objeto eliminado n°"+this.id);
	} 
		
	public int getId(){
		return this.id;
	}
}
