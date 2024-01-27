```python
'''
1. 딕셔너리1에 차량의 입차 시간을 저장한다.
2. 출차인 경우에 딕셔너리2에 누적 주차 시간을 추가한다.
3. 딕셔너리1이 비어있지 않은 경우, 남은 차량에 대해 누적 주차 시간을 추가한다.
4. 모든 차량의 누적 주차 시간의 계산이 끝난 경우, 한 차랑씩 주차 요금을 계산한다.
5. 차량 번호가 작은 자동차부터 주차 요금을 정렬해 반환한다.
'''
from collections import defaultdict
from math import ceil


def solution(fees: list, records: list) -> list:
    dict1, dict2 = dict(), defaultdict(int)
    for record in records:
        time, number, io = record.split()
        h, m = map(int, time.split(':'))
        m += h * 60
        if io == 'IN':
            dict1[number] = m
        else:
            dict2[number] += m - dict1[number]
            del dict1[number]
            
    for key in dict1.keys():
        dict2[key] += 1439 - dict1[key]
        
    for key, value in dict2.items():
        fee = fees[1]
        if fees[0] < value:
            fee += ceil((value - fees[0]) / fees[2]) * fees[3]
        dict2[key] = fee
    
    return [item[1] for item in sorted(dict2.items())]
```