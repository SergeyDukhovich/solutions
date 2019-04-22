import UIKit

func isOneWay(str1: String, str2: String) -> Bool {
  if str1.count == str2.count {
    return isOneWayReplace(str1: str1, str2: str2)
  } else if str1.count - 1 == str2.count {
    return isOneWayRemove(bigger: str1, smaller: str2)
  } else if str1.count + 1 == str2.count {
    return isOneWayRemove(bigger: str2, smaller: str1)
  } else {
    return false
  }
}

func isOneWayReplace(str1: String, str2: String) -> Bool {
  var foundDifference = false
  guard str1.count == str2.count else { return false }
  let array1 = Array(str1)
  let array2 = Array(str2)

  for i in 0..<array1.count {
    if array1[i] != array2[i] {
      if (foundDifference) {
        return false
      }
      foundDifference = true
    }
  }
  return true
}

func isOneWayRemove(bigger: String, smaller: String) -> Bool {
  guard smaller.count + 1 == bigger.count else { return false }
  var indexB = 0
  var indexS = 0
  let arrayB = Array(bigger)
  let arrayS = Array(smaller)
  while indexB < bigger.count, indexS < smaller.count {
    if arrayB[indexB] != arrayS[indexS] {
      if indexB != indexS {
        return false
      }
      indexB += 1
    } else {
      indexB += 1
      indexS += 1
    }
  }
  return true
}

let result1 = isOneWay(str1: "qwertyuiop", str2: "qwertyuiop")
let result2 = isOneWay(str1: "apple", str2: "aple")
let result3 = isOneWay(str1: "zaq", str2: "zop")
