```python
'''
1. works를 최대 힙으로 만든다.
2. 힙에서 가장 큰 값을 pop해서 -1한 후, 다시 넣기를 n번 반복한다. -> O(nlogn)
3. 남은 작업량을 제곱해서 더한다.
'''
from heapq import *


def solution(n: int, works: list) -> int:
    heap = []
    for work in works:
        heappush(heap, -work)
        
    for _ in range(n):
        if heap[0] == 0:
            break
        tmp = -heap[0] - 1
        heapreplace(heap, -tmp)
        
    answer = 0
    for remain in heap:
        answer += remain * remain
        
    return answer
```