```python
def solution(user_id: list, banned_id: list) -> int:
    answer = set()
    n, m = len(user_id), len(banned_id)
    visited = [0] * n
    
    def dfs(idx: int) -> None:
        if idx == m:
            answer.add(''.join(map(str, visited)))
            return
        
        for i, user in enumerate(user_id):
            if not visited[i] and len(banned_id[idx]) == len(user):
                for j, alpha in enumerate(user):
                    if banned_id[idx][j] != '*' and banned_id[idx][j] != alpha:
                        break
                else:
                    visited[i] = 1
                    dfs(idx + 1)
                    visited[i] = 0
    
    dfs(0)
    
    return len(answer)
```