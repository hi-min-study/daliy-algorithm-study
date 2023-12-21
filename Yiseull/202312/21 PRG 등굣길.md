```python
def solution(m, n, puddles) -> int:
    map = [[1] * m for _ in range(n)]
    
    for x, y in puddles:
        map[y - 1][x - 1] = 0
        if x == 1:
            for i in range(y, n):
                map[i][0] = 0
        if y == 1:
            for j in range(x, m):
                map[0][j] = 0
        
    for i in range(1, n):
        for j in range(1, m):
            if map[i][j]:
                map[i][j] = map[i][j - 1] + map[i - 1][j]
                
    return map[n - 1][m - 1] % 1000000007
```