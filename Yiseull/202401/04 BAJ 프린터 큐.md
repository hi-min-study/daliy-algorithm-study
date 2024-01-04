```python
from heapq import *
from collections import deque
import sys
input = sys.stdin.readline


def solution(n, m, importance) -> int:
    heap = []
    queue = deque()

    for i, imp in enumerate(importance):
        heappush(heap, (-imp))
        queue.append((imp, i))

    count = 1
    while 1:
        if -heap[0] == queue[0][0]:
            if queue[0][1] == m:
                return count
            heappop(heap)
            queue.popleft()
            count += 1
        else:
            queue.append(queue.popleft())


if __name__ == '__main__':
    for _ in range(int(input())):
        n, m = map(int, input().split())
        importance = tuple(map(int, input().split()))
        print(solution(n, m, importance))
```