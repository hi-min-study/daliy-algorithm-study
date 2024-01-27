```java
import java.util.*;

public class Main {
    
    static int n;
    static int m;
    static boolean[] visited;
    static int[][] checked;
    static int answer = 0;
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();
        
        visited = new boolean[n+1];
        checked = new int[n+1][n+1];
        
        for (int i = 1; i <= m; i++) {
            int x = sc.nextInt();
            int y = sc.nextInt();
            
            checked[x][y] = checked[y][x] = 1;
        }
        
        dfs(1);
        System.out.println(answer);
    }
    
    public static void dfs(int v) {
        visited[v] = true;
        
        for (int i = 1; i <= n; i++) {
            if(checked[v][i] == 1 && !visited[i]) {
                answer++;
                dfs(i);
            }
        }
    }
}
```
