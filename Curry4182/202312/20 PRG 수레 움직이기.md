
```java
import java.util.*;

public class Solution {    
	class Item {
		public int redY;
		public int redX;
		public int blueY;
		public int blueX;
		public int cnt;

		public Item(
			int redY,
			int redX,
			int blueY,
			int blueX,
			int cnt
		) {
			this.redY = redY;
			this.redX = redX;
			this.blueY = blueY;
			this.blueX = blueX;
			this.cnt = cnt;
		}

		public Item() {
		}
	}
    
    public int endBlueY=0, endBlueX=0, endRedY=0, endRedX=0;

	static boolean[][][] visitRed = new boolean[10000][10][10];
    static boolean[][][] visitBlue = new boolean[10000][10][10];


	static int[] nextY = {-1, 0, 1, 0};
	static int[] nextX = {0, 1, 0, -1};
    static int[][] blueCnt = new int[10][10];

	public int yLen;
	public int xLen;

	public int[][] maze;

	public boolean isRange(int y, int x) {
		if(-1 < y && y < yLen &&  -1 < x && x < xLen) {
			return maze[y][x] != 5;
		}

		return false;
	}
    
    public boolean isRedVisit(int y, int x, int cnt) {
        if(y==endRedY && x==endRedX) {
            return false;
        }
        
        for(int i=cnt; i>-1; i--) {
            if(visitRed[i][y][x]) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isBlueVisit(int y, int x, int cnt) {
        if(y==endBlueY && x==endBlueX) {
            return false;
        }
        
        for(int i=cnt; i>-1; i--) {
            if(visitBlue[i][y][x]) {
                return true;
            }
        }
        return false;
    }

	public int solution(int[][] maze) {
		this.maze = maze;
		yLen = maze.length;
		xLen = maze[0].length;

		Item startItem = new Item();
		startItem.cnt = 0;

		Queue<Item> que = new LinkedList<>();

		for(int y=0; y<yLen; y++) {
			for(int x=0; x<xLen; x++) {
				if (maze[y][x] == 1) { // red
                    visitRed[0][y][x] = true;
					startItem.redY = y;
					startItem.redX = x;
				}

				if (maze[y][x] == 2) { // blue
                    visitBlue[0][y][x] = true;
					startItem.blueY = y;
					startItem.blueX = x;
				}

				if (maze[y][x] == 3) { // red
					endRedY = y;
					endRedX = x;
				}

				if (maze[y][x] == 4) { // blue
					endBlueY = y;
					endBlueX = x;
				}
			}
		}

		que.offer(startItem);

		while(true) {

			Item curItem = que.poll();
			int nextRedY = curItem.redY;
			int nextRedX = curItem.redX;
			int nextBlueY = curItem.blueY;
			int nextBlueX = curItem.blueX;
            List<Item> nextItems = new ArrayList<>();

			// 빨강 이동
			for (int i = 0; i<4; i++) {

				// 빨강이 끝점에 있지 않다.
				if (curItem.redY != endRedY || curItem.redX != endRedX) {
					nextRedY = curItem.redY + nextY[i];
					nextRedX = curItem.redX +  nextX[i];
				}

				// 규칙1. 격자 밖에 있는가?
				if(!isRange(nextRedY,nextRedX)) {
					continue;
				}

				// 규칙2. 방문 했던 곳인가?
				if(isRedVisit(nextRedY, nextRedX, curItem.cnt) ) {
					continue;
				}


				// 파랑 이동
				for (int j=0; j<4; j++) {


					// 파랑이 끝점에 있지 않다.
					if (curItem.blueY != endBlueY || curItem.blueX != endBlueX) {
						nextBlueY = curItem.blueY + nextY[j];
						nextBlueX = curItem.blueX + nextX[j];
					}

					// 규칙1. 격자 밖에 있는가?
					if(!isRange(nextBlueY, nextBlueX)) {
						continue;
					}

					// 규칙2. 방문 했던 곳인가?
					if(isBlueVisit(nextBlueY, nextBlueX, curItem.cnt)) {
                        blueCnt[nextBlueY][nextBlueX] += 1;
                        if(blueCnt[nextBlueY][nextBlueX]>1) {
                            continue;
                        }
                    }

					// 규칙4. 동시에 같은 곳에 도착하는가?
					if(nextBlueY == nextRedY &&
						nextBlueX == nextRedX) {
						continue;
					}

					// 규칙5. 수레끼리 자리를 바꾸는 가?
					if(
						(curItem.blueY == nextRedY && curItem.blueX == nextRedX)
							&& (curItem.redY == nextBlueY && curItem.redX == nextBlueX)
					){
						continue;
					}

					// 규칙을 모두 만족한 nextItem

					// 도착 하였는가?
					if (nextRedY == endRedY && nextRedX == endRedX
						&& nextBlueY == endBlueY && nextBlueX == endBlueX) {
						return curItem.cnt+1;
					}

					Item nextItem = new Item(
						nextRedY, nextRedX, nextBlueY, nextBlueX, curItem.cnt + 1
					);
                    
                    visitRed[curItem.cnt+1][nextRedY][nextRedX] = true;
                    visitBlue[curItem.cnt+1][nextBlueY][nextBlueX] = true;
					que.add(nextItem);
				}
			}

			if(que.size() == 0) {
				return 0;
			}
		}

	}
}
```