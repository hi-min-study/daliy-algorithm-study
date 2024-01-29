```java
import java.util.*;

public class Main {
    static int num, p1, p2;
    static int[][] graph;
    static int[] d;
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        num = sc.nextInt();
        p1 = sc.nextInt();
        p2 = sc.nextInt();
        int n = sc.nextInt();
        graph = new int[num+1][num+1];
        d = new int[num + 1];
        
        for(int i = 0; i < n; i++) {
            int x = sc.nextInt();
            int y = sc.nextInt();
            
            graph[x][y] = graph[y][x] = 1;
        }
        bfs(p1,p2);
        
        if(d[p2] == 0) {
            System.out.println(-1);
        } else {
            System.out.println(d[p2]);
        }
    }
    
    private static void bfs(int start, int end) {
		Queue<Integer> q = new LinkedList<>();
		q.add(start);
        
		while (!q.isEmpty()) {
			int v = q.poll();
            if (v==end)break;
            
			for (int i = 1; i <= num; i++) {
				if (graph[v][i] == 1 && d[i] == 0) {
					d[i] = d[v] + 1;
					q.add(i);
				}
			}
		}
	}
}
```
