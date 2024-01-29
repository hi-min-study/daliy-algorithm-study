```python

def solution(n, times):
    
    reverse = sorted(times,reverse=True)
    times.sort()
    l = []
    e_time = sum(times)
    
    for i in range(len(times)):
        k = math.trunc(n*reverse[i]/e_time)
        l.append(k)
            
    remain = n-sum(l)

    for i in range(len(times)):
        l[i] *= times[i]
    
    l[remain-1] += times[remain-1]
    answer = max(l)
    
    return answer

```