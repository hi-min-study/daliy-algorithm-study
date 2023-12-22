```java
import java.util.*;

class Solution {
    String[] answer = {};
    public String[] solution(String[][] tickets) {
        
        int[] visited = new int[(tickets.length)+1];
        for(int i = 0; i < tickets.length; i++){
            if(tickets[i][0] == "ICN"){
                bfs(tickets,visited);
            }
        }
        return answer;
    }
    
    public void bfs(String[][] tickets, int[] visited){
        visited[0] = 1;
        Queue<String> q = new LinkedList<>();
        q.add(new int[]{tickets[0][0],tickets[0][1]});
        
        while(!q.isEmpty()){
            String[] now = q.remove();
            nowEnd = now[1];
            for(int i = 0; i < tickets.length; i++){
                if(visited[i] == 0 && tickets[i][0] = nowEnd){
                    visited[i] = 1;
                    q.add(new int[]{tickets[i][0],tickets[i][1]});
                }
            }
        }
    }
}
```
