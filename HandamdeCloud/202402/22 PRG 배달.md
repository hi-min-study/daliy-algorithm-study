```python
def solution(N, road, K):
    
    graph = [[1e9]*(N+1) for i in range(N+1)]
    road.sort(key = lambda x : -x[2])
    for i in road:
        graph[i[0]][i[1]] = i[2]
        graph[i[1]][i[0]] = i[2]
        
    for k in range(1,N+1):
        for i in range(1,N+1):
            for j in range(1,N+1):
                if i==j:
                    graph[i][j] = 0
                else:
                    graph[i][j] = min(graph[i][k]+graph[k][j],graph[i][j])
                    
    answer = 0
    for i in range(1,N+1):
        if graph[1][i] <= K:
            answer+=1

    return answer

```