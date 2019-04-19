
var str = "🙌🙌qwertyuiop"

func isAllCharactersUnique(string: String, unicodeOnly: Bool = false) -> Bool {
  guard unicodeOnly, string.count > 128 else { return false }

//  if we could use extra data structures
//  var dict: [String.Element: Bool] = [:]
//
//  for element in str.enumerated() {
//    let letter = element.element
//    if dict[letter] != nil {
//      return false
//    } else {
//      dict[letter] = true
//    }
//  }

  for i in 0..<str.count {
    for j in i..<str.count {
      let index = str.index(str.startIndex, offsetBy: i)
      let jndex = str.index(str.startIndex, offsetBy: j)

      let letterI = str[index]
      let letterJ = str[jndex]

      if letterI == letterJ {
        return false
      }
    }
  }

  return true
}

let unique = isAllCharactersUnique(string: str)

//for i in 0..<256 {
//  if let symbol = UnicodeScalar(i) {
//    print("\(i): \(symbol.escaped(asASCII: true))")
//  }
//}
