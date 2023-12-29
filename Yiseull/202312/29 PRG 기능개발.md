```python
from math import ceil

def solution(progresses, speeds) -> list:
    answer, days = [], []
    
    for i, progress in enumerate(progresses):
        days.append(ceil((100 - progress) / speeds[i]))    
        
    cnt, pre = 0, days[0]
    for day in days:
        if pre < day:
            answer.append(cnt)
            cnt, pre = 1, day
        else:
            cnt += 1
    answer.append(cnt)
    
    return answer
```