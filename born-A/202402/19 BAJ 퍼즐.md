```java
import java.io.*;
import java.util.*;

public class Main {
	static String correct = "123456780";
	static int[] dx = {-1, 1, 0, 0};
	static int[] dy = {0, 0, -1, 1};

	public static void main(String[] args) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = null;
		
		String init ="";
		for(int i=0; i<3; i++) {
			st = new StringTokenizer(br.readLine());
			for(int j=0; j<3; j++) {
				int num = Integer.parseInt(st.nextToken());
				init += num;
			}
		}
		System.out.println(bfs(init));
	}
	
	static int bfs(String init) {
		Queue<String> q = new LinkedList<>();
		q.add(init);
		while(!q.isEmpty()) {
			String pos = q.poll();
			int move =map.get(pos);
			int empty = pos.indexOf('0');
			int px = empty%3;
			int py = empty/3;
			
			if(pos.equals(correct)) {
				return move;
			}
			
			for(int i=0; i<4; i++) {
				int nx = px +dx[i];
				int ny = py + dy[i];
				
				if(nx<0 || ny<0 || nx>2 || ny>2) continue;
			}
		}
	}
}
```
