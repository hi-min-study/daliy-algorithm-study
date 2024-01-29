```python
def dfs(n: int, info: list, l_info: list, i: int, a_score:int, l_score: int):
    if i > 10 and n > 0:
        l_info[10] += n
        dfs(0, info, l_info, i, a_score, l_score)
        l_info[10] -= n
        return
    
    if n < 1:
        global answer
        if a_score < l_score:
            diff = l_score - a_score
            if answer[0] < diff:
                answer = [diff] + l_info
            elif answer[0] == diff:
                for j in range(10, -1, -1):
                    if answer[j + 1] < l_info[j]:
                        answer = [diff] + l_info
                        break
        return
    
    if info[i] < n:
        l_info[i] = info[i] + 1
        dfs(n - l_info[i], info, l_info, i + 1, a_score, l_score + 10 - i)
        l_info[i] = 0
    if info[i] == 0:
        dfs(n, info, l_info, i + 1, a_score, l_score)
    else:
        dfs(n, info, l_info, i + 1, a_score + 10 - i, l_score)

def solution(n: int, info: list) -> list:
    global answer
    answer = [0, -1]
    l_info = [0 for _ in range(11)]
    dfs(n, info, l_info, 0, 0, 0)
    return answer[1:]
```