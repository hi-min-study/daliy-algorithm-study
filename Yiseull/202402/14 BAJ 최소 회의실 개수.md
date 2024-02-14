```python
from heapq import *
import sys
input = sys.stdin.readline


def solution(n: int, meetings: list) -> int:
    answer, room = 0, 0
    ongoing = []
    meetings.sort()
    for meeting in meetings:
        while ongoing and ongoing[0] <= meeting[0]:
            heappop(ongoing)
            room += 1
        if room == 0:
            answer += 1
            room += 1
        heappush(ongoing, meeting[1])
        room -= 1

    return answer


if __name__ == '__main__':
    n = int(input())
    meetings = [tuple(map(int, input().split())) for _ in range(n)]
    print(solution(n, meetings))
```