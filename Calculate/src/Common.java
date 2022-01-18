
public class Common {
	int num1;
	int num2;
	int gcf;
	int lcm;

	
	Common(){}
	Common(int num1, int num2){
		this.num1=num1;
		this.num2=num2;
		this.find2Number();
		
	}
	void find2Number(){
	
		for(int i=1; i<num1 && i<num2; i++) {
			if(num1%i==0 && num2%i==0) {
				gcf=i;
				lcm=(num1*num2)/gcf;
			}
		}
		
	}
	void showGCF(){
		
		System.out.println("최대공약수"+gcf);
		
		}
	void showLCM(){
		
		System.out.println("최소공배수"+lcm);
		
	}
}
