```java
import java.util.*;

class Solution {
    public int solution(int m, int n, int[][] puddles) {
        int mod = 1000000007;
        int[][] dp = new int[m+1][n+1];
    
        for(int[] k : puddles) {
            int a = k[0];
            int b = k[1];
            dp[a][b] = -1;
        }
        
        dp[1][1] = 1;
        
        for(int i = 1; i < m+1; i++) {
            for(int j = 1; j < n+1; j++) {
                if(dp[i][j] == -1) {
                    continue;
                }
                if(dp[i-1][j] > 0) dp[i][j] += dp[i-1][j] % mod;
                if(dp[i][j-1] > 0) dp[i][j] += dp[i][j-1] % mod;
            }
        }
        return dp[m][n] % mod;
    }
}
```
