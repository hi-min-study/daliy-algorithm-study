```java
import java.io.*;
import java.util.*;

public class Main {
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static StringTokenizer st;

	static int N, M,room =0, maxNum = 0;
	static int[][] map, wall;

	static Deque<int[]> deque;
	static int[] dx = { 0, -1, 0, 1 };
	static int[] dy = { -1, 0, 1, 0 };
	static int[] dir = { 1, 2, 4, 8 };
	static ArrayList<Integer> space =  new ArrayList();

	public static void main(String[] args) throws Exception {
		st = new StringTokenizer(br.readLine());
		M = Integer.parseInt(st.nextToken());
		N = Integer.parseInt(st.nextToken());

		wall = new int[N][M];
		map = new int[N][M];

		for (int i = 0; i < N; i++) {
			st = new StringTokenizer(br.readLine());
			for (int j = 0; j < M; j++) {
				wall[i][j] = Integer.parseInt(st.nextToken());
			}
		}


		int num = 1; 
		deque = new ArrayDeque<>();
  }

  public static void bfs(int x, int y, int num) {

  }
```
