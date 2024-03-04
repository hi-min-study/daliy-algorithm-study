```python
def solution(info, edges):
    visited = [0] * len(info)
    answer = []
    
    def dfs(sheep,wolf):
        if sheep > wolf:
            answer.append(sheep)    
        else:
            return
        
        for start,end in edges:
            if visited[start] and not visited[end]:
                visited[end] = 1
                if info[end] == 0:
                    dfs(sheep+1, wolf)
                else:
                    dfs(sheep,wolf+1)
                visited[end] = 0
                
    visited[0] = 1
    dfs(1,0)
        
    return max(answer)
```