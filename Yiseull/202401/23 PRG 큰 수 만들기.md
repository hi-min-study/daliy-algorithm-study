```python
'''
1. 숫자들을 스택에 넣는다.
2. 스택의 마지막 숫자와 현재 숫자를 비교해서 스택 숫자가 클 떄까지 스택에서 꺼내고 현재 숫자를 넣는다.
3. 숫자들을 다 돌고나서 k가 0이 아니라면 k만큼 뒷부분을 빼준다.
'''
def solution(number: str, k: int) -> str:
    stack = []
    for i, n in enumerate(number):
        while stack and stack[-1] < n and k > 0:
            stack.pop()
            k -= 1
        stack.append(n)
        
    return ''.join(stack[:-k]) if k else ''.join(stack)
```