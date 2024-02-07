```java
import java.util.*;
import java.io.*;

public class Main {
    static class Town implements Comparable<Town> {
        int end;
        int weight;
        
        public Town(int end, int weight) {
            this.end = end;
            this.weight = weight;
        }
        
        @Override
        public int compareTo(Town t) {
            return this.weight - t.weight;
        }
    }
    
    static int N, M, X;
    static int INF = Integer.MAX_VALUE;
    static ArrayList<ArrayList<Town>> arr, reverse_arr;
    static int[] d, reverse_d;
    static int answer = 0;
    static boolean[] visited;
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        X = Integer.parseInt(st.nextToken());
        
        arr = new ArrayList<>(); 
        reverse_arr = new ArrayList<>();
 
        for (int i = 0; i <= N; i++) {
            arr.add(new ArrayList<>());
            reverse_arr.add(new ArrayList<>());
        }
        
        for(int i = 0; i < M; i++) {
            st = new StringTokenizer(br.readLine());
            int start = Integer.parseInt(st.nextToken());
            int end = Integer.parseInt(st.nextToken());
            int weight = Integer.parseInt(st.nextToken());
            
            arr.get(start).add(new Town(end, weight));
            reverse_arr.get(end).add(new Town(start, weight));
        }
        
        d = dijkstra(arr);
        reverse_d = dijkstra(reverse_arr);
        
        for(int i = 1; i < N + 1; i++) {
            answer = Math.max(answer, d[i] + reverse_d[i]);
        }
        
        System.out.println(answer);
    }
    
    static int[] dijkstra(ArrayList<ArrayList<Town>> list) {
        PriorityQueue<Town> q = new PriorityQueue<>();
        //목적지가 X 이므로
        q.offer(new Town(X,0));
        int[] dist = new int[N + 1];
        Arrays.fill(dist,INF);
        dist[X] = 0;
        visited = new boolean[N + 1];
        
        while(!q.isEmpty()) {
            Town t = q.poll();
            int cur = t.end;
            
            if(!visited[cur]) {
                visited[cur] = true;
                
                for(Town a : list.get(cur)) {
                    if(!visited[a.end] && dist[a.end] > dist[cur] + a.weight) {
                        dist[a.end] = dist[cur] + a.weight;
                        q.add(new Town(a.end, dist[a.end]));
                    }
                }
            }
        }
        
        return dist;
    }
}
```
