```python
def solution(prices) -> list:
    n = len(prices)
    answer = [0] * n
    stack = []
    
    for i, price in enumerate(prices):
        while stack and prices[stack[-1]] > price:
            answer[stack.pop()] = i - stack[-1]
        stack.append(i)
    
    while stack:
        answer[stack.pop()] = n - stack[-1] - 1
    
    return answer
```
