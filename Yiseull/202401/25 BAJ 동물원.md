```python
def solution(n: int) -> int:
    a, b = 1, 1
    for i in range(n - 1):
        a, b = a + b + b, a + b

    return (a + b + b) % 9901


if __name__ == '__main__':
    n = int(input())
    print(solution(n))
```