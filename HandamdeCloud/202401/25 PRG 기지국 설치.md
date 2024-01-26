```python
def solution(n, stations, w):
    around = 2*w+1
    answer = 0
    cnt = 0
    l = []
    
    for i in stations:
        a,b = i-w, i+w
        if a < 1:
            a = 1
        if b >= n:
            b = n
        l.append([a,b])
        
    l.append([n+1,n+1])
    start = 1
    
    for i in l:
        cnt = i[0] - start
        if cnt > 0:
            if cnt % around == 0:
                answer += cnt // around
            elif cnt > around:
                answer += cnt // around + 1
            else:
                answer += 1
        start = i[1]+1
        
    return answer
    
    

```