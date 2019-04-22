import UIKit

func rotate(array: inout [Int], n: Int) {
  guard array.count == n * n else { return }

  let halfI = n % 2 == 0 ? n/2 : n/2 + 1
  let halfJ = n/2


  for i in 0..<halfI {
    for j in 0..<halfJ {
      let topLeftIndex = j + i * n
      let topRightIndex = (j + 1 ) * n - i - 1
      let bottomRightIndex = (n - i) * n - j - 1
      let bottomLeftIndex = (n - 1 - j) * n + i

      let topLeftValue = array[topLeftIndex]
      let topRightValue = array[topRightIndex]
      let bottomRightValue = array[bottomRightIndex]
      let bottomLeftValue = array[bottomLeftIndex]

      array[topLeftIndex] = bottomLeftValue
      array[topRightIndex] = topLeftValue
      array[bottomRightIndex] = topRightValue
      array[bottomLeftIndex] = bottomRightValue

//      //could be
//      let topLeftValue = array[topLeftIndex]
//
//      array[topLeftIndex] = array[topRightIndex]
//      array[topRightIndex] = array[bottomLeftIndex]
//      array[bottomLeftIndex] = array[bottomRightIndex]
//      array[bottomRightIndex] = topLeftValue
    }
  }
}

var array1 = [0, 1, 2, 3]
rotate(array: &array1, n: 2)
print(array1)

var array2 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
rotate(array: &array2, n: 3)
print(array2)

var array3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
rotate(array: &array3, n: 4)
print(array3)

rotate(array: &array3, n: 4)
rotate(array: &array3, n: 4)
rotate(array: &array3, n: 4)
print(array3)

