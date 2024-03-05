```java
import java.util.*;
import java.io.*;

public class Solution {
	static int maxIndex = 100;
	static int[][] arr = new int[maxIndex][maxIndex];
	
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
  
        for(int i = 0; i < 4; i++) {
        	StringTokenizer st = new StringTokenizer(br.readLine());
	        int x1 = Integer.parseInt(st.nextToken());
	        int y1 = Integer.parseInt(st.nextToken());
	        int x2 = Integer.parseInt(st.nextToken());
	        int y2 = Integer.parseInt(st.nextToken());
	        
	        Square(x1,y1,x2,y2);
        }
        
        System.out.println(sum());
    }
    
    public static void Square(int x1, int y1, int x2, int y2) {
    	for(int i = x1; i < x2; i++) {
    		for(int j = y1; j < y2; j++) {
    			arr[i][j] = 1;
    		}
    	}
    }
    
    public static int sum() {
    	int sum = 0;
        for(int i = 0; i < maxIndex; i++) {
        	for(int j = 0; j < maxIndex; j++) {
        		sum += arr[i][j];
        	}
        }
        return sum;
    }
}
```
