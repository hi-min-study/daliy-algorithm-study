```python
def solution(stones: list, k: int) -> int:
    left, right = 0, 200000000
    
    while left <= right:
        mid = (left + right) // 2
        
        cnt = 0
        for stone in stones:
            if stone - mid < 1:
                cnt += 1
                if cnt + 1 > k:
                    break
            else:
                cnt = 0
        
        if cnt + 1 > k:
            right = mid - 1
        else:
            left = mid + 1
            
    return left
```