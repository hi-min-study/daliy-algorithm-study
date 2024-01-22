```java
import java.util.*;

public class Main {
	static int[] arr;
	static boolean[] v;
	static int n;
    
	public static int dfs(int i) {
		if(i == arr[i] || v[i]) 
            return 1;
		
		v[i] = true;
        
		return dfs(arr[i]);
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int tc = sc.nextInt(), cnt;
		
		for(int i = 0; i < tc; i++) {
			n = sc.nextInt(); cnt =0;
			arr = new int[n+1]; v = new boolean[n+1];

			for(int j = 1; j < n+1; j++)
				arr[j] = sc.nextInt();
			
			for(int j = 1; j < n+1; j++) {
				if(!v[j]) cnt += dfs(j);
			}

			System.out.println(cnt);
		}
	}
}
```
