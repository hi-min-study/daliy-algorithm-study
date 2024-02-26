```python
import sys
sys.setrecursionlimit(10000)


def solution(nodeinfo: list) -> list:
    answer = [[], []]
    nodeinfo = sorted([node + [i + 1] for i, node in enumerate(nodeinfo)])
    
    def order(nodeinfo: list):
        if nodeinfo:
            root = 0
            for i, node in enumerate(nodeinfo):
                if nodeinfo[root][1] < node[1]:
                    root = i

            answer[0].append(nodeinfo[root][2])
            order(nodeinfo[:root])
            order(nodeinfo[root+1:])
            answer[1].append(nodeinfo[root][2])
        
    order(nodeinfo)
        
    return answer
```