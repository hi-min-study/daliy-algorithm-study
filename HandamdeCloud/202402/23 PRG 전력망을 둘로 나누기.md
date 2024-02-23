```python
import copy
def solution(n, wires):
    parent = [0] * (n+1)
    for i in range(1,n+1): #자기 부모는 자신으로 초기화
        parent[i] = i
    
    def find_parent(parent, x): #부모가 누구인지 찾기
        if parent[x] != x:
            return find_parent(parent, parent[x])
        return parent[x]
    
    def union_parent(parent, a, b):
        a = find_parent(parent, a) #a의 부모
        b = find_parent(parent, b) #b의 부모
        if a < b:
            parent[b] = a
        else:
            parent[a] = b
 
    res = n
    for i in range(len(wires)):
        parent_cp = copy.deepcopy(parent)
        for j in range(len(wires)): #하나씩 간선 끊어보기
            if i==j:
                continue
            a,b = wires[j]
            union_parent(parent_cp, a, b)
        
        for a,b in wires:
            parent_cp[a] = find_parent(parent_cp, a)    
            parent_cp[b] = find_parent(parent_cp, b)  
        res = min(abs(parent_cp.count(parent_cp[wires[i][0]]) - parent_cp.count(parent_cp[wires[i][1]])), res)
            
    return res
 
n = 9
wires = [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]
print(solution(n, wires))
```