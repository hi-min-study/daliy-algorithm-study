```java
import java.util.*;

public class Main {
    static int N;
    static int M;
    static boolean[] visited;
    static int[][] check;
    static int answer = 0;
    
    public static void dfs(int v) {
        if(visited[v]) return;
        
        visited[v] = true;
        
        for (int i = 1; i <= N; i++) {
            if (check[v][i] == 1) {
                dfs(i);
            }
        }
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        N = sc.nextInt();
        M = sc.nextInt();
        visited = new boolean[N + 1];
        check = new int[N+1][N+1];
        
        for (int i = 0; i < M; i++) {
            int x = sc.nextInt();
            int y = sc.nextInt();
            check[x][y] = check[y][x] = 1;
        }
        
        for (int i = 1; i <= N; i++) {
            if(visited[i] == false) {
                dfs(i);
                answer++;
            }
        }
        System.out.println(answer);
    }
    
}
```
