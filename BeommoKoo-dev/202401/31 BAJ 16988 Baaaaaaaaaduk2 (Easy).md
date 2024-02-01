```java

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class Main {

    int n, m;
    int[][] map;
    int[][] selected;
    boolean[][] visited;
    int ans;
    int[] dx = {0, 1, 0, -1};
    int[] dy = {1, 0, -1, 0};

    class Pair {
        int x, y;

        public Pair(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

    private void input() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());
        map = new int[n][m];
        visited = new boolean[n][m];
        for (int i = 0; i < n; i++) {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < m; j++) {
                map[i][j] = Integer.parseInt(st.nextToken());
            }
        }
        selected = new int[2][2];
    }

    private boolean isInRange(int x, int y) {
        if (x < 0 || y < 0 || x >= n || y >= m) {
            return false;
        }
        return true;
    }

    private int bfs(int sx, int sy) {
        Queue<Pair> q = new LinkedList<>();
        q.add(new Pair(sx, sy));
        visited[sx][sy] = true;

        int count = 1;
        boolean flag = true;

        while (!q.isEmpty()) {
            Pair p = q.poll();
            int x = p.x;
            int y = p.y;

            for (int i = 0; i < 4; i++) {
                int nx = x + dx[i];
                int ny = y + dy[i];

                if (!isInRange(nx, ny) || visited[nx][ny] || map[nx][ny] == 1) {
                    continue;
                }

                // 둘러쌓여진게 아님.
                if (map[nx][ny] == 0) {
                    flag = false;
                    continue;
                    // 미리 break하면 현재 2만 visited 처리해버리고
                    // 나머지 둘러쌓이지 않은 2들은 visited처리를 못한다.
                    // break;
                }

                count++;
                visited[nx][ny] = true;
                q.add(new Pair(nx, ny));
            }

            // if (!flag) {
            //     break;
            // }
        }
        if (!flag) {
            count = 0;
        }
        return count;
    }

    private void dfs(int depth, int idx) {
        if (depth == 2) {
            for (int i = 0; i < n; i++) {
                Arrays.fill(visited[i], false);
            }
            int count = 0;
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    if (!visited[i][j] && map[i][j] == 2) {
                        count += bfs(i, j);
                    }
                }
            }
            ans = Math.max(ans, count);
            return;
        }

        for (int i = idx; i < n * m; i++) {
            int x = i / m;
            int y = i % m;
            if (map[x][y] != 0) {
                continue;
            }
            selected[depth][0] = x;
            selected[depth][1] = y;
            map[x][y] = 1;

            dfs(depth + 1, i + 1);
            map[x][y] = 0;
        }
    }

    private void solution() throws IOException {
        input();
        dfs(0, 0);
        System.out.println(ans);
    }

    public static void main(String[] args) throws IOException {
        new Main().solution();
    }

}


```