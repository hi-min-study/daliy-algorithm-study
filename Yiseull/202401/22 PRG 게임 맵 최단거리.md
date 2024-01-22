```python
from collections import deque


def solution(maps: list) -> int:
    n, m = len(maps), len(maps[0])
    q = deque([(0, 0)])
    visited = [[-1] * m for _ in range(n)]
    visited[0][0] = 1
    while q:
        y, x = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            next_x = dx + x
            next_y = dy + y
            if -1 < next_x < m and -1 < next_y < n and maps[next_y][next_x] == 1 and visited[next_y][next_x] == -1:
                visited[next_y][next_x] = visited[y][x] + 1
                if next_x == m - 1 and next_y == n - 1:
                    return visited[n - 1][m - 1]
                q.append((next_y, next_x))
        
    return -1
```