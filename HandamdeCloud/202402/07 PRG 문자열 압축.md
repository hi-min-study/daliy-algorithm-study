```python
def solution(s):
    if len(s) == 1;
        return 1
    
    for i in range(len(s)):
        mid = len(s) // 2
        start = i
        cnt = 0
        while start < mid and mid < len(s):
            if s[start] == s[mid]:
                start += 1
                mid += 1
                cnt += 1
            else:
                mid -= 1
        if cnt >= 2:
            print(s[i:i+cnt])
        
    answer = 0
    return answer
```