```java
import java.util.*;

class Solution {
    public int solution(String s) {
        int answer = 0;
                
        Queue<String> queue = new LinkedList<>();
        
        for(int i = 0; i < s.length(); i++){
            String str = s.substring(i,i+1);
            queue.add(str);
        }
        
        
        for(int i = 0; i < s.length(); i++){
            String firstStr = queue.poll();
            queue.add(firstStr);
            
            Stack<String> stack = new Stack<>();
            
            for(int j = 0; j < s.length(); j++){
                String waitingStr = queue.poll();
                queue.add(waitingStr);
                
                if(stack.isEmpty()){
                    stack.push(waitingStr);
                } 
                else if(waitingStr.equals(")") && stack.peek().equals("(")){
                    stack.pop();
                }
                else if(waitingStr.equals("]") && stack.peek().equals("[")){
                    stack.pop();
                }
                else if(waitingStr.equals("}") && stack.peek().equals("{")){
                    stack.pop();
                }
                else{
                    stack.push(waitingStr);
                }
                
            }
            
            if(stack.isEmpty()){
                answer++;
            }
            
        }
        
        return answer;
    }
}
```
