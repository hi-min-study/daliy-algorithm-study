```python
def solution(n: int, info: list) -> list:
    global answer, score_gap
    answer, score_gap = [], 1
    
    def dfs(n: int, i: int, apeach_info: list, apeach_score: int, lion_info: list, lion_score: int) -> None:
        if i == 11:
            global answer, score_gap
            if score_gap > lion_score - apeach_score:
                return
            if answer != [] and score_gap == lion_score - apeach_score:
                for j in range(10, -1, -1):
                    if answer[j] > lion_info[j]:
                        return
                    elif answer[j] < lion_info[j]:
                        break
            answer = lion_info[:]
            answer[10] = n
            score_gap = lion_score - apeach_score
            return

        score = 10 - i
        if apeach_info[i] < n:
            lion_info[i] = apeach_info[i] + 1
            dfs(n - lion_info[i], i + 1, apeach_info, apeach_score, lion_info, lion_score + score)
            lion_info[i] = 0
        if apeach_info[i] == 0:
            dfs(n, i + 1, apeach_info, apeach_score, lion_info, lion_score)
        else:
            dfs(n, i + 1, apeach_info, apeach_score + score, lion_info, lion_score)

    dfs(n, 0, info, 0, [0 for _ in range(11)], 0)
    
    return answer if answer != [] else [-1]
```