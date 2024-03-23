```java
import java.util.Queue;
import java.util.LinkedList;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

class Solution {
    static char[][] map;
    static boolean[][] visited;
    static int[] dx = {0,0,-1,1};
    static int[] dy = {1,-1,0,0};
        
    public static List<Integer> solution(String[] maps) {
        List<Integer> answer = new ArrayList<>();
        map = new char[maps.length][maps[0].length()];
        visited = new boolean[maps.length][maps[0].length()];
        for(int i=0; i<maps.length; i++){
            map[i] = maps[i].toCharArray();
        }
        
        for(int i=0; i <map.length;i++){
            for(int j=0; j <map[i].length;j++){
                if(!visited[i][j] && map[i][j] != 'X'){
                    answer.add(bfs(i,j));
                }
            }
        }
        
        if(answer.size() == 0){
            answer.add(-1);
        }
        Collections.sort(answer);
    
        return answer;
    }
    
    public static int bfs(int x,int y){
        int res = 0;
        Queue<int[]> q = new LinkedList<>();
        q.offer(new int[]{x,y});
        visited[x][y] = true;
        
        while (!q.isEmpty()){
            int[] cur = q.poll();
            int cx = cur[0];
            int cy = cur[1];
            res += map[cx][cy] - '0';
            
            for(int i=0; i<4; i++){
                int nx = cx+dx[i];
                int ny = cy+dy[i];
                
                if(nx < 0 || ny < 0 || nx >= map.length || ny >= map[0].length)
                    continue;
                if(!visited[nx][ny] && map[nx][ny] != 'X'){
                    visited[nx][ny] = true;
                    q.offer(new int[]{nx, ny});
                }
            }
        }
        return res;
    }
}
```