import UIKit

func zeroMatrix(array: inout [Int], n: Int) {
  guard array.count == n * n else { return }

  var zeroJs: [Int: Bool] = [:]
  var zeroIs: [Int: Bool] = [:]

  for i in 0..<n {
    for j in 0..<n {
      if array[i + j * n] == 0 {
        zeroJs[j] = true
        zeroIs[i] = true
      }
    }
  }

  for enumerator in zeroJs.enumerated() {
    let j = enumerator.element.key
    for i in 0..<n {
      array[i + n * j] = 0
    }
  }

  for enumerator in zeroIs.enumerated() {
    let i = enumerator.element.key
    for j in 0..<n {
      array[i + j * n] = 0
    }
  }
}

var array1 = [1, 1, 2, 3, 4, 5, 6, 7, 8, 0, 10, 11, 12, 13, 14, 15]
zeroMatrix(array: &array1, n: 4)
print(array1)

var array3 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
zeroMatrix(array: &array3, n: 4)
print(array3)

var array2 = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 0]
zeroMatrix(array: &array2, n: 4)
print(array2)
