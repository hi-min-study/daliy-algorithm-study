```python
def solution(storey):
    answer = 0
    
    while storey:
        remain = storey % 10 
        
        if remain < 5:
            answer += remain

        elif remain > 5:
            tmp = (10 - remain)
            answer += tmp
            storey += 10
            
        # 앞자리수에 따라 달라짐
        else:
            if (storey // 10) % 10 >= 5:
                storey += 10
            answer += remain
        
        storey = storey // 10
    
    return answer
```