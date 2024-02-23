```java
import java.io.*;
import java.util.*;

public class Main {
        static int[][] graph;

        public static void main(String[] args) throws IOException {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
            StringTokenizer st;
            StringBuilder sb = new StringBuilder();
            
            int n = Integer.parseInt(br.readLine());
            graph = new int[n+1][n+1];
            
            for(int i = 1; i <= n; i++) {
                 st = new StringTokenizer(br.readLine());
                for(int j = 1; j <= n; j++) {
                   
                    int t = Integer.parseInt(st.nextToken());
                    graph[i][j] = t;
                }
            }
          
            for(int k = 1; k <= n; k++) {
                for(int i = 1; i <= n; i++) {
                    for(int j = 1; j <= n; j++) {
                        if(graph[i][k] == 1 && graph[k][j] == 1) {
                            graph[i][j] = 1;
                        }
                    }
                }
            }
            
            for(int i = 1; i <= n; i++) {
                for(int j = 1; j <= n; j++) {
                    sb.append(graph[i][j] + " ");
                }
                sb.append("\n");
            }
            
            bw.write(sb.toString());
            bw.flush();
            bw.close();
            br.close();
    
    }
}
```
