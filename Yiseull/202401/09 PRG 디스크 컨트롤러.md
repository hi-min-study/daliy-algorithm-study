```python
from heapq import *


def solution(jobs: list) -> int:
    jobs.sort(key=lambda x: (x[0], x[1]))
    answer = jobs[0][1]
    now = jobs[0][0] + jobs[0][1]
    i = 1
    heap = []

    while i < len(jobs):
        if jobs[i][0] <= now:
            heappush(heap, (jobs[i][1], jobs[i][0]))
            i += 1
            continue

        while heap and jobs[i][0] > now:
            now += heap[0][0]
            answer += now - heap[0][1]
            heappop(heap)

        if not heap and jobs[i][0] > now:
            now = jobs[i][0] + jobs[i][1]
            answer += jobs[i][1]
            i += 1
            continue

    while heap:
        now += heap[0][0]
        answer += now - heap[0][1]
        heappop(heap)

    return answer // len(jobs)
```