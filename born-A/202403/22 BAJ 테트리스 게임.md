```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
	static long Map[][] = new long[100][100];
	static int N;
	static long ans;

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		StringTokenizer st;

		boolean block[][][] = { 
				{ { true, true, true, true } }, 
				{ { true, true, false }, { false, true, true } },
				{ { true, true, true }, { false, false, true } }, 
				{ { true, true, true }, { false, true, false } },
				{ { true, true }, { true, true } } };
		int t=0;
		while (0 != (N = Integer.parseInt(br.readLine().trim()))) {

			for (int i = 0; i < N; i++) {
				st = new StringTokenizer(br.readLine().trim());
				for (int j = 0; j < N; j++) {
					Map[i][j] = Long.parseLong(st.nextToken().trim());
				}
			}
			
			ans = Long.MIN_VALUE;
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					for (int k = 0; k < 5; k++) {
						for (int d = 0; d < 4; d++) {
							ans = Math.max(ans, Solve(i,j,block[k]));
							//rotate
							block[k] = Rotate(block[k]);
							
						}
					}
				}
			}
			sb.append(++t).append('.').append(' ');
			sb.append(ans).append('\n');
		}
		System.out.println(sb.toString());
	}

	public static boolean[][] Rotate(boolean[][] block) {
		int r = block.length;
		int c = block[0].length;
		boolean copy[][] = new boolean[c][r];

		for (int i = 0; i < c; i++) {
			for (int j = 0; j < r; j++) {
				copy[i][j] = block[r-1-j][i];
			}
		}

		return copy;
	}

	public static long Solve(int y, int x, boolean[][] block) {
		int r = block.length;
		int c = block[0].length;

		if (y + r > N)
			return Long.MIN_VALUE;
		if (x + c > N)
			return Long.MIN_VALUE;
		
		long cnt = 0;

		for (int i = y, rr = 0; i < y + r && rr < r; i++, rr++) {
			for (int j = x, cc = 0; j < x + c && cc < c; j++, cc++) {
				if (block[rr][cc]) {
					cnt += Map[i][j];
				}
			}
		}
		
		return cnt;
	}
}
```
