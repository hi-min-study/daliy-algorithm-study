```java
import java.io.*;
import java.util.*;

public class Main {
    static final int INF = Integer.MAX_VALUE / 4;
    
    static int[] dirX = {0,0,-1,1};
    static int[] dirY = {-1,1,0,0};
    static boolean[][] visited;
    static int[][] graph;
    static int[][] d;
    
    static int N;
   
    static class Node implements Comparable<Node> {
        int x;
        int y;
        int distance;
        
        public Node(int x, int y, int distance) {
            this.x = x;
            this.y = y;
            this.distance = distance;
        }
        
        @Override
        public int compareTo(Node o) {
            return distance - o.distance;
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();
        int count = 1;
        
        String temp = "";
        while(!(temp = br.readLine()).isEmpty()) {
            N = Integer.parseInt(temp);
            if(N == 0) {
                break;
            }
            graph = new int[N][N];
            visited = new boolean[N][N];
            d = new int[N][N];
            
            for(int i = 0; i < N; i++) {
                st = new StringTokenizer(br.readLine());
                
                for(int j = 0; j < N; j++) {
                    graph[i][j] = Integer.parseInt(st.nextToken());
                    // 초기화
                    d[i][j] = INF;
                }
            }
            
            bfs(0, 0, graph[0][0]);
            sb.append("Problem " + count + ": " + d[N-1][N-1]).append('\n');
            count++;
        }
        System.out.println(sb);
    }
    
    static void bfs(int x, int y, int distance) {
        PriorityQueue<Node> q = new PriorityQueue<>();
        visited[x][y] = true;
        q.offer(new Node(x,y,distance));
        
        while(!q.isEmpty()) {
            Node node = q.poll();
            
            for(int i = 0; i < 4; i++) {
                int nowX = node.x + dirX[i];
                int nowY = node.y + dirY[i];
                
                if(in_range(nowX, nowY) && !visited[nowX][nowY] && d[nowX][nowY] > (graph[nowX][nowY] + node.distance))  {
                    d[nowX][nowY] = graph[nowX][nowY] + node.distance;
                    visited[nowX][nowY] = true;
                    q.offer(new Node(nowX, nowY, d[nowX][nowY]));
                }
            }
        }
    }
    
    static boolean in_range(int x, int y) {
        return (x >= 0 && y >= 0 && x < N && y < N);
    }
}
```
