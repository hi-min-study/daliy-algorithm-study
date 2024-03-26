```python
from heapq import *


def solution(scoville: list, k: int) -> int:
    answer = 0
    heapify(scoville)
    
    while scoville[0] < k and len(scoville) > 1
        answer += 1
        heappush(scoville, heappop(scoville) + heappop(scoville) * 2)
    
    return -1 if scoville[0] < k else answer
```