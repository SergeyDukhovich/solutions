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

let list1 = seed(nodesNumer: 5, range: 0..<10)
let list2 = seed(nodesNumer: 10, range: 0..<10)

print(list1)
print(list2)

var middle2: IntNode? = list2
for _ in 0..<3 {
  middle2 = middle2?.next
}

var end1: IntNode? = list1
while end1?.next != nil {
  end1 = end1?.next
}

end1?.next = middle2

print(list1)
print(list2)

func intersection(list1: IntNode, list2: IntNode) -> IntNode? {
  var list1Count = 1
  var current: IntNode? = list1
  while current?.next != nil {
    list1Count += 1
    current = current?.next
  }

  var list2Count = 1
  current = list2
  while current?.next != nil {
    list2Count += 1
    current = current?.next
  }

  var node1: IntNode? = list1
  var node2: IntNode? = list2

  if list1Count > list2Count {
    for _ in 0..<(list1Count-list2Count) {
      node1 = node1?.next
    }
  } else if list1Count < list2Count {
    for _ in 0..<(list2Count-list1Count) {
      node2 = node2?.next
    }
  }

  while node1 != nil {
    if node1 === node2 {
      return node1
    }
    node1 = node1?.next
    node2 = node2?.next
  }
  return nil
}

let result = intersection(list1: list1, list2: list2)
print(result)

let result2 = intersection(list1: seed(nodesNumer: 5, range: 0..<10), list2: seed(nodesNumer: 5, range: 0..<10))
print(result2)
