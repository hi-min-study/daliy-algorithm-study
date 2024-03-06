```python
from collections import defaultdict


def solution(genres: list, plays: list) -> list:
    genre_total_plays, genre_plays = defaultdict(int), defaultdict(list)
    for i in range(len(genres)):
        genre_total_plays[genres[i]] += plays[i]
        genre_plays[genres[i]].append((plays[i], i))
        
    answer = []
    for genre_total_play in sorted(genre_total_plays.items(), key=lambda x: -x[1]):
        answer += sorted(genre_plays[genre_total_play[0]], key=lambda x: (-x[0], x[1]))[:2]
        
    return [i[1] for i in answer]
```