import UIKit

struct ThreeInOne {

  typealias Item = Int

  private let stacksCount = 3
  private var array: [Int] = []
  private var numberOfItems: [Int: Int] = [:]

  init() {
    for i in 0..<3 {
      numberOfItems[i] = 0
    }
  }

  mutating func pop(stackIndex: Int = 0) -> Item? {
    guard let count = numberOfItems[stackIndex],
      count > 0,
      let index = getIndex(for: stackIndex) else { return nil }

    let value = array.remove(at: index)
    numberOfItems[stackIndex] = count - 1
    return value
  }

  mutating func push(item: Item, stackIndex: Int = 0) {
    guard let count = numberOfItems[stackIndex],
      let index = putIndex(for: stackIndex) else { return }

    array.insert(item, at: index)
    numberOfItems[stackIndex] = count + 1
  }

  func peek(stackIndex: Int = 0) -> Item? {
    guard let index = getIndex(for: stackIndex) else { return nil }
    return array[index]
  }

  func isEmpty(stackIndex: Int = 0) -> Bool {
    guard let count = numberOfItems[stackIndex] else { return true }
    return count == 0
  }

  private func putIndex(for stackIndex: Int = 0) -> Int? {
    guard let _ = numberOfItems[stackIndex] else { return nil }
    var index = 0
    for i in 0...stackIndex {
      if let count = numberOfItems[i] {
        index += count
      }
    }
    return index
  }

  private func getIndex(for stackIndex: Int = 0) -> Int? {
    guard let _ = numberOfItems[stackIndex] else { return nil }
    var index = 0
    for i in 0...stackIndex {
      if let count = numberOfItems[i] {
        index += count
      }
    }
    if index > 0 {
      return index - 1
    } else {
      return nil
    }
  }
}

var stack = ThreeInOne()

var peek1 = stack.peek(stackIndex: 0)
var peek2 = stack.peek(stackIndex: 1)
var peek3 = stack.peek(stackIndex: 2)

stack.push(item: 10, stackIndex: 1)
stack.push(item: 11, stackIndex: 1)
stack.push(item: 12, stackIndex: 1)
stack.push(item: 13, stackIndex: 1)

print(stack)

stack.push(item: 20, stackIndex: 2)
stack.push(item: 21, stackIndex: 2)
stack.push(item: 22, stackIndex: 2)
stack.push(item: 23, stackIndex: 2)

print(stack)

peek1 = stack.peek(stackIndex: 0)
peek2 = stack.peek(stackIndex: 1)
peek3 = stack.peek(stackIndex: 2)

_ = stack.pop(stackIndex: 1)
print(stack)
_ = stack.pop(stackIndex: 1)
print(stack)
_ = stack.pop(stackIndex: 1)
print(stack)
_ = stack.pop(stackIndex: 1)
print(stack)

peek1 = stack.peek(stackIndex: 0)
peek2 = stack.peek(stackIndex: 1)
peek3 = stack.peek(stackIndex: 2)

stack.isEmpty(stackIndex: 0)
stack.isEmpty(stackIndex: 1)
stack.isEmpty(stackIndex: 2)

stack.push(item: 0)
stack.push(item: 10, stackIndex: 1)

print(stack)
