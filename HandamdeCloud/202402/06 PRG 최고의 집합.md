```python
def solution(n, s):
    som = 0
    if n > s:
        return [-1]
    
    a,b = divmod(s,n)
    res = [a]*n
    
    for i in range(s%n):
        res[-i-1] += 1
    
    return res
```