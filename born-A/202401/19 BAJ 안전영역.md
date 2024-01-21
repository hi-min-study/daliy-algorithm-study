```java
import java.util.*;

public class Main {
	static int N;
	static int [][] map;
	static boolean [][] check;
	static int[] dx = {1, 0, -1, 0};
	static int[] dy = {0,- 1, 0, 1};
	
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		N = sc.nextInt();
    map = new int[N][N];

		int max =0;
		for(int i=0;i<N;i++) {
			for(int j =0; j<N;j++) {
				map[i][j] = sc.nextInt();
				if(max < map[i][j])
					max = map[i][j];
			}
		}
		
		int res=0;

		for(int i = 0; i <= max; i++) {
			int cnt =0;
			check = new boolean[N][N];

			for(int j = 0;j < N; j++) {
				for(int k = 0; k < N; k++) {
					if(map[j][k] > i&&!check[j][k]) {
						cnt++;
						dfs(j,k,i);
					}
				}
			}

			res=Math.max(cnt, res);
		}
		
		System.out.println(res);
	}
	
	static void dfs(int x,int y,int height) {
		check[x][y]=true;
		
		for (int i = 0; i < 4; i++) {
			int nx = x+dx[i];
			int ny = y+dy[i];
			
			if(nx<0||ny<0||nx>=N||ny>=N||map[nx][ny]<=height||check[nx][ny])
				continue;

			dfs(nx,ny,height);
			
		}
	}
}
```
