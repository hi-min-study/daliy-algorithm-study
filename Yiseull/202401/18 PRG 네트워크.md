```python
from collections import deque


def bfs(start: int, computers: list, visited: list) -> None:
    q = deque([start])
    while q:
        v = q.popleft()
        for i, w in enumerate(computers[v]):
            if w == 1 and not visited[i]:
                visited[i] = True
                q.append(i)


def solution(n: int, computers: list) -> int:
    answer = 0
    visited = [False] * n
    for i in range(n):
        if not visited[i]:
            visited[i] = True
            bfs(i, computers, visited)
            answer += 1
    return answer
```