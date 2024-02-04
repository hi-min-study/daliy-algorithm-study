```java
import java.util.*;
import java.io.*;

public class Main {
    static int N,M,X;
    static int[] d;
    static int answer = 0;
    static ArrayList<ArrayList<Town>> graph;
 
    static final int INF = Integer.MAX_VALUE;
    
    static class Town implements Comparable<Town>{
        int end;
        int weight;
        
        public class Town(int end, int weight) {
            this.end = end;
            this.weight = weight;
        }
        
        @Override
        public int compareTo(Town t){
            return this.weight - t.weight;
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        
        st = new StringTokenizer(br.readLine());
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        X = Integer.parseInt(st.nextToken());
        
        
        d = new int[N+1];
            
        for (int i = 0; i < M; i++) {
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            int cost = Integer.parseInt(st.nextToken());
            
            graph[a][b] = cost;
            d[a][b]= INF;
        }
        
        bfs();
        for(int i = 1; i <= N; i++) {
            if(answer < d[i]) answer = d[i];
        }
        
        System.out.println(answer); 
    }
   
    
}
```
