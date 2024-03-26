```java
import java.util.*;

class Solution {
    public String solution(String s) {
        String[] ss = s.split(" ");
        int[] val = Arrays.stream(ss)
            .mapToInt(Integer::parseInt)
            .toArray();
    
        int min = Arrays.stream(val).min().getAsInt();
        int max = Arrays.stream(val).max().getAsInt();
        
        return min + " " + max;
    }
}
```