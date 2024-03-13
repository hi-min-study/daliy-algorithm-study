```java
import java.util.*;

class Solution {
	Map<Long, Long> map = new HashMap<>();

	public long[] solution(long k, long[] room_number) {
		int n = room_number.length;
		long[] answer = new long[n];

		for(int i=0; i < n; i++){
			answer[i] = findEmptyRoom(room_number[i]);
		}

		return answer;
	}

	private long findEmptyRoom(long num){
		if (map.containsKey(num)){
			long nextRoom = map.get(num);
			long emptyRoom = findEmptyRoom(nextRoom);
			map.put(num, emptyRoom);
			return emptyRoom;
		}

		map.put(num, num+1);
		return num;
	}
}
```