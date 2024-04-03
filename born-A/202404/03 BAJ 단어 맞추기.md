```java
import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder sb = new StringBuilder();

        while(T-- > 0){
            char[] input = br.readLine().toCharArray();
            int lastIdx = input.length - 1;
            int top = lastIdx;
            while(top > 0 && input[top - 1] >= input[top]){
                top--;
            }

            if(top > 0){
                int pos = lastIdx;
                while(input[top-1] >= input[pos]) pos--;

                swap(input, top-1, pos);
                while(top < lastIdx){
                    swap(input, top, lastIdx);
                    top++;
                    lastIdx--;
                }
            }

            for(char c : input){
                sb.append(c);
            }
            sb.append("\n");
        }
        System.out.println(sb);
    }

    public static void swap(char[] input, int i, int j){
        char temp = input[i];
        input[i] = input[j];
        input[j] = temp;
    }
}
```
