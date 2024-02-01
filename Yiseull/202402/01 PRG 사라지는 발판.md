```python
'''
종료 조건
- 현재 플레이어가 이동할 발판이 없는 경우 -> 현재 플레이어 패배
- 두 플레이어가 같은 발판에 있는 경우 -> 현재 플레이어 승리
'''
def find_next_position(board, x, y, n, m):
    next_position = []
    for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
        next_x, next_y = dx + x, dy + y
        if -1 < next_x < m and -1 < next_y < n and board[next_y][next_x] == 1:
            next_position.append((next_x, next_y))
    return next_position


def dfs(board, aloc, bloc, n, m, count):
    if count % 2 == 0:
        next_position = find_next_position(board, aloc[1], aloc[0], n, m)
    else:
        next_position = find_next_position(board, bloc[1], bloc[0], n, m)
    # 현재 플레이어가 이동할 수 없는 경우, 현재 플레이어 패배
    if not next_position:
        return count % 2 != 0, count
    
    # 두 플레이어가 같은 발판에 있는 경우, 현재 플레이어 승리
    if aloc == bloc:
        return count % 2 == 0, count + 1
        
    win, lose = [], []
    for next_x, next_y in next_position:
        if count % 2 == 0:          
            board[aloc[0]][aloc[1]] = 0
            result = dfs(board, [next_y, next_x], bloc, n, m, count + 1)
            board[aloc[0]][aloc[1]] = 1
            if result[0]:
                win.append(result[1])
            else:
                lose.append(result[1])
        else:
            board[bloc[0]][bloc[1]] = 0
            result = dfs(board, aloc, [next_y, next_x], n, m, count + 1)
            board[bloc[0]][bloc[1]] = 1
            if not result[0]:
                win.append(result[1])
            else:
                lose.append(result[1])
        board[next_y][next_x] = 1
    
    if win:
        return count % 2 == 0, min(win)
    else:
        return count % 2 != 0, max(lose)


def solution(board, aloc, bloc):
    return dfs(board, aloc, bloc, len(board), len(board[0]), 0)[1]
```