class Solution:
    def distanceTraveled(self, mainTank: int, additionalTank: int) -> int:
        ans = 0
        while mainTank >= 5:
            mainTank -= 5
            ans += 50
            if additionalTank > 0:
                additionalTank -= 1
                mainTank += 1
        return ans + mainTank * 10
