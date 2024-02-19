```python
import sys
input = sys.stdin.readline


def solution(n: int, k: int, ice: list, min_x: int, max_x: int) -> int:
    k *= 2
    ice_sum = [0] * 1000001
    if min_x + k > 1000000:
        return sum(ice[min_x:])
    ice_sum[min_x + k] = sum(ice[min_x:min_x + k + 1])
    for i in range(min_x + k + 1, max_x + 1):
        ice_sum[i] = ice_sum[i - 1] - ice[i - k - 1] + ice[i]
    return max(ice_sum[min_x + k:max_x + 1])


if __name__ == '__main__':
    n, k = map(int, input().split())
    ice = [0] * 1000001
    min_x, max_x = 1000001, 0
    for _ in range(n):
        g, x = map(int, input().split())
        ice[x] = g
        min_x, max_x = min(min_x, x), max(max_x, x)
    print(solution(n, k, ice, min_x, max_x))
```