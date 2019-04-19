import UIKit

func isPalindrome(str: String) -> Bool {
  let characters = Array(str)

  var spacesOmittedBegining = 0
  var spacesOmittedEnd = 0

  for i in 0..<characters.count/2 {
    while characters[i + spacesOmittedBegining] == " " {
      spacesOmittedBegining += 1
    }

    while characters[characters.count - 1 - i - spacesOmittedEnd] == " " {
      spacesOmittedEnd += 1
    }

    if spacesOmittedBegining + spacesOmittedEnd + i * 2 > characters.count {
      break
    }

    let firstLetter = characters[i + spacesOmittedBegining]
    let lastLetter = characters[characters.count - 1 - i - spacesOmittedEnd]

    if firstLetter != lastLetter {
      return false
    }
  }

  return true
}

let result1 = isPalindrome(str: "starttrats")
let result2 = isPalindrome(str: "start trat s")
let result3 = isPalindrome(str: " sta rt_                             trat s")
