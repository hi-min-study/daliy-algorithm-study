```python
import sys
input = sys.stdin.readline


def solution(n: int, d: int, k: int, c: int, sushi: list) -> int:
    ate = dict()
    ate[c] = 1
    for i in range(k):
        if sushi[i] in ate:
            ate[sushi[i]] += 1
        else:
            ate[sushi[i]] = 1
    answer = len(ate)
    for i in range(k, n + k):
        if sushi[i % n] in ate:
            ate[sushi[i % n]] += 1
        else:
            ate[sushi[i % n]] = 1
        ate[sushi[i - k]] -= 1
        if ate[sushi[i - k]] == 0:
            del ate[sushi[i - k]]
        answer = max(answer, len(ate))

    return answer


if __name__ == '__main__':
    n, d, k, c = map(int, input().split())
    sushi = [int(input()) for _ in range(n)]
    print(solution(n, d, k, c, sushi))
```