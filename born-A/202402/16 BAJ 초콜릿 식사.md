```java
import java.io.*;

public class Main {
	public static void main(String[] args) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int k = Integer.parseInt(br.readLine());
		int size = 1;
		int size2 = 0;
		int count = 0;
		
		while(size < k){
			size *= 2;
			size2 = size;
		}
		
		while(k > 0){
			if(k < size){
				size /= 2;
				count++;
			}
			else{
				k -= size;
			}
		}
		
		System.out.println(size2+" "+count);
	}
}

```
