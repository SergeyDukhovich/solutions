import UIKit

typealias IntNode = Node<Int>

class Node<T>: CustomStringConvertible {

  let value: T
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

let list1 = seed(nodesNumer: 10, range: 0..<50)
print(list1)

func lastNode(head: IntNode, shifted: Int = 0) -> IntNode? {
  var index = shifted
  var current: IntNode? = head
  var result: IntNode? = nil

  while current?.next != nil {
    if index > 0 {
      index -= 1
    } else if result == nil {
      result = head
    }
    current = current?.next
    result = result?.next
  }
  return result
}

let last = lastNode(head: list1)
print(last)

let node = lastNode(head: list1, shifted: 3)
print(node)

let node2 = lastNode(head: list1, shifted: 15)
print(node2)
