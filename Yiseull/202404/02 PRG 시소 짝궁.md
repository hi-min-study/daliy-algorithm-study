```PYTHON
import java.util.HashMap;


class Solution {
    public long solution(int[] weights) {
        long answer = 0;
        HashMap<Long, Long> counter = new HashMap<>();
        
        for (long weight : weights) {
            counter.put(weight, counter.getOrDefault(weight, 0L) + 1);
        }
        
        for (long i : counter.keySet()) {
            long count = counter.get(i);
            answer += (count * (count - 1) / 2);
            answer += count * counter.getOrDefault(((i * 3 / 2), 0L);
            answer += count * counter.getOrDefault(i * 2, 0L);
            answer += count * counter.getOrDefault((i * 4 / 3), 0L);
        }
        
        return answer;
    }
}
```