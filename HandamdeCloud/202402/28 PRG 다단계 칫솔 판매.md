```python
from collections import defaultdict

def recur(member,idx,relation, price):
    global answer
    
    answer[idx[member]] += price - (price//10)
    if relation[member] == '-' or price == 0:
        return

    recur(relation[member], idx, relation, price//10)
        

def solution(enroll, referral, seller, amount):
    global answer
    idx = { enroll[i]:i for i in range(len(enroll))}
    relation = {enroll[i]:referral[i] for i in range(len(enroll))}
    answer = [0 for _ in range(len(enroll))]
    
    earn = defaultdict(list)
    for i in range(len(seller)):
        earn[seller[i]].append(100 * amount[i])
        
    for member, price in earn.items():
        for p in price:
            recur(member,idx, relation, p)
    
    return answer

```