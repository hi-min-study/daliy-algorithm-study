```python
def solution(order):
    sub = []
    answer = 0
    i = 1
    
    while i != len(order) + 1:
        sub.append(i)
        while sub[-1] == order[answer]:
            answer += 1
            sub.pop()
            if len(sub) == 0:
                break
        i += 1
        
    return answer
```