```python
def solution(board: list, skill: list) -> int:
    answer = 0
    n, m = len(board), len(board[0])
    skill_board = [[0] * m for _ in range(n)]
    
    for type, r1, c1, r2, c2, degree in skill:
        if type == 1:
            degree *= -1
        skill_board[r1][c1] += degree
        if c2 + 1 < m: skill_board[r1][c2 + 1] -= degree
        if r2 + 1 < n: skill_board[r2 + 1][c1] -= degree
        if c2 + 1 < m and r2 + 1 < n: skill_board[r2 + 1][c2 + 1] += degree
        
    for i in range(n):
        for j in range(1, m):
            skill_board[i][j] += skill_board[i][j - 1]
            
    for j in range(m):
        for i in range(1, n):
            skill_board[i][j] += skill_board[i - 1][j]
        
    for i in range(n):
        for j in range(m):
            if board[i][j] + skill_board[i][j] > 0:
                answer += 1
            
    return answer
```