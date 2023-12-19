## 풀이 1️⃣
```python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        # 최솟값을 구해서 피벗으로 설정
        left: int = 0
        right: int = len(nums) - 1
        while left < right:
            mid: int = (left + right) // 2

            if nums[mid] > nums[right]:
                left = mid + 1
            else:
                right = mid

        pivot: int = left

        # 피벗 기준 이진 검색
        left, right = 0, len(nums) - 1
        while left <= right:
            mid: int = (left + right) // 2
            mid_privot: int = (mid + pivot) % len(nums)

            if nums[mid_privot] < target:
                left = mid + 1
            elif nums[mid_privot] > target:
                right = mid - 1
            else:
                return mid_privot

        return -1
```

## 풀이 2️⃣
```python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        # 최솟값을 구해서 피벗으로 설정
        pivot:int = nums.index(min(nums))
            
        # 피벗 기준 이진 검색
        left, right = 0, len(nums) - 1
        while left <= right:
            mid: int = (left + right) // 2
            mid_pivot: int = (mid + pivot) % len(nums)
            
            if nums[mid_pivot] < target:
                left = mid + 1
            elif nums[mid_pivot] > target:
                right = mid - 1
            else:
                return mid_pivot
        
        return -1
```