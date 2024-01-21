```python
def solution(begin, target, words):
    if not target in words:
        return 0
    visited = [0] * len(words)    

    def dfs(word,depth):
        global answer
        
        if target == word:
            answer = min(answer,depth)
            return

        for i in range(len(words)):
            diff = 0
            if not visited[i]:
                for a,b in zip(word,words[i]):
                    if a!=b:
                        diff += 1
                if diff == 1:
                    visited[i] = 1
                    dfs(words[i],depth+1)
                    visited[i] = 0

    dfs(begin,0)
    
    return answer
answer = 100

```