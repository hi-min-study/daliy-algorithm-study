```java
class Solution {
    int answer = 0;

    public int solution(int m, int n, int[][] puddles) {
        int[][] dp = new int[m+1][n+1];
        dp[1][1] = 1;

        for(int i=0; i<puddles.length; i++){
            dp[puddles[i][0]][puddles[i][1]] = -1;
        }

        for(int i = 1; i < m+1; i++){
            for(int j = 1; j< n+1; j++){
                if (dp[i][j] == -1) continue;
                if(dp[i][j-1] > 0) {
                    dp[i][j] += dp[i][j-1] % 1000000007;
                }
                if(dp[i-1][j] >0){
                    dp[i][j] += dp[i-1][j] % 1000000007;
                }
            }
        }

        answer = dp[m][n] % 1000000007;

        return answer;
    }
}
```
