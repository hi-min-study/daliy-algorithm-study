```java
class Solution {
    int cnt = 0;
    boolean[] visited;
    public int solution(int n, int[][] computers) {
        visited = new boolean[computers.length];
        
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < n; j++) {
                if(computers[i][j] == 1 && !visited[i]) {
                    cnt++;
                    dfs(i, computers);
                }
            }
        }
      
        return cnt;
    }
    
    public void dfs(int n, int[][] computers) {
        visited[n] = true;
        
        for(int i = 0; i < computers.length; i++) {
            if(computers[n][i] == 1 && !visited[i]) {
                dfs(i, computers);
            }
        }
    }
}
```
