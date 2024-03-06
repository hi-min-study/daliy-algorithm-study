```python
def solution(n, money):
    dp = [0] * (n+1)
    dp[0] = 1
    
    for m in money:
        for c in range(m, n+1):
            if c >= m:
                dp[c] += dp[c - m]
                
    return dp[n] % 10000000007
```