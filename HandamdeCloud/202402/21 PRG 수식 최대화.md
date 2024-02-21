```python
def split_exp_op(expression):
    exp = []
    tmp = ''
    for ch in expression:
        if ch.isdigit(): tmp += ch
        else:
            exp.append(tmp)
            exp.append(ch)
            tmp=''
    exp.append(tmp)
    
    return exp

def change_post(operation,expression):
    res = []
    stack = []
    
    for exp in expression:
        if exp.isdigit():
            res.append(exp)
        else:
            while len(stack) != 0 and operation.index(exp) >= operation.index(stack[-1]):
                res.append(stack.pop())
            stack.append(exp)
            
    for i in range(len(stack)):
        res.append(stack.pop())
    
    return res

def cal_res(res):
    stack = []
    for val in res:
        if val.isdigit(): 
            stack.append(val)
            
        elif len(stack) > 1 :
            b = int(stack.pop())
            a = int(stack.pop())
            
            if val == '*':
                stack.append(a*b)
                
            elif val == '+':
                stack.append(a+b)  
                
            elif val == '-':
                stack.append(a-b)
            
    return abs(stack[-1])

def solution(expression):
    answer = 0
    exp = split_exp_op(expression)
    operations = [["*","-","+"],["*","+","-"],["-","+","*"],["-","*","+"],["+","-","*"],["+","*","-"]]
    
    for operation in operations:
        answer = max(answer, cal_res(change_post(operation,exp)))
        
    return answer

```