```python
def solution(arr) -> int:
    n = len(arr) // 2 + 1
    max_dp = [[-1e9] * n for _ in range(n)]
    min_dp = [[1e9] * n for _ in range(n)]
    
    for i in range(n):
        max_dp[i][i] = min_dp[i][i] = int(arr[i * 2])
        
    for step in range(1, n):
        for i in range(n - step):
            j = i + step
            
            for k in range(i, j):
                if arr[k * 2 + 1] == '+':
                    max_dp[i][j] = max(max_dp[i][j], max_dp[i][k] + max_dp[k + 1][j])
                    min_dp[i][j] = min(min_dp[i][j], min_dp[i][k] + min_dp[k + 1][j])
                else:
                    max_dp[i][j] = max(max_dp[i][j], max_dp[i][k] - min_dp[k + 1][j])
                    min_dp[i][j] = min(min_dp[i][j], min_dp[i][k] - max_dp[k + 1][j])
                    
    return max_dp[0][n - 1]
```