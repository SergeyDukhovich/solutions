import UIKit

var str = "Hello, playground"

func compress(string: String) -> String {
  let input = Array(string)

  var totalCompressionCount = 0
  var index = 0

  var output = ""

  while index < input.count {
    var compressionCount = 1
    while index + compressionCount < input.count, input[index] == input[index+compressionCount] {
      compressionCount += 1
      totalCompressionCount += 1
    }
    output += "\(input[index])\(compressionCount)"
    index += compressionCount
  }
  if totalCompressionCount > 0 {
    return output
  } else {
    return String(input)
  }
}

let result1 = compress(string: str)
let result2 = compress(string: "qwertyuiopPOIUYTREWQ")
let result3 = compress(string: "QQQQQqqqQQQQQQQqqqeetastrtrtttttrrrtt")
