```java
import java.util.*;

class Main {

  static StringBuilder sb;  
  static int[] arr;
  static int n, m;
  
  public static void f(int idx, int selected, int[] c) {

    if(selected == m) {
      for(int i=0; i<m; i++) {
        sb.append(c[i]);

        if(i != m-1) {
          sb.append(" ");
        }
      }
      sb.append("\n");
      return;
    }

    if(idx>n-1) {
      return;
    }
    
    c[selected] = arr[idx];
    f(idx+1, selected+1, c);
    f(idx+1, selected, c);
  }

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    n = scanner.nextInt();
    m = scanner.nextInt();

    arr = new int[n];
    for(int i=0;i<arr.length;i++) {
      arr[i] = scanner.nextInt();
    }

    Arrays.sort(arr);

    int[] c = new int[m];

    sb = new StringBuilder();
    f(0, 0, c);
    System.out.println(sb);
  }
}
```