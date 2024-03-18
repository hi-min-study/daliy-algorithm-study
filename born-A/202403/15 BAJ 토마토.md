```java
import java.util.*;
import java.io.*;

public class Main{
    static int N, M;
    static int[][] map;
    static Queue<Tomato> q = new LinkedList<Tomato>();
    static int[] dx = {-1,0,1,0};
    static int[] dy = {0,-1,0,1};
    
    static class Tomato {
        int x;
        int y;
        int day;
        
        public Tomato(int x, int y, int day) {
            this.x = x;
            this.y = y;
            this.day = day;
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        
        map = new int[N][M];
        
        for(int i = 0; i < M; i++) {
            st = new StringTokenizer(br.readLine());
            for(int j = 0; j < N; j++){
                map[j][i] = Integer.parseInt(st.nextToken());
                if(map[j][i] == 1) {
                    q.offer(new Tomato(j,i,0));
                }
                
            }
        }
        
        bfs();
    }
    
    static void bfs() {
        int day = 0;
        while(!q.isEmpty()) {
            Tomato t = q.poll();
            int x1 = t.x;
            int y1 = t.y;
            day = t.day;
            
            for(int i = 0; i < 4; i++) {
                int nx = x1 + dx[i];
                int ny = y1 + dy[i];
                
                if(nx >= 0 && nx < N && ny >=0 && ny < M) {
                    if(map[nx][ny] == 0) {
                        map[nx][ny] = 1;
                        q.offer(new Tomato(nx,ny,day+1));
                    }
                }
            }
        }
        
        if(checkTomato()){
            System.out.println(day);
        } else {
            System.out.println(-1);
        }
    }
    
    static boolean checkTomato(){
        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                if(map[i][j] == 0) {
                    return false;
                } 
            }
        }
        return true;
    }
}
```
