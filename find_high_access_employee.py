from ast import List


class Solution:
    def findHighAccessEmployees(self, access_times: List[List[str]]) -> List[str]:
        n = len(access_times)
        ans = []
        map = {}
        for i in range(n):
            if access_times[i][0] not in map:
                map[access_times[i][0]] = []
            map[access_times[i][0]].append(int(access_times[i][1]))
        for key in map:
            map[key].sort()
            for i in range(len(map[key]) - 2):
                if map[key][i + 2] - map[key][i] < 100:
                    ans.append(key)
                    break
        return ans