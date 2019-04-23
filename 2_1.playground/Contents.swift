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

func removeAllDuplicates(head: IntNode) {
  var current: IntNode? = head
  while current?.next != nil {
    removeDuplicatesForSingleNode(node: current!)
    current = current?.next
  }
}

func removeDuplicatesForSingleNode(node: IntNode) {
  var current: IntNode? = node.next
  var prev: IntNode? = node
  while current?.next != nil {
    if current?.value == node.value {
      prev?.next = current?.next
    } else {
      prev = prev?.next
    }
    current = current?.next
  }
}

let list1 = seed(nodesNumer: 50, range: 0..<10)
print(list1)
let list2 = seed(nodesNumer: 50, range: 0..<10)
print(list2)

removeAllDuplicates(head: list1)
print(list1)

removeAllDuplicates(head: list2)
print(list2)


