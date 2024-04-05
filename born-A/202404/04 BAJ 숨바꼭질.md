```java
import java.util.*;
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());

        if (n == k) {
            System.out.println(0);
            return;
        }

        boolean[] visited = new boolean[100001];
        visited[n] = true;

        Queue<Integer> q = new LinkedList<>();
        q.add(n);

        int size = q.size();
        int count = 0;

        while (true) {
            count++;
            size = q.size();

            for (int i = 0; i < size; i++) {
                int x = q.remove();
                visited[x] = true;

                if (x-1 == k || x+1 == k || x*2 == k) {
                    System.out.println(count);
                    return;
                }

                if (x-1 >= 0 && !visited[x-1]) {
                    visited[x-1] = true;
                    q.add(x-1);
                }

                if (x+1 <= 100000 && !visited[x+1]) {
                    visited[x+1] = true;
                    q.add(x+1);
                }

                if (x*2 <= 100000 && !visited[x*2]) {
                    visited[x*2] = true;
                    q.add(x*2);
                }
            }
        }
    }
}
```
