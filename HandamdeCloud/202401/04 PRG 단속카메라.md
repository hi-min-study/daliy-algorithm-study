```python
def solution(routes):

    routes.sort()
    answer = 0
    start = routes[0][1]
    
    a = 1
    for i in range(1,len(routes)):
        if i <= a:
            continue
            
        while a < len(routes):
            if routes[a][0] < start <= routes[a][1]:
                a += 1
            else:
                break
        answer += 1 
        start = routes[a][0]
        
    print(routes)

    
    return answer

```