class Solution:
    def filterRestaurants(self, restaurants: List[List[int]], veganFriendly: int, maxPrice: int, maxDistance: int) -> List[int]:
        restaurants.sort(key=lambda x: (x[1], x[0]), reverse=True)
        filtered_restaurants = list(filter(lambda x: x[2] >= veganFriendly and x[3] <= maxPrice and x[4] <= maxDistance, restaurants))
        return [r[0] for r in filtered_restaurants]