```java
import java.util.*;

class Solution {
    public int solution(int[][] routes) {    
        Arrays.sort(routes, (o1, o2) -> {        
            if (o1[1] < o2[1]) return -1;        
            else if (o1[1] > o2[1]) return 1;        
            else return o1[0] - o2[0];    
        });   
        
        int answer = 0;    
        int cam = -30001; 
        
        for (int[] route : routes) {        
            int in = route[0], out = route[1];    
            
            if (in > cam || cam > out) {            
                answer++;            
                cam = out;        
            }    
        }   
        
        return answer;
    }
}
```
