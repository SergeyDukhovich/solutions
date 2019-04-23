import UIKit

func isRotation(s1: String, of s2: String) -> Bool {
  guard s1.count == s2.count else { return false }
  let s1s1 = s1 + s1
  return s1s1.contains(s2)
}

let result1 = isRotation(s1: "qqqqqwwqqq", of: "qwwqqqqqqq")
let result2 = isRotation(s1: "bottle water", of: " waterbottle")
let result3 = isRotation(s1: "bottle water", of: "waterbottle")
