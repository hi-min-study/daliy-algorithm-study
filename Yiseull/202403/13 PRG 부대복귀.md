```python
from heapq import *


def dijkstra(n: int, start: int, road_infos: list) -> list:
    q = []
    heappush(q, (0, start))
    distance = [1e9] * (n + 1)
    distance[start] = 0
    while q:
        dist, now = heappop(q)
        if distance[now] < dist:
            continue
        for road in road_infos[now]:
            cost = dist + 1
            if cost < distance[road]:
                distance[road] = cost
                heappush(q, (cost, road))
                
    return distance


def solution(n: int, roads: list, sources: list, destination: int) -> list:
    road_infos = [[] for _ in range(n + 1)]
    for road in roads:
        road_infos[road[0]].append(road[1])
        road_infos[road[1]].append(road[0])
    distance = dijkstra(n, destination, road_infos)
    
    return [distance[source] if distance[source] != 1e9 else -1 for source in sources]
```
