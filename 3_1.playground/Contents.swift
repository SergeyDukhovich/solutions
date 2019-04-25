import UIKit

struct Stack<T> {
  private var innterArray = Array<T>()

  mutating func pop() -> T? {
    return innterArray.popLast()
  }

  func top() -> T? {
    return innterArray.last
  }

  mutating func push(item: T) {
    innterArray.append(item)
  }

  func isEmpty() -> Bool {
    return innterArray.isEmpty
  }
}


