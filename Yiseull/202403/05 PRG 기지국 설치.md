```python
from math import ceil


def solution(n: int, stations: list, w: int) -> int:
    ww = w * 2 + 1
    answer = 0
    current = 1
    for station in stations:
        if current < station - w:
            answer += ceil((station - w - current) / ww)
        current = station + w + 1
    answer += ceil((n - current + 1) / ww)
        
    return answer
```