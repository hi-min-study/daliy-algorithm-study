```python
from collections import deque
dx,dy = [0,0,1,-1],[1,-1,0,0]

def bfs(board, dir):
    n = len(board)
    price = [[1e9]* n for _ in range(n)]
    price[0][0] = 0
    
    q = deque() # x,y,cost,direction
    q.append((0,0,0,dir))
    
    while q:
        x,y,c,d = q.popleft()
        
        if x == n-1 and y == n-1:
            continue
        
        for i in range(4):
            nx,ny,nd = dx[i]+x, dy[i]+y,i
            
            # 범위
            if 0 <= nx < n and 0 <= ny < n:
                # 벽아님 방문하지 않았음
                if board[nx][ny] != 1:
                    if nd == d:
                        nc = c + 100
                    else:
                        nc = c + 600
                        
                    if nc < price[nx][ny]:
                        price[nx][ny] = nc
                        q.append((nx,ny,nc,nd))
    return price[-1][-1]
                    

def solution(board):
    answer = min(bfs(board, 0), bfs(board, 2))

    return answer

```