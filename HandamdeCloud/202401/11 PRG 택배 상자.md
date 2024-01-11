```python
def solution(order):
    idx = 0
    cnt = 0    
    box = [i for i in range(1,len(order)+1)]
    n = len(order)
    for i in range(n):
            
        while idx < n and order[i] != box[idx]:
            idx += 1
            
        idx2= idx
        
        while n > idx2 > -1 and n > idx > -1 and (order[i] == box[idx2] or order[i] == box[idx]):
            if order[i] == box[idx2]:
                cnt += 1            
                idx2 -= 1
            elif order[i] == box[idx]:
                cnt += 1
                idx += 1
        
    return cnt
```