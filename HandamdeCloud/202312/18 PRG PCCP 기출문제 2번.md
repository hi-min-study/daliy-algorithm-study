```

from collections import deque

dx,dy = [0,0,-1,1],[1,-1,0,0]

def solution(land):
    row = len(land)
    col = len(land[0])
    visited = [[False]*col for _ in range(row)]
    result = [0 for _ in range(col)]
    
    for i in range(row):
        for j in range(col):
            if land[i][j] == 1 and not visited[i][j]:
                bfs(i,j,visited,result,land)
    
    return max(result)

def bfs(i :int, j :int, visited :list, result :list, land :list):
    q = deque()
    q.append([i,j])

    labeled = set()
    labeled.add(j)
    
    visited[i][j] = True
    count = 1

    while q:
        x,y = q.popleft()
        for i in range(4):
            nx,ny = dx[i]+x, dy[i]+y
            if 0 <= nx < len(land) and 0<= ny < len(land[0]) and not visited[nx][ny]:
                if land[nx][ny] == 1:
                    q.append([nx,ny])
                    labeled.add(ny)
                    count += 1
                    visited[nx][ny] = True                        

    for i in labeled:
        result[i] += count

```