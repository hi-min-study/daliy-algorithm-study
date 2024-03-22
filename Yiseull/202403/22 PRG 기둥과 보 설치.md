```python
'''
- 기둥은 '바닥 위'에 있거나 '보의 한쪽 끝 부분 위'에 있거나, 또는 '다른 기둥 위'에 있어야 합니다.
- 보는 '한쪽 끝 부분이 기둥 위'에 있거나, 또는 '양쪽 끝 부분이 다른 보와 동시에 연결'되어 있어야 합니다.
'''
def check(x: int, y: int, a: int, build_dict: list) -> bool:
    if a == 0:
        if y == 0 or (x, y - 1, 0) in build_dict or (x, y, 1) in build_dict or (x - 1, y, 1) in build_dict:
            return True
    else:
         if (x, y - 1, 0) in build_dict or (x + 1, y - 1, 0) in build_dict or ((x - 1, y, 1) in build_dict and (x + 1, y, 1) in build_dict):
            return True
    return False


def solution(n: int, build_frame: list) -> list:
    build_dict = {}
    for x, y, a, b in build_frame:
        if b == 0:
            del build_dict[(x, y, a)]
            possible = True
            for xi, yi, ai in build_dict.keys():
                if not check(xi, yi, ai, build_dict):
                    possible = False
                    break
            if not possible:
                build_dict[(x, y, a)] = 1
        else:
            if check(x, y, a, build_dict):
                build_dict[(x, y, a)] = 1
        
    return sorted(build_dict.keys(), key=lambda x: (x[0], x[1], x[2]))
```