```python
'''
1. 건설 비용이 적은 순으로 정렬한다.
2. 건설했을 때 사이클이 생기지 않는 두 섬을 연결한다.
'''
from collections import deque


def exists_cycle(n, graph, start) -> bool:
    visited = [-1] * n
    visited[start] = 0
    q = deque([start])
    while q:
        v = q.popleft()
        for w in graph[v]:
            if visited[w] == -1:
                visited[w] = v
                q.append(w)
            elif visited[v] != w:
                return True
    return False


def solution(n, costs) -> int:
    answer = 0
    graph = [[] for i in range(n + 1)]
    costs.sort(key=lambda x: x[2])
    for cost in costs:
        graph[cost[0]].append(cost[1])
        graph[cost[1]].append(cost[0])
        if not exists_cycle(n, graph, cost[0]):
            answer += cost[2]
        else:
            graph[cost[0]].pop()
            graph[cost[1]].pop()

    return answer
```