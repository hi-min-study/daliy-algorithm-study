```java
import java.util.*;

class Solution {

    List<String> pathList = new ArrayList<>();
    boolean[] visited;

    public String[] solution(String[][] tickets) {
        visited = new boolean[tickets.length];
        dfs(tickets, "ICN", 0, "ICN");
        Collections.sort(pathList);

        return pathList.get(0).split(" ");
    }

    private void dfs(String[][] tickets, String currentCity, int cnt, String path) {
        if(cnt == tickets.length) {
            pathList.add(path);
            return;
        }

        for(int i = 0; i < tickets.length; i++) {
            if(!visited[i] && currentCity.equals(tickets[i][0])) {
                visited[i] = true;
                dfs(tickets, tickets[i][1], cnt + 1, path + " " + tickets[i][1]);
                visited[i] = false;
            }
        }
    }
}
```
