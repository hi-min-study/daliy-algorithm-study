```java
import java.util.*;

class Main {

  static StringBuilder sb;  

  static int[] arr;

  static boolean[] visit;

  static int n,m;

  public static void f(int idx, int selected, int[] c) {

    if(selected == m) {
      for(int i=0; i<m; i++) {
        sb.append(c[i]);
        if(i != m-1){
          sb.append(" ");
        }
      }
      sb.append("\n");
      return;
    }

    if(idx > n) return;

    for(int i=0; i<n; i++) {
      if(visit[i]) continue;
      c[idx] = arr[i];
      visit[i] = true;
      f(idx+1, selected+1, c);  
      visit[i] = false;
    }
  }
  
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);

    n = sc.nextInt();
    m = sc.nextInt();

    arr = new int[n];
    visit = new boolean[n];

    for(int i=0; i<n; i++) {
      arr[i] = sc.nextInt();
    }

    int[] c = new int[m];
    sb = new StringBuilder();
    Arrays.sort(arr);
    f(0, 0, c);

    System.out.println(sb);
  }
}
```