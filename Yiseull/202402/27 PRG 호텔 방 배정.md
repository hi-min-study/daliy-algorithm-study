```python
from bisect import bisect_right


def solution(k: int, room_number: list) -> list:
    answer = []
    empty_room = [i for i in range(1, k + 1)]
    visited = [False] * k
    
    for room in room_number:
        index = bisect_right(empty_room, room)
        if empty_room[index - 1] == room and not visited[index - 1]:
            answer.append(empty_room[index - 1])
            visited[index - 1] = True
        else:
            answer.append(empty_room[index])
            empty_room[index] = room
            visited[index] = True
            
    return answer
```