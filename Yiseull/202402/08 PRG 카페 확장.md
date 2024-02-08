```python
from collections import deque


def solution(menu: list, orders: list, k: int) -> int:
    answer, count, time = 0, 0, 0
    q = deque()
    for i in range(len(orders)):
        while q and q[0] <= time:
            q.popleft()
            count -= 1
        if q: q.append(q[-1] + menu[orders[i]])
        else: q.append(time + menu[orders[i]])
        count += 1
        answer = max(answer, count)
        time += k
    
    return answer
```