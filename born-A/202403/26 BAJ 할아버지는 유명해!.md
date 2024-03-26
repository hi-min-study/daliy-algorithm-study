```java
import java.io.*;
import java.util.*;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        int[] score = new int[10001];

        while(true) {
            st = new StringTokenizer(br.readLine());
            int N = Integer.parseInt(st.nextToken());
            int M = Integer.parseInt(st.nextToken());
            int first = Integer.MIN_VALUE;
            int second = Integer.MIN_VALUE;

            score = new int[10001];

            if(N == 0 && M == 0)
                break;

            for (int i = 0; i < N; i++) {
                st = new StringTokenizer(br.readLine());
                for (int j = 0; j < M; j++) {
                    int idx = Integer.parseInt(st.nextToken());
                    score[idx]++;
                }
            }

            for (int i = 1; i < 10001; i++) {
                first = Math.max(first, score[i]);
            }

            for (int i = 1; i < 10001; i++) {
                if(score[i] != first){
                    second = Math.max(second, score[i]);
                }
            }

            for (int i = 1; i < 10001; i++) {
                if(score[i] == second)
                    sb.append(i+" ");
            }

            sb.append("\\n");
        }
        System.out.println(sb.toString());
    }
}
```
