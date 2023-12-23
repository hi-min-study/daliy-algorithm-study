
```python
def solution(order):
    sub = []
    main = [i for i in range(1,len(order)+1)]
    answer = 0
    
    while main:
        if main[0] == order[0]:
            order.pop(0)
            main.pop(0)
            answer += 1
            
        elif sub:
            if sub[-1] == order[0]:
                sub.pop(-1)
                order.pop(0)
                answer += 1
            else:
                sub.append(main.pop(0))

        else:
            sub.append(main.pop(0))

    for i in range(len(sub)):
        if sub[-(i+1)] == order[i]:
            answer +=1
        else:
            return answer

    return answer
```


                                           
    