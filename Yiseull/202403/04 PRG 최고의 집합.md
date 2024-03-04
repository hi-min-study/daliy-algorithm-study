```python
def solution(n: int, s: int) -> list:
    if s < n:
        return [-1]
    
    answer = [0] * n
    for i in range(n, 0, -1):
        tmp = s // i
        answer[n - i] = tmp
        s -= tmp
        
    return answer
```