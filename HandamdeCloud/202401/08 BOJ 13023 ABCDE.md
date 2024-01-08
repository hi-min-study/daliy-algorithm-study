```python
n,m = map(int,input().split())
graph = [[] for _ in range(n)]
visited = [0] * 2001
ans = 0

for i in range(m):
    a,b = map(int,input().split())
    graph[a].append(b)
    graph[b].append(a)

def dfs(a,depth):
    global ans
    visited[a] = 1
    if depth == 5:
        ans = 1
        return
    for i in graph[a]:
        if not visited[i]:
            dfs(i, depth+1)
    visited[a] = 0

for i in range(n):
    dfs(i,1)
    if ans:
        break
if ans:
    print(1)
else:
    print(0)
```