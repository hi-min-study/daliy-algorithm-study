```java

import java.util.*;

class Solution {
    
    boolean[][] visit;
    int[][] landIdx; 
    int[] idxToR;
    
    int[] dy = {-1, 0, 1, 0};
    int[] dx = {0, 1, 0, -1};
    
    int n, m;
    
    class Node {
        public int y;
        public int x;
        
        public Node(int y, int x){
            this.y = y;
            this.x = x;
        }
    }
    
    public boolean isRange(int y, int x) {
        return -1 < y && y < n && -1 < x && x < m;
    }
    
    public int bfs(int[][] land, int y, int x, int idx) {
        landIdx[y][x] = idx;
        
        Queue<Node> que = new LinkedList<Node>();
        que.add(new Node(y, x));
        
        int ret = 1;
        visit[y][x] = true;
        landIdx[y][x] = idx;

        while(que.size() !=0 ) {
            var no = que.poll();
            
            for(int i=0; i<4; i++) {
                
                int ny = no.y + dy[i];
                int nx = no.x + dx[i];
                
                if(!isRange(ny, nx)) {
                    continue;
                }
                
                if(visit[ny][nx]) {
                    continue;
                }
                
                if(land[ny][nx] == 0) {
                    continue;
                }
                
                ret += 1;
                que.add(new Node(ny, nx));
                visit[ny][nx] = true;
                landIdx[ny][nx] = idx;
            }
        }
        
        return ret;
    }
    
    public int solution(int[][] land) {
        int answer = 0;
        n = land.length;
        m = land[0].length;
        
        visit = new boolean[n][m];
        landIdx = new int[n][m];
        idxToR = new int[m*m+1];
        
        int idx = 1;
        for(int y=0; y<n; y++) {
            for(int x=0; x<m; x++) {
                if(visit[y][x]) {
                    continue;
                }
                
                if(land[y][x] == 0) {
                    continue;
                }
                
                int r = bfs(land, y,x,idx);
                idxToR[idx] = r;
                idx+=1;
            }
        }
        
        int max = 0;
        for(int x=0; x<m; x++) {
            Set<Integer> set = new HashSet<>();
            int amount = 0;
            for(int y=0; y<n; y++) {
                int i = landIdx[y][x];
                if(set.contains(i)) {
                    continue;
                }
                set.add(i);
                int r = idxToR[i];
                amount += r;
            }
            max = amount > max ? amount : max;
        }
        
        
        return max;
    }
}

```