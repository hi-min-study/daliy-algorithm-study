## 풀이 1️⃣
- 작업 기간을 먼저 계산 다 하고, 각 배포마다 몇 개의 기능이 배포되는지 계산
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

## 풀이 2️⃣
- 작업 기간을 계산하면서 이전의 완료된 기능들 바로 배포
```python
from math import ceil


def solution(progresses: list, speeds: list) -> list:
    answer = []
    q = []
    
    for progress, speed in zip(progresses, speeds):
        deploy = ceil((100 - progress) / speed)
        if q and q[0] < deploy:
            answer.append(len(q))
            q = []
        
        q.append(deploy)
            
    if q:
        answer.append(len(q)) 
            
    return answer
```
