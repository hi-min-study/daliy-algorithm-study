```python
from bisect import bisect_left, bisect_right
import sys
input = sys.stdin.readline


def solution(m: int, n: int, l: int, positions: list, animals: list) -> int:
    positions.sort()
    answer = 0
    for x, y in animals:
        if bisect_right(positions, x - y + l) - bisect_left(positions, x + y - l) > 0:
            answer += 1
    return answer


if __name__ == '__main__':
    m, n, l = map(int, input().split())
    positions = list(map(int, input().split()))
    animals = [list(map(int, input().split())) for _ in range(n)]
    print(solution(m, n, l, positions, animals))
```