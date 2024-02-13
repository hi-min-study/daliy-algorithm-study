```python
def change(x):
    exc = {'C#':'1','D#':'2', 'F#':'3', 'G#':'4', 'A#':'5'}
    for k, v in exc.items():
        x = x.replace(k, v)
    return x

def solution(m, musicinfos):
    answer = []
    for info in musicinfos:
        musicinfo = info.split(",")
        musicinfo[3] = change(musicinfo[3])
        
        start_min = int(musicinfo[0].split(":")[0])*60 + int(musicinfo[0].split(":")[1])
        end_min = int(musicinfo[1].split(":")[0])*60 + int(musicinfo[1].split(":")[1])
        music_time = end_min - start_min
        
        if music_time >= len(musicinfo[3]):
            a,b = divmod(music_time,len(musicinfo[3]))
            music = musicinfo[3]*a + musicinfo[3][:b]
        else:
            music = musicinfo[3][:music_time]
            
        if change(m) in music:
            answer.append([music_time, musicinfo[2]])
    
    if not answer:
        return '(None)'
    
    return sorted(answer, key=lambda x: -x[0])[0][1]
```