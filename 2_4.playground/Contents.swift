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

func partition(number: Int, head: IntNode) -> IntNode {

  var newHead: IntNode? = nil
  var newTail: IntNode? = nil

  var current: IntNode? = head

  while current != nil {

    let nodeToMove = current
    current = current?.next

    if newHead == nil && newTail == nil {
      newHead = nodeToMove
      newTail = nodeToMove
      nodeToMove?.next = nil
    } else if (nodeToMove?.value)! >= number {
      newTail?.next = nodeToMove
      newTail = newTail?.next
      newTail?.next = nil
    } else {
      nodeToMove?.next = newHead
      newHead = nodeToMove
    }
  }

  return newHead!
}

for i in 0..<10 {
  print("------------------------\(i)")
  let list1 = seed(nodesNumer: 10, range: 0..<10)
  print(list1)

  let newHead = partition(number: 5, head: list1)
  print(newHead)
}



