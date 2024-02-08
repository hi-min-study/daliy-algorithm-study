```java
import java.io.*;
import java.util.*;

public class Main {
	public static void main(String[] args) throws IOException{
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		int n=Integer.parseInt(br.readLine());
		int cnt=0;
		ArrayList<Integer> list=new ArrayList<Integer>();
		
		StringTokenizer st=new StringTokenizer(br.readLine());
		
		for(int i=0; i<n; i++){
			list.add(Integer.parseInt(st.nextToken()));
		}

		Collections.sort(list);
		
		while(true)
		{
			if(list.size()<=1)
				break;
			list.set(0, list.get(0)-1);
			list.remove(list.size()-1);

			if(list.get(0)==0)
				list.remove(0);
			
			cnt++;
		}
		
		System.out.println(cnt);
	}
}
```
