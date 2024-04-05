```java
import java.io.*;
import java.util.*;
public class Main{
	public static int[] sum = new int[501];	
	public static int[][] DP = new int[501][501];

    public static void main(String[] args) throws IOException{
    	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    	BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

    	int T = Integer.parseInt(br.readLine());
    	StringTokenizer st;

    	for(int i=0;i<T;i++) {
    		int K = Integer.parseInt(br.readLine());
			  st = new StringTokenizer(br.readLine()," ");

    		for(int j=1;j<=K;j++) {
    			sum[j] = sum[j-1] + Integer.parseInt(st.nextToken());
    		}

    		merge(K);	
    	}
    }

    public static void merge(int K) {
    	for(int i=2;i<=K;i++) {		
    		for(int j=i-1;j>=1;j--) {	
    			DP[j][i] = Integer.MAX_VALUE;
    			for(int s=j;s<i;s++) {	
    				DP[j][i] = Math.min(DP[j][i], DP[j][s] + DP[s+1][i]);	
    			}
    			DP[j][i] += sum[i] - sum[j-1];	
    		}
    	}
    }
}
```
