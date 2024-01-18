```python
from collections import deque
import sys
input = sys.stdin.readline


def bfs(mapp: list, n: int, m: int, i: int, j: int) -> None:
    mapp[i][j] = -1
    q = deque()
    q.append((i, j))
    while q:
        y, x = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            next_x = dx + x
            next_y = dy + y
            if -1 < next_x < m and -1 < next_y < n and mapp[next_y][next_x] == 0:
                mapp[next_y][next_x] = -1
                q.append((next_y, next_x))


def check(mapp: list, n: int, m: int, i: int, j: int) -> bool:
    count = 0
    for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
        x = dx + j
        y = dy + i
        if -1 < x < m and -1 < y < n and mapp[y][x] == -1:
            count += 1
    return True if count > 1 else False


def solution(n: int, m: int, mapp: list) -> str:
    answer = 0
    bfs(mapp, n, m, 0, 0)
    while 1:
        melting = []
        for i in range(n):
            for j in range(m):
                if mapp[i][j] == 1 and check(mapp, n, m, i, j):
                    melting.append((i, j))
        if not melting:
            break
        for i, j in melting:
            mapp[i][j] = 0
            bfs(mapp, n, m, i, j)
        answer += 1
    return answer


if __name__ == '__main__':
    n, m = map(int, input().split())
    mapp = [list(map(int, input().split())) for _ in range(n)]
    print(solution(n, m, mapp))
```