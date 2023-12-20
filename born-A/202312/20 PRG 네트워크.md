```java
class Solution {
    public int solution(int n, int[][] computers) {
        int[] visited = new int[n];
        int answer = 0;

        //노드 다 검사
        for(int i = 0; i < computers.length; i++){
            if(visited[i] == 0){
                answer++;
                dfs(i,computers,visited);
            }
        }
      
        return answer;
    }
    
    public void dfs(int node, int[][] computers, int[] visited){
        //노드 방문처리
        visited[node] = 1;

        //해당 노드의 연결되어있는 부분 탐색 
        for(int i = 0; i < computers.length; i++){
            if(visited[i] == 0 && computers[node][i] == 1){
                dfs(i, computers,visited);
            }
        }
    }
}
```
