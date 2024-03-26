```python
def change_base_n(n: int, num: int) -> str:
    result = ''
    while num > 0:
        a = num % n
        if a > 9:
            result += chr(65 + a - 10)
        else:
            result += str(a)
        num //= n
    return result[::-1]


def solution(n: int, t: int, m: int, p: int) -> list:
    answer = '0'
    last_time = m * (t - 1) + p
    i = 1
    while len(answer) < last_time:
        answer += change_base_n(n, i)
        i += 1
        
    return ''.join(list(answer)[p - 1:last_time:m])
```