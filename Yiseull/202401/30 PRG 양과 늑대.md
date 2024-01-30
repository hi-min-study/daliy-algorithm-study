```python
'''
DFS 로직 순서
1. 노드를 방문하고 양과 늑대의 갯수를 업데이트 한다. 
2. 양의 수가 더 많은 경우 정답값을 업데이트 한다. 
3. 만약 늑대의 수가 더 높으면 return 한다. 
4. 방문할 리스트에 자신을 제외하고 자식 노드를 담는다. 이때 새로운 리스트를 만든다.
5. 방문할 리스트가 비어있으면 return 한다. 
6. 방문할 리스트를 dfs로 하나씩 방문한다.
'''
def dfs(info: list, graph: list, visit: list, node: int, sheep: int, wolf: int) -> None:
    if info[node] == 0: sheep += 1
    else: wolf += 1

    if wolf < sheep:
        global answer
        answer = max(answer, sheep)
    else:
        return

    index = visit.index(node)
    new_visit = visit[:index] + visit[index+1:]
    for child in graph[node]:
        new_visit.append(child)
    
    if not new_visit:
        return

    for next_node in new_visit:
        dfs(info, graph, new_visit, next_node, sheep, wolf)
    

def solution(info: list, edges: list) -> int:
    global answer
    answer = 0
    graph = [[] for _ in range(len(info))]
    for parent, child in edges:
        graph[parent].append(child)
        
    dfs(info, graph, [0], 0, 0, 0)
    
    return answer
```