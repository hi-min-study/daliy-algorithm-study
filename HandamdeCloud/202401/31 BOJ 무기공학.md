```python
n,m = map(int,input().split())
l = [list(map(int,input().split())) for _ in range(n)]
visited = [[0]*m for _ in range(n)]
res = 0

# 범위가능 검색 : 각 메소드 내부에서
# 방문처리 : 각 메소드 내부

def upright(x,y,visited) -> bool:
    if x - 1 < 0 or  y + 1 == m:
        return False
    if visited[x][y] or visited[x-1][y] or visited[x][y+1]:
        return False
    visited[x][y] = 1
    visited[x-1][y] = 1
    visited[x][y+1] = 1
    return True

def downright(x,y,visited) -> bool:
    if x + 1 == n or  y + 1 == m:
        return False
    if visited[x][y] or visited[x+1][y] or visited[x][y+1]:
        return False
    visited[x][y] = 1
    visited[x+1][y] = 1
    visited[x][y+1] = 1
    return True

def downleft(x,y,visited) -> bool:
    if x + 1 == n or  y - 1 < 0:
        return False
    if visited[x][y] or visited[x+1][y] or visited[x][y-1]:
        return False
    visited[x][y] = 1
    visited[x+1][y] = 1
    visited[x][y-1] = 1
    return True

def upleft(x,y,visited) -> bool:
    if x - 1 < 0 or  y - 1 < 0:
        return False
    if visited[x][y] or visited[x-1][y] or visited[x][y-1]:
        return False
    visited[x][y] = 1
    visited[x-1][y] = 1
    visited[x][y-1] = 1
    return True
    

def dfs(x,y,visited,cnt):
    global res
    if y == m:
        y = 0
        x += 1
    if x == n:
        res = max(res,cnt)
        return
    
    if upright(x,y,visited):
        dfs(x,y+1,visited,cnt + 2*l[x][y] + l[x-1][y] + l[x][y+1])
        visited[x][y] = 0
        visited[x][y+1] = 0
        visited[x-1][y] = 0
    if upleft(x,y,visited):
        dfs(x,y+1,visited,cnt + 2*l[x][y] + l[x-1][y] + l[x][y-1])
        visited[x][y] = 0
        visited[x][y-1] = 0
        visited[x-1][y] = 0
    if downleft(x,y,visited):
        dfs(x,y+1,visited,cnt + 2*l[x][y] + l[x+1][y] + l[x][y-1])
        visited[x][y] = 0
        visited[x][y-1] = 0
        visited[x+1][y] = 0
    if downright(x,y,visited):
        dfs(x,y+1,visited,cnt + 2*l[x][y] + l[x+1][y] + l[x][y+1])
        visited[x][y] = 0
        visited[x][y+1] = 0
        visited[x+1][y] = 0
    dfs(x,y+1,visited,cnt)
    
dfs(0,0,visited,0)
print(res)
```