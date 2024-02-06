```python
from heapq import *


def solution(program: list) -> list:
    answer = [0] * 11
    heap = []
    time = 0
    program.sort(key=lambda x: (x[1], x[0]))
    
    for a, b, c in program:
        put = True
        while time < b:
            if heap:
                tmp = []
                next_program = heappop(heap)
                while heap and heap[0][0] == next_program[0] and heap[0][1] < next_program[1]:
                    tmp.append(next_program)
                    next_program = heappop(heap)
                for pro in tmp:
                    heappush(heap, pro)
                time = max(time, next_program[1])
                answer[next_program[0]] += time - next_program[1]
                time += next_program[2]
            else:
                put = False
                time = b + c
                break
        if put:
            heappush(heap, (a, b, c))
                
    while heap:
        tmp = []
        next_program = heappop(heap)
        while heap and heap[0][0] == next_program[0] and heap[0][1] < next_program[1]:
            tmp.append(next_program)
            next_program = heappop(heap)
        for pro in tmp:
            heappush(heap, pro)
        time = max(time, next_program[1])
        answer[next_program[0]] += time - next_program[1]
        time += next_program[2]
    
    answer[0] = time
    
    return answer
```