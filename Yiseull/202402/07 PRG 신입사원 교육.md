```python
from heapq import *


def solution(ability: list, number: int) -> int:
    heapify(ability)
    for _ in range(number):
        sum_ability = heappop(ability) + heappop(ability)
        heappush(ability, sum_ability)
        heappush(ability, sum_ability)
    return sum(ability)
```