```python
def solution(n, t, m, timetable):
       
    wait_time = [int(i.split(":")[0])*60 + int(i.split(":")[1]) for i in timetable]
    wait_time.sort()
    
    bustime = [9*60 + t*i for i in range(n)]
    
    def change_time(time):
        hour,minute = divmod(time,60)
        hour = "0" + str(hour) if hour < 10 else str(hour)
        minute = "0" + str(minute) if minute < 10 else str(minute)
        
        return hour + ":" + minute
    
    i = 0
    for bus in bustime:
        cnt = 0
        while cnt < m and i < len(wait_time) and wait_time[i] <= bus:
            i += 1
            cnt += 1
        if cnt < m : answer = bus
        else: answer = wait_time[i-1] - 1
                    
    return change_time(answer)

```