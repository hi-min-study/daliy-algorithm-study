```java
def solution(A: list, B: list) -> int:
    B.sort(reverse=True)
    i = 0
    for a in sorted(A, reverse=True):
        if a < B[i]:
            i += 1
    return i
```