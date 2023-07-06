import 'dart:collection';
import 'dart:math';

class Solution {
  bool canMeasureWater(int jug1Capacity, int jug2Capacity, int targetCapacity) {
    List<List<int>> stateList = [
      [0, 0]
    ];
    HashSet<int> stateHashSet = HashSet();
    while (stateList.isNotEmpty) {
      List<int> state = stateList.removeLast();
      if (state[0] == targetCapacity ||
          state[1] == targetCapacity ||
          state[0] + state[1] == targetCapacity) {
        return true;
      }
      int stateHash = hash(state);
      if (stateHashSet.contains(stateHash)) {
        continue;
      }
      stateHashSet.add(stateHash);

      stateList.add([0, state[1]]);
      stateList.add([state[0], 0]);
      stateList.add([jug1Capacity, state[1]]);
      stateList.add([state[0], jug2Capacity]);
      stateList.add([state[0] - min(state[0], jug2Capacity - state[1]), state[1] + min(state[0], jug2Capacity - state[1])]);
      stateList.add([state[0] + min(state[1], jug1Capacity - state[0]), state[1] - min(state[1], jug1Capacity - state[0])]);
    }
    return false;
  }

  int hash(List<int> state) {
    return state[0] * 1000001 + state[1];
  }
}
