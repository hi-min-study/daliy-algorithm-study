```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    int idx;
    int[] arr;
    // 순서, 선택한 발 (0 : 왼 1 : 오)
    int[][][] dp;

    private int getScore(int from, int to) {
        int num = Math.abs(from-to);
        if(from ==0) return 2;
        else if(num == 0) return 1;
        else if(num == 1|| num == 3) return 3;
        else return 4;
    }

    private int get(int select, int i, int bl, int br) {
        if(select == 0) {
            return getScore(i, bl);
        }
        return getScore(i, br);
    }

    // 예전에 무엇을 선택했냐에 따라 현재 값들이 달라짐.
    // c : 현재 값 (다음 값의 b로 넘길 때 사용)
    // b : 과거 값 (계산에 사용)
    private int dfs(int depth, int l, int r) {
        if(dp[depth][l][r] != 0) {
            return dp[depth][l][r];
        }

        if(depth == idx) {
            return 0;
        }

        int left = dfs(depth + 1, arr[depth], r) + getScore(l, arr[depth]);
        int right = dfs(depth + 1, l, arr[depth]) + getScore(r, arr[depth]);

        return dp[depth][l][r] = Math.min(left, right);
    }

    private void solution() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        arr = new int[100001];
        dp = new int[100001][5][5];
        idx = 0;
        while(true) {
            int val = Integer.parseInt(st.nextToken());
            if(val == 0) {
                break;
            }
            arr[idx] = val;
            idx++;
        }
        System.out.println(dfs(0, 0, 0));
    }

    public static void main(String[] args) throws IOException {
        new Main().solution();
    }

}
```