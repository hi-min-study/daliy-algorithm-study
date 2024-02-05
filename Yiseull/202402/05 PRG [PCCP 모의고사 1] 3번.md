```python
def save_dp(n: int, dp: list) -> list:
    if len(dp) > n:
        return dp[n]
    parent_hybrids = save_dp(n - 1, dp)
    dp.append([])
    for parent_hybrid in parent_hybrids:
        next_hybrid = (parent_hybrid - 1) * 4
        dp[n] += [next_hybrid + 2, next_hybrid + 3]
    return dp[n]
    

def solution(queries: list) -> list:
    answer = []
    dp = [[], [1]]
    for n, p in queries:
        hybrids = save_dp(n, dp)
        if p < hybrids[0]:
            answer.append('RR')
        elif p > hybrids[-1] or p - 1 in hybrids[1:-2:2]:
            answer.append('rr')
        elif p + 1 in hybrids[2::2]:
            answer.append('RR')
        else:
            answer.append('Rr')

    return answer
```