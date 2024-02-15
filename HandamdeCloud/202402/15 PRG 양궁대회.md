```python
def dfs(L, cnt):
        global max_gap, answer
        if L == 11 or cnt == 0:    
            is_winner, gap = is_winner_with_gap(score)
            if is_winner:
                if cnt >= 0: # 화살이 남은 경우
                    score[10] = cnt # 0점에 쏴도 이김
                
                if gap > max_gap: # 갭이 더 큰 경우로 업데이트
                    max_gap = gap
                    answer = score.copy()
                    
                elif gap == max_gap: # 가장 낮은 점수를 많이 맞힌 경우로 업데이트
                    for i in range(len(score)):
                        if answer[i] > 0:
                            max_i_1 = i
                        if score[i] > 0:
                            max_i_2 = i
                    if max_i_2 > max_i_1:
                        answer = score.copy()
                    
            return
            
        # k점을 어피치보다 많이 맞추거나 아예 안맞추거나
       if cnt>info[L]:
           score[L]=info[L]+1
           dfs(L+1, cnt-(info[L]+1))
           score[L]=0
            
       dfs(L+1, cnt)
```