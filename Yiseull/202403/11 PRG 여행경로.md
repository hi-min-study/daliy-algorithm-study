```python
from collections import defaultdict


def dfs(n: int, tickets_dict: dict, start: int, cnt: int) -> list:
        if cnt == n:
            return [start]
        
        for i, city in enumerate(tickets_dict[start]):
            if city == '':
                continue
                
            tickets_dict[start][i] = ''
            result = dfs(n, tickets_dict, city, cnt + 1)
            tickets_dict[start][i] = city
            
            if result:
                return [start] + result
        
        return []


def solution(tickets: list) -> list:
    n = len(tickets)
    tickets_dict = defaultdict(list)
    
    for start, end in tickets:
        tickets_dict[start].append(end)
        
    for key in tickets_dict.keys():
        tickets_dict[key].sort()
    
    return dfs(n, tickets_dict, 'ICN', 0)
```