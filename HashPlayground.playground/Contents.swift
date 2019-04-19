import UIKit

struct HashTable<Key: Hashable, Value>: CustomStringConvertible {
  private class Node<Key, Value>: CustomStringConvertible {
    let k: Key
    let v: Value
    var next: Node<Key, Value>?
    init(key: Key, value: Value) {
      self.k = key
      self.v = value
    }

    var lastNode: Node<Key, Value> {
      var enumerator = self
      while enumerator.next != nil {
        enumerator = enumerator.next!
      }
      return enumerator
    }

    var description: String {
      var result = ""
      var enumerator: Node<Key, Value>? = self
      repeat {
        if let key = enumerator?.k,
          let value = enumerator?.v {
          result += "[\(key): \(value)]; "
        }
        enumerator = enumerator?.next
      } while enumerator != nil
      return result
    }
  }

  private let capacity = 5
  private var hashTable: Array<Node<Key, Value>?>

  init() {
    hashTable = Array<Node<Key, Value>?>(repeating: nil, count: capacity)
  }

  mutating func set(value: Value, forKey: Key) {
    let index = calculateHash(forKey: forKey)
    if let node = hashTable[index] {
      let lastNode = node.lastNode
      lastNode.next = Node<Key, Value>(key: forKey, value: value)
    } else {
      hashTable[index] = Node<Key, Value>(key: forKey, value: value)
    }
  }

  func value(forKey: Key) -> Value? {
    let index = calculateHash(forKey: forKey)
    guard let node = hashTable[index] else { return nil }

    if node.k == forKey {
      return node.v
    }

    var enumerator: Node<Key, Value>? = node
    repeat {
      if enumerator?.k == forKey {
        return enumerator?.v
      }
      enumerator = enumerator?.next
    } while enumerator != nil
    return nil
  }

  private func calculateHash(forKey: Key) -> Int {
    return abs(forKey.hashValue) % capacity
  }

  var description: String {
    var result = ""
    for (key, value) in hashTable.enumerated() {
      result += "[\(key)] - \(value?.description ?? "") \n"
    }
    return result
  }
}

var table = HashTable<String, Int>()

table.set(value: 100, forKey: "hello")
table.set(value: 101, forKey: "qwerty")
table.set(value: 102, forKey: "asdfg")
table.set(value: 103, forKey: "world")
table.set(value: 104, forKey: "zxcvbn")
table.set(value: 105, forKey: "poiuyt")

print(table)

table.value(forKey: "hello")
table.value(forKey: "qwerty")
table.value(forKey: "asdfg")
table.value(forKey: "world")
table.value(forKey: "zxcvbn")
table.value(forKey: "poiuyt")





