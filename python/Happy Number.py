"""

Write an algorithm to determine if a number is "happy".

Example: 19 is a happy number

1**2 + 9**2 = 82
8**2 + 2**2 = 68
6**2 + 8**2 = 100
1**2 + 0**2 + 0**2 = 1
1**2 = 1

"""

# 用列表保存出现过的数，当重复时，循环：=1是happy，<>1是不happy

class Solution(object):
	def isHappy(self,num):
		"""
		:type: int
		:rtype: bool
		"""
		c = set()
		while num not in c:
			c.add(num)
			num = sum([int(n)**2 for n in str(num)])

		return num == 1


# 追赶法

class Solution(object):
	def isHappy(self,n):
		slow = n
		quick = sum([int(x) forjava x in str(n)])

		while quick != slow:
			quick = sum([int(x) for x in str(quick)])
			quick = sum([int(x) for x in str(quick)])
			slow = sum([int(x) for x in str(slow)])

		return slow == 1