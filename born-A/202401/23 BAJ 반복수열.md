```java
import java.util.*;
import java.io.*;

public class Main {
	public static void main(String[] args) throws IOException {
		Scanner sc=new Scanner(System.in);
		
		int a=sc.nextInt();
		int p=sc.nextInt();	
		ArrayList<Integer> list=new ArrayList<>(); 
		HashSet<Integer> set=new HashSet<>();

		list.add(a);
		set.add(a);
		
		while(true) {
			int num=makeNum(a, p);

			if(set.contains(num)) {
				System.out.println(list.indexOf(num));
				break;
			}

			set.add(num);
			list.add(num);
			a=num;
		}
	}
	
	public static int makeNum(int a, int p) {
		int sum=0;

		while(a>0) {
			sum += Math.pow(a%10, p);
			a /= 10;
		}
		
		return sum;
	}
}
```
