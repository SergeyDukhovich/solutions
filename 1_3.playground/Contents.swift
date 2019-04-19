import UIKit

func URLify(str: String) -> String {

  var characters = Array(str)
  var spaceCount = 0

  for c in characters {
    if c == " " {
      spaceCount += 1
    }
  }

  let startCount = characters.count
  var index = characters.count + spaceCount * 2

  let array = Array<Character>(repeating: "z", count: spaceCount * 2)

  characters.append(contentsOf: array)

  for i in 0..<startCount {
    let reversedIndex = startCount - i - 1

    if characters[reversedIndex] == " " {
      characters[index - 3] = "%"
      characters[index - 2] = "2"
      characters[index - 1] = "0"
      index -= 3
    } else {
      characters[index - 1] = characters[reversedIndex]
      index -= 1
    }
  }

  return String(characters)
}

let result1 = URLify(str: "https://google.com")
let result2 = URLify(str: "https://g  oo  gle.co  m")
let result3 = URLify(str: "https://go     ogle.com")
