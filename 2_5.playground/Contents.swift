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
    if count == 1 {
      current?.next = IntNode(value: Int.random(in: 1..<range.endIndex))
    } else {
      current?.next = IntNode(value: Int.random(in: range))
    }
    current = current?.next
    count -= 1
  }
  return head
}

func summ(list1: IntNode, list2: IntNode) -> IntNode? {

  var result: IntNode? = nil
  var lastNode: IntNode? = nil
  var current1: IntNode? = list1
  var current2: IntNode? = list2
  var inMemory = 0

  while current1 != nil || current2 != nil {

    let num1 = current1?.value ?? 0
    let num2 = current2?.value ?? 0

    guard num1 < 10, num2 < 10 else {
      print("can't summ digits, please change the input to something like 6->1->7 + 5->9->2")
      return nil
    }

    let value = num1 + num2 + inMemory
    inMemory = value / 10

    if result == nil {
      result = IntNode(value: value % 10)
      lastNode = result
    } else {
      lastNode?.next = IntNode(value: value % 10)
      lastNode = lastNode?.next
    }

    current2 = current2?.next
    current1 = current1?.next
  }

  if inMemory > 0 {
    lastNode?.next = IntNode(value: 1)
    lastNode = lastNode?.next
  }

  return result
}

for i in 0..<10 {
  print("-------------------\(i)")
  let list1 = seed(nodesNumer: Int.random(in: 1...7), range: 0..<10)
  print(list1)

  let list2 = seed(nodesNumer: Int.random(in: 1...7), range: 0..<10)
  print(list2)

  let result = summ(list1: list1, list2: list2)
  print(result)
}


