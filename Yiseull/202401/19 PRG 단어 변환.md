```python
from collections import deque


def check(word1, word2) -> bool:
    count = 0
    for w1, w2 in zip(word1, word2):
        if w1 != w2:
            count += 1
    return True if count < 2 else False


def solution(begin: str, target: str, words: list) -> int:
    q = deque([begin])
    visited = dict()
    visited[begin] = 0
    while q:
        v = q.popleft()
        for word in words:
            if word not in visited and check(v, word):
                visited[word] = visited[v] + 1
                if target == word:
                    return visited[word]
                q.append(word)
                
    return 0
```