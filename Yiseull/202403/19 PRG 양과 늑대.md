```python
def dfs(info: list, graph: list, node: int, sheep: int, wolf: int, next_nodes: list) -> None:
    if info[node] == 0:
        sheep += 1
    else:
        wolf += 1
    
    if sheep <= wolf:
        return
    
    global answer
    answer = max(answer, sheep)
    
    copy_nodes = next_nodes[:]    
    copy_nodes.remove(node)
    for child in graph[node]:
        copy_nodes.append(child)
        
    for n in copy_nodes:
        dfs(info, graph, n, sheep, wolf, copy_nodes)


def solution(info: list, edges: list) -> int:
    global answer
    answer = 0
    
    graph = [[] for _ in range(len(info))]
    for parent, child in edges:
        graph[parent].append(child)
        
    dfs(info, graph, 0, 0, 0, [0])
        
    return answer
```