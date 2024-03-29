```python
def solution(storey: int) -> int:
    answer = 0
    storey = list(map(int, str(storey)))
    for i in range(len(storey) - 1, 0, -1):
        if storey[i] < 5:
            answer += storey[i]
        elif storey[i] == 5 and storey[i - 1] < 5:
            answer += storey[i]
        else:
            answer += 10 - storey[i]
            storey[i - 1] += 1
        
    if storey[0] < 6:
        answer += storey[0]
    else:
        answer += 11 - storey[0]
        
    return answer
```