class Solution:
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        start = maxLen = 0
        char_dict = {}
        for i in range(len(s)):
            if s[i] in char_dict and start<=char_dict[s[i]]: #重复字符出现,将start移动到重复字符出现的后一位
                start = char_dict[s[i]] + 1
            if i-start+1 > maxLen:  #i-start+1代表子串的长度
                maxLen = i-start+1
            char_dict[s[i]] = i  #保存字符串中每个字符所在的index
        return maxLen
