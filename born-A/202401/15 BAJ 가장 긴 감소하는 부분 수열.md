import java.util.*;

public class Main {
    
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int[] dp = new int[N];
        
        int[] numbers = new int[N];
        
        for(int i = 0; i < N; i++) {
            numbers[i] = sc.nextInt();
            dp[i] = 1;
        }
        
        int result = 0;
        
        for (int i = 0; i < N; i++){
            for (int j = 0; j < i; j++) {
                if (numbers[j] > numbers[i]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
            result = Math.max(result, dp[i]);
        }
        
        System.out.println(result);
    }
}
