```java
class Solution {
    int cnt = 0;
    
    public int solution(int[] numbers, int target) {
        dfs(numbers,0,target,0);
        return cnt;
    }
    
    void dfs(int[] numbers, int sum, int target, int idx) {
        if(idx == numbers.length) {
            if(sum == target) cnt++;
        }
        
        else {
            dfs(numbers, sum + numbers[idx], target, idx + 1);
            dfs(numbers, sum - numbers[idx], target, idx + 1);
        }
    }   
}
```
