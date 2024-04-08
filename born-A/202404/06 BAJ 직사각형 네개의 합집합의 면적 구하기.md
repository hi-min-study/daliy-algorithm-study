```java
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[][] map = new int[101][101];
		int area = 0;
		
		for (int l = 0; l < 4; l++) {
			int a = sc.nextInt();
			int b = sc.nextInt();
			int c = sc.nextInt();
			int d = sc.nextInt();
			for (int i = a+1; i <= c; i++) {
				for (int j = b+1; j <= d; j++) {
					map[i][j] = 1;
				}
			}
		}
		for (int i = 1; i <= 100; i++)
			for (int j = 1; j <= 100; j++) {
				area += map[i][j];
			}
		System.out.println(area);
	}

}
```
