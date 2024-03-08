```java
import java.util.*;
import java.io.*;

public class Main {
    static int[][] graph;
    static boolean[][] visited;
    static int n;
    static int count;
    static ArrayList<Integer> areaCount = new ArrayList<>();
    static int[] dx = {-1,0,1,0};
    static int[] dy = {0,1,0,-1};
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        n = Integer.parseInt(br.readLine());
        graph = new int[n+1][n+1];
        visited = new boolean[n+1][n+1];
        for(int i = 0; i < n; i++) {
            String str = br.readLine();
            for(int j = 0; j < n; j++) {
                graph[i][j] = str.charAt(j)-'0';
            }
        }
        
        for(int i = 0; i < n; i++) {
            for(int j= 0; j < n; j++) {
                if(graph[i][j] == 1 && !visited[i][j]) {
                    dfs(i, j);
                    areaCount.add(count);
                    count = 0;
                }
            }
        }
        Collections.sort(areaCount);
        System.out.println(areaCount.size());
        for(int i : areaCount) {
            System.out.println(i);
        }
    }
    
    static void dfs(int x, int y) {
        count++;
        visited[x][y] = true;
        
        for(int i = 0; i < 4; i++){
            int nx = x + dx[i];
            int ny = y + dy[i];
            
            if(nx >= 0 && nx < n && ny >=0 && ny < n) {
                if(graph[nx][ny] == 1 && !visited[nx][ny]) {
                    dfs(nx,ny);
                }
            }
        }
    }
}
```
