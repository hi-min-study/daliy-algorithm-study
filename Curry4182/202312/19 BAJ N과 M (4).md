```java
import java.util.*;

class Main {

	public static int n,m;

	public static StringBuilder sb;

	public static void f(int idx, int selected, int[] c) {

		if(selected == m) {
			for(int i=1; i<=n; i++) {
				for(int j=0; j<c[i]; j++) {
					sb.append(i);
					sb.append(" ");
				}
			}
			sb.append("\n");
			return;
		}

		if (idx > n) {
			return;
		}

		for(int i=m-selected; i>=1; i--) {
			c[idx] = i;
			f(idx+1, selected+i, c);
		}
		c[idx] = 0;
		f(idx+1, selected, c);
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		n = scanner.nextInt();
		m = scanner.nextInt();

		sb = new StringBuilder();

		int[] c = new int[n+1];

		f(1, 0, c);

		System.out.println(sb);
	}
}
```