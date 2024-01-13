```python
def solution(k: int, room_number: list) -> list:
    answer = [0] * len(room_number)
    assigned = dict()
    
    for i, room in enumerate(room_number):
        next_room = room
        remains = [room]
        while next_room in assigned:
            remains.append(next_room)
            next_room = assigned[next_room]
        answer[i] = next_room
        assigned[next_room] = next_room + 1
        while next_room in assigned:
            remains.append(next_room)
            next_room = assigned[next_room]
        for remain in remains:
            assigned[remain] = next_room
            
    return answer
```