```python
from bisect import bisect_left, bisect_right


def count_by_range(words: list, left_value: str, right_value: str) -> int:
    right_index = bisect_right(words, right_value)
    left_index = bisect_left(words, left_value)
    return right_index - left_index


def solution(words: list, queries: list) -> list:
    answer = [0] * len(queries)
    dictionary = dict()
    reverse_dictionary = dict()
    
    for word in words:
        word_len = len(word)
        if word_len not in dictionary:
            dictionary[word_len] = []
            reverse_dictionary[word_len] = []
        dictionary[word_len].append(word)
        reverse_dictionary[word_len].append(word[::-1])
        
    for l in dictionary:
        dictionary[l].sort()
        reverse_dictionary[l].sort()
        
    for i, query in enumerate(queries):
        query_len = len(query)
        if query_len not in dictionary:
            answer[i] = 0
            continue
            
        if query[0] != '?':
            result = count_by_range(dictionary[len(query)], query.replace('?', 'a'), query.replace('?', 'z'))
        else:
            result = count_by_range(reverse_dictionary[len(query)], query[::-1].replace('?', 'a'), query[::-1].replace('?', 'z'))
        answer[i] = result
    
    return answer
```