import UIKit

//case sensetive: "Hello" != "hello"
//including spaces "qw erty" != "qwerty"; "qw erty" == "qwer ty"

func checkPermutation(s1: String, s2: String) -> Bool {
  if s1.count != s2.count {
    return false
  }

  var dictionary: [Character: Int] = [:]

  for i in 0..<s1.count {
    let letter = s1[s1.index(s1.startIndex, offsetBy: i)]

    if let currentCount = dictionary[letter] {
      dictionary[letter] = currentCount + 1
    } else {
      dictionary[letter] = 1
    }
  }

  for i in 0..<s2.count {
    let letter = s2[s2.index(s2.startIndex, offsetBy: i)]
    if let currentCount = dictionary[letter] {
      dictionary[letter] = currentCount - 1
    } else {
      return false
    }
  }

  for enumerator in dictionary.enumerated() {
    let (_, value) = enumerator.element
    if value != 0 {
      return false
    }
  }

  return true
}

let shouldBeTrue = checkPermutation(s1: "Hello🙌, playground", s2: "ello, 🙌playgroundH")
let shouldBeFalse = checkPermutation(s1: "Hello, playground", s2: "ello,playgroundH")
let shouldBeTrue1 = checkPermutation(s1: "playgr ound🙌", s2: "🙌pl aydgroun")
let shouldBeFalse1 = checkPermutation(s1: "playground", s2: "playgrounD")
