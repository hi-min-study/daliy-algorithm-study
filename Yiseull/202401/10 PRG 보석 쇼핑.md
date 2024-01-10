```python
from collections import defaultdict


def solution(gems: list) -> list:
    answer = [0, 100000]
    gem_dict = defaultdict(int)
    n, m = len(gems), len(set(gems))
    i, j = 0, 0
    while j < n:
        if len(gem_dict) == m:
            if answer[1] - answer[0] > j - i:
                answer = [i, j]
            if gem_dict[gems[i]] == 1:
                del gem_dict[gems[i]]
            else:
                gem_dict[gems[i]] -= 1
            i += 1
        else:
            gem_dict[gems[j]] += 1
            j += 1
    
    while i <= n - m:
        if len(gem_dict) == m:
            if answer[1] - answer[0] > j - i:
                answer = [i, j]
            if gem_dict[gems[i]] == 1:
                del gem_dict[gems[i]]
            else:
                gem_dict[gems[i]] -= 1
            i += 1
            continue
        break
                
    return [answer[0] + 1, answer[1]]
```