```python
from heapq import *
import sys
input = sys.stdin.readline


def dijkstra(n: int, graph: list, start: int) -> list:
    q = []
    heappush(q, (0, start))
    distance = [1e9] * (n + 1)
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
    return distance


def solution(n: int, graph: list, v1: int, v2: int) -> int:
    distance = dijkstra(n, graph, 1)
    distance2 = dijkstra(n, graph, v1)
    distance3 = dijkstra(n, graph, n)
    answer = min(distance[v1] + distance2[v2] + distance3[v2], distance[v2] + distance2[v2] + distance3[v1])
    if answer >= 1e9:
        return -1
    return answer


if __name__ == '__main__':
    n, e = map(int, input().split())
    graph = [[] for _ in range(n + 1)]
    for _ in range(e):
        a, b, c = map(int, input().split())
        graph[a].append((b, c))
        graph[b].append((a, c))
    v1, v2 = map(int, input().split())
    print(solution(n, graph, v1, v2))
```