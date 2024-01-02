```python
from collections import deque


def solution(bridge_length, weight, truck_weights) -> int:
    q = deque()
    q.append((truck_weights[0], bridge_length))
    time, i, weights, n = 1, 1, truck_weights[0], len(truck_weights)
    
    while q:
        if q[0][1] <= time:
            weights -= q.popleft()[0]
        
        if i < n and len(q) + 1 <= bridge_length and weights + truck_weights[i] <= weight:
            q.append((truck_weights[i], time + bridge_length))
            weights += truck_weights[i]
            i += 1
        
        time += 1
        
    return time
```