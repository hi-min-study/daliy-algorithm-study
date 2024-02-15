```python
def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


def lcm(a, b):
    return (a * b) / gcd(a, b)


def solution(arr):
    answer = arr[0]
    for a in arr[1:]:
        if answer > a:
            answer = lcm(answer, a)
        else:
            answer = lcm(a, answer)
    return answer
```