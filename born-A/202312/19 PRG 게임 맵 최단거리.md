```java
import java.util.*;

class Solution {
    //상,하,좌,우 이동
    int[] dx = {0,0,-1,1};
    int[] dy = {-1,1,0,0};
    
    
    public int solution(int[][] maps) {
        int answer = 0;
        
        int[][] visited = new int[maps.length][maps[0].length];
        bfs(maps,visited);
        answer = visited[maps.length-1][maps[0].length-1];
        
        if(answer == 0){
            answer = -1;
        }
        
        return answer;
    }
    
    public void bfs(int[][] maps, int[] visited[]){
        int x = 0;
        int y = 0;
        
        //0,0 방문처리
        visited[x][y] = 1;
        
        Queue<int[]> q = new LinkedList<>();
        //큐에 첫 시작 좌표 삽입
        q.add(new int[]{x,y});
        
        while(!q.isEmpty()){
            int[] now = q.remove();
            int nx = now[0];
            int ny = now[1];
            
            for(int i = 0; i < 4; i++){
                int cx = nx + dx[i];
                int cy = ny + dy[i];
                
                if(cx < 0 || cx > maps.length-1 || cy < 0 || cy > maps[0].length-1){
                    continue;
                }
                if((maps[cx][cy] == 1) && (visited[cx][cy] == 0)){
                    visited[cx][cy] = visited[nx][ny] + 1;
                    q.add(new int[]{cx,cy});
                }
            }
        }
        
    }
}
```
