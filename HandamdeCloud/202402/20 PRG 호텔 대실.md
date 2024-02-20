```python
def solution(book_time):
    
    room = []
    book = []
    
    for guest in book_time:
        check_in = int(guest[0].split(":")[0])*60 + int(guest[0].split(":")[1])
        check_out = int(guest[1].split(":")[0])*60 + int(guest[1].split(":")[1])
        book.append([check_in,check_out])
        
    book.sort()
    
    for guest in book:
        for i in range(len(room)):
            if room[i] <= guest[0]:
                room[i] = guest[1] + 10
                break
                
        else:
            room.append(guest[1] + 10)
            
        room.sort()
                
    return len(room)

```