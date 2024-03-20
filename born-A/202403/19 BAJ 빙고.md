```java
import java.util.*;
import java.io.*;

public class Main {
    static int count = 0;
    static int[][] origin = new int[5][5];
    
    public static void main(String[] args) throws IOException{
        Scanner sc = new Scanner(System.in);
        
        for(int i = 0; i < 5; i++) {
            for(int j = 0; j < 5; j++) {
                int k = sc.nextInt();
                origin[i][j] = k;
            }
        }
        
        for(int k = 1; k <= 25; k++) {
            int n = sc.nextInt();
            for(int i = 0; i < 5; i++) {
                for(int j = 0; j < 5; j++) {
                    if(n == origin[i][j]) origin[i][j] = 0;
                }
            }
            
            rcheck();
            lcheck();
            lsideCheck();
            rsideCheck();
            
            if(count >= 3) {
                System.out.println(k);
                break;
            }
            count = 0;
        }
        
    }
    
    static void rcheck() {
        for(int i = 0; i < 5; i++) {
            int zeroCount = 0;
            for(int j = 0; j < 5; j++) {
                if(origin[i][j]== 0) zeroCount++; 
            }
            if(zeroCount == 5) count++;
        }
    }
    
    static void lcheck() {
        for(int i = 0; i < 5; i++) {
            int zeroCount = 0;
            for(int j = 0; j < 5; j++) {
                if(origin[j][i] == 0) zeroCount++; 
            }
            if(zeroCount == 5) count++;
        }
    }
    
    static void lsideCheck() {
        int zeroCount = 0;
        for(int i = 0; i < 5; i++) {
                if(origin[i][i]== 0) zeroCount++; 
        }
        if(zeroCount == 5) count++;
    }
    
    static void rsideCheck() {
        int zeroCount = 0;
        for(int i = 0; i < 5; i++) {
            if(origin[i][4-i]== 0) zeroCount++; 
        }
        if(zeroCount == 5) count++;
    }
}
```
