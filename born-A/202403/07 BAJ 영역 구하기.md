```java
import java.io.*;
import java.util.*;

public class Main {
    static int N, M, K;
    static int[][] graph;
    static int ans;
    static final int[] dx = {-1,0,1,0};
    static final int[] dy = {0,-1,0,1};
    static int count = 0;
    static ArrayList<Integer> areaCount = new ArrayList<>();
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        M = Integer.parseInt(st.nextToken());
        N = Integer.parseInt(st.nextToken());
        K = Integer.parseInt(st.nextToken());
        
        graph = new int[N][M];
        
        for(int i = 0; i < K; i++) {
            st = new StringTokenizer(br.readLine());
            int x1 = Integer.parseInt(st.nextToken());
            int y1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());
            int y2 = Integer.parseInt(st.nextToken());
            
            for(int j = x1; j < x2; j++) {
                for(int p = y1; p < y2; p++) {
                    graph[j][p] = 1;
                }
            }
        }
        
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                if(graph[i][j] == 0) {
                    count = 0;
                    dfs(i, j);
                    areaCount.add(count);
                }
            }
        }
        
        Collections.sort(areaCount);
        
        System.out.println(areaCount.size());
        
        for(int i : areaCount){
            System.out.print(i + " ");
        }
        
    }
    
    static void dfs(int x, int y) {
        graph[x][y] = 1;
        count++;
        
        for(int k = 0; k < 4; k++) {
            int nx = x + dx[k];
            int ny = y + dy[k];
            
            if(nx >= 0 && nx < N && ny >= 0 && ny < M) {
                if(graph[nx][ny] == 0) {
                    dfs(nx, ny);
                }
            }
        }
    }
}
```
