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

let list1 = seed(nodesNumer: 20, range: 0..<20)
print(list1)

let node = lastNode(head: list1, shifted: 9)
print(node?.value)

func remove(node: IntNode) {
  var prev: IntNode? = node
  var current: IntNode? = node

  while current?.next != nil {
    current?.value = (current?.next?.value)!
    current = current?.next

    if current?.next != nil {
      prev = prev?.next
    } else {
      prev?.next = nil
      break
    }
  }
}

remove(node: node!)

print(list1)
