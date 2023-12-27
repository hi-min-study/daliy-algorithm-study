```python
def solution(distance, rocks, n) -> int:
    rocks.sort()
    rocks.append(distance)
    
    left, right = 1, distance
    while left <= right:
        mid = (left + right) // 2
        
        cnt = 0
        pre_rock = 0
        for rock in rocks:
            gap = rock - pre_rock
            if gap < mid:
                cnt += 1
            else:
                pre_rock = rock
        
        if cnt > n:
            right = mid - 1
        else:
            left = mid + 1
            
    return right
```
