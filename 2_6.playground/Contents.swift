import UIKit

typealias IntNode = Node<Int>

class Node<T>: CustomStringConvertible {

  var value: T
  var next: Node<T>?

  init(value: T) {
    self.value = value
  }

  var description: String {
    return "\(value);\(next?.description ?? "")"
  }
}

func seed(nodesNumer: Int, range: Range<Int> = 0..<100) -> IntNode {
  var count = nodesNumer
  let head = IntNode(value: Int.random(in: range))
  var current: IntNode? = head
  while count > 1 {
    current?.next = IntNode(value: Int.random(in: range))
    current = current?.next
    count -= 1
  }
  return head
}

func isPolindrome(head: IntNode) -> Bool {
  var last: IntNode? = head
  var length = 1

  while last?.next != nil {
    last = last?.next
    length += 1
  }

  var current: IntNode? = head

  for i in 0..<length/2 {
    guard let v1 = current?.value, let v2 = last?.value, v1 == v2 else {
      return false
    }

    if i != length/2 - 1 {
      current = current?.next
      var end = current
      while end?.next !== last {
        end = end?.next
      }
      last = end
    }
  }

  return true
}

for i in 0..<100 {
  let list1 = seed(nodesNumer: 5, range: 0..<6)
  let result1 = isPolindrome(head: list1)

  if result1 {
    print("----------------\(i)")
    print(list1)
    print(result1)
  }
}

for i in 0..<100 {
  let list1 = seed(nodesNumer: 7, range: 0..<4)
  let result1 = isPolindrome(head: list1)

  if result1 {
    print("----------------\(i)")
    print(list1)
    print(result1)
  }
}

print("done")

