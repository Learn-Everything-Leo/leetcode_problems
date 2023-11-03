class Solution:
    def countPoints(self, rings: str) -> int:
        POLE_NUM = 10
        mapping = {'R': 0, 'G': 1, 'B': 2}
        state = [0] * POLE_NUM
        for i in range (0, len(rings), 2):
            color = rings[i]
            pole_index = ord(rings[i + 1]) - ord('0')
            state[pole_index] |= 1 << mapping[color]
        return sum(state[i] == 7 for i in range(POLE_NUM))
