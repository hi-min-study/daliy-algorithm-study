```python
from heapq import *
import sys
input = sys.stdin.readline


def dijkstra(n: int, graph: list, start: int) -> int:
    q = []
    heappush(q, (0, start))
    distance = [sys.maxsize] * n
    distance[start] = 0
    while q:
        dist, now = heappop(q)
        if distance[now] < dist:
            continue
        for i in graph[now]:
            cost = dist + i[1]
            if cost < distance[i[0]]:
                heappush(q, (cost, i[0]))
                distance[i[0]] = cost
    return distance[n - 1]


def solution(n: int, graph: list) -> int:
    result = dijkstra(n, graph, 0)
    return result if result != sys.maxsize else -1


if __name__ == '__main__':
    n, m = map(int, input().split())
    a = list(map(int, input().split()))
    a[-1] = 0
    graph = [[] for _ in range(n)]
    for _ in range(m):
        b, c, t = map(int, input().split())
        if a[b] or a[c]:
            continue
        graph[b].append((c, t))
        graph[c].append((b, t))
    print(solution(n, graph))
```