```python
def solution(n, costs):
    answer = 0
    parent = [i for i in range(n+1)]
    costs.sort(key = lambda x : x[2])
    def find(parent,i):
        if parent[i] == i:
            return i
        parent[i] = find(parent,parent[i])
        return parent[i]
        
    def union(parent,a,b):
        rootA = find(parent,a)
        rootB = find(parent,b)
        
        if rootA < rootB:
            parent[rootB] = rootA
        else:
            parent[rootA] = rootB
    
    for cost in costs:
        a,b,v = cost
        if find(parent, a) != find(parent, b):
            union(parent,a,b)
            answer += v
        
        
    return answer
```