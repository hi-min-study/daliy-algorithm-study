```python
def solution(dirs: list) -> int:
    visited = set()
    x, y = 0, 0
    for dir in dirs:
        next_x, next_y = x, y
        if dir == 'U':
            next_y += 1
        elif dir == 'D':
            next_y -= 1
        elif dir == 'R':
            next_x += 1
        else:
            next_x -= 1
        if -6 < next_x < 6 and -6 < next_y < 6:
            if (x, y, next_x, next_y) not in visited and (next_x, next_y, x, y) not in visited:
                visited.add((x, y, next_x, next_y))
            x, y = next_x, next_y
            
    return len(visited)
```