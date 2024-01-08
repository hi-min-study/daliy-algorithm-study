```pyhon
from heapq import *


def solution(operations: list) -> list:
    heap = []
    
    for operation in operations:
        # 큐에 숫자 삽입
        if operation[0] == 'I':
            heappush(heap, int(operation[2:]))
        elif heap:
            # 큐에서 최댓값 삭제
            if operation[2] == '1':
                heap.remove(max(heap))
            # 큐에서 최솟값 삭제
            else:
                heappop(heap)

    if heap:
        return [max(heap), heap[0]]
    return [0, 0]
```