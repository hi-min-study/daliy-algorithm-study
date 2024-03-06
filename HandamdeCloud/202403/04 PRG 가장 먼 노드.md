```python
from collections import deque,defaultdict

def solution(n, vertex):
    
    graph = defaultdict(list)
    visited = [0] * (n+1)
    
    for edge in vertex:
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    
    def bfs():
        q = deque([1])
        visited[1] = 1
        
        while q:
            v = q.popleft()
            
            for i in graph[v]:
                if visited[i] == 0:
                    visited[i] = visited[v] + 1
                    q.append(i)
                    
        return visited.count(max(visited))

    return bfs()
```