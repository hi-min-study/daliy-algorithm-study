```python
'''
과제 시작 우선순위
1. 새로운 과제
2. 가장 최근에 멈춘 과제
'''
def solution(plans: list) -> list:
    answer = []
    stack = []
    current = ["", 0, 0]
    
    plans.sort(key=lambda x: x[1])
    for name, start, playtime in plans:
        h, m = start.split(':')
        start = int(h) * 60 + int(m)
        while current[0] != "" and current[1] + current[2] <= start:
            answer.append(current[0])
            if stack:
                pre = stack.pop()
                current = [pre[0], current[1] + current[2], pre[2]]
            else:
                current = ["", 0, 0]
        if current[0] != "":
            stack.append([current[0], start, current[2] - (start - current[1])])
        current = [name, start, int(playtime)]
    
    while current[0] != "":
            answer.append(current[0])
            if stack:
                pre = stack.pop()
                current = [pre[0], pre[1] + pre[2], pre[2]]
            else:
                current = ["", 0, 0]
    
    return answer
```