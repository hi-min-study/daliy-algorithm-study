```python

def solution(routes):
    start = 30000
    end = -30000
    row = len(routes)
    
    for i,j in routes:
        start = min(i,start)
        end = max(j,end)
    
    
    
    print(start,end,row)
    answer = 0
    return answer
```
