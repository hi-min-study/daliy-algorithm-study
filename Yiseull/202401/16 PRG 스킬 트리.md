```python
def solution(skill: str, skill_trees: list) -> int:
    answer = 0
    for user_skill in skill_trees:
        pre = -2
        for c in skill:
            result = user_skill.find(c)
            if (pre > result and result != -1) or (pre == -1 and result != -1):
                break
            pre = result
        else:
            answer += 1
        
    return answer
```