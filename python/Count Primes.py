"""

Description:

Count the number of prime numbers less than  a non-negative number,n

"""

"""统计比n小的质数有多少，首先设置一个数组，全部置为True，然后遍历 2 - sqrt(n) 的数，将他们的倍数
所在的位置置为False
"""

class Solution(object):
	def countPrimes(self,n):
		"""
		:type n:int
		:rtype:int
		"""

		if n < 3:
			return 0
		res = [True] * n
		res[0] = res[1] = False
		for i in range(2,int(math.sqrt(n))+1):
			res[i*i:n:i] = [False] * len(res[i*i:n:i])
		return sum(res)
