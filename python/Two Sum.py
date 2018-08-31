"""

Given an array of integers,return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution,and you may not use the same element twice.

Example:
Given nums  = [2,7,11,15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0,1].

"""

class Solution(object):
	def twosum(self,nums,target):
		"""
		:type nums: List[int]
		:type target: int
		:rtype: List[int]
		"""
		dic = dict()
		for index,value in enumerate(nums):
			y = target - value
			if y in dic:
				return [dic[y],index]
			else:
				dic[value] = index


	def myTwoSum(self,nums,target):
		"""
		:type nums: List[int]
		:type target: int
		:rtype: List[int]
		2+7 = 9
		0,1
		"""
		d = dict()
		#make nums to a hashtable 
		for i,j in enumerate(nums):
			d[j] = i
			k = target - j
			if k in d:
				return [d[k],i]

