```java
import java.util.*;

class Main {

  public static int n, m;

  public static StringBuilder sb;

  public static void f(int idx, int[] arr) {

    if(idx == m) {
      for(int i=0; i<m; i++) {
        sb.append(arr[i]);
        if(i != m-1) {
          sb.append(" ");
        }
      }
      sb.append("\n");
      return;
    }

    for(int i=1; i<=n; i++) {
      arr[idx] = i;
      f(idx+1, arr);
    }
  }
  
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    sb = new StringBuilder();
    n = scanner.nextInt();
    m = scanner.nextInt();

    int[] arr = new int[m];
    f(0, arr);
    System.out.print(sb);
  }
}
```