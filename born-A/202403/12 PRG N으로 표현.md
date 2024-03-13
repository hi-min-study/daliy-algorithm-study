```java
import java.util.*;

public class Solution {
    
    public int solution(int N, int number) {
        if(N == number) return 1;
        
        List<Set<Integer>> list = new ArrayList<>();
        for(int i = 0; i < 9; i++) {
            list.add(new HashSet<>());
        }
        
        list.get(1).add(N);
        
        for(int i = 2; i < 9; i++) {
            for(int j = 1; j <= i/2; j++) {
                unionSet(list.get(i), list.get(j), list.get(i-j));
                unionSet(list.get(i), list.get(i-j), list.get(j));
            }
            String numS = Integer.toString(N);
            list.get(i).add(Integer.parseInt(numS.repeat(i)));
            
            for(int a : list.get(i)) {
                 if(a == number) return i;
            }
        
        }
        return -1;
    }
    
    public void unionSet(Set<Integer> result, Set<Integer> a, Set<Integer> b){
        for(int i : a) {
            for(int j : b) {
                result.add(i+j);
                result.add(i-j);
                result.add(i*j);
                if(j != 0) {
                    result.add(i/j);
                }
            }
        }
    }
}
```
