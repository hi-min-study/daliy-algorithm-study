```python
'''
처리 가능한 작업 중에 소요시간이 가장 작은 작업을 선택한다.
'''
from heapq import *


def solution(jobs: list) -> int:
    answer, current = 0, 0
    heap = []
    for job in sorted(jobs):
        while heap and current < job[0]:
            current = max(current, heap[0][1])
            answer += current + heap[0][0] - heap[0][1]
            current += heappop(heap)[0]
        heappush(heap, (job[1], job[0]))
        
    while heap:
        current = max(current, heap[0][1])
        answer += current + heap[0][0] - heap[0][1]
        current += heappop(heap)[0]
            
    return answer // len(jobs)
```