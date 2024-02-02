```python
def brute_force(ability: list, game_visited: list, power: int, student: int, game: int) -> None:
    if game == len(ability[0]):
        global answer
        answer = max(answer, power)
        return
    
    for i in range(student, len(ability)):
        for j in range(len(ability[0])):
            if game_visited[j]:
                continue
            game_visited[j] = True
            brute_force(ability, game_visited, power + ability[i][j], i + 1, game + 1)
            game_visited[j] = False


def solution(ability: list) -> int:
    global answer
    answer = 0
    game_visited = [False] * len(ability[0])
    brute_force(ability, game_visited, 0, 0, 0)
    return answer
```