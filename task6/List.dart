extension convertListToBiList on List<int> {
  BidirectionalList toBidirectionalList() {
    var bilist = BidirectionalList();
    var node = Node(value: this.first);
    bilist.head = node;
    var walker = bilist.head;
    for (var item in this) {
      var node = Node(value: item);
      walker?.next = node;
      walker = walker?.next;
    }
    return bilist;
  }
}

void main() {
  final ll = BidirectionalList();
  try {
    ll.addLast(1);
    ll.addLast(2);
    ll.addLast(3);
    ll.addLast(4);
    ll.removeOnIndex(3);
    ll.removeOnIndex(1);
    ll.addOnIndex(index: 1, value: 2);
    ll.addOnIndex(index: 3, value: 4);
    print(ll.toString());
    print(ll.size);
    var simpleList = [1, 2, 3, 4, 5];
    print(simpleList.convertListToBiList());
  } catch (e) {
    print('Input error (${e.toString()})');
  }
}

class Node {
  int value;
  Node? next;
  Node? previous;

  Node({
    required this.value,
    this.next,
    this.previous,
  });

  @override
  String toString() {
    return value.toString();
  }
}

class BidirectionalList {
  Node? head;
  int size = 0;

  void addOnIndex({required int index, required int value}) {
    if ((index < 0) || (index > size)) return;
    final node = Node(value: value);

    if (head == null) {
      head = node;
      size++;
      return;
    }
    if (index == 0) {
      node.next = head;
      head?.previous = node;
      head = node;
      return;
    }
    var walker = head;
    for (int i = 0; i < index; i++) {
      walker = walker?.next;
    }
    if (size == index) {
      walker?.next = node;
      node.previous = walker;
    }
    walker?.previous?.next = node;
    node.previous = walker?.previous;
    node.next = walker;
    walker?.previous = node;
    size++;
  }

  void removeOnIndex(int index) {
    if ((index < 0) || (index > size)) return;
    if (head == null) {
      return;
    }
    if (index == 0) {
      head?.next?.previous = null;
      head = head?.next;
      return;
    }
    var walker = head;
    for (int i = 0; i < index; i++) {
      walker = walker?.next;
    }
    walker?.previous?.next = walker.next;
    walker?.next?.previous = walker.previous;
    size--;
  }

  void updateOnIndex({required int index, required int value}) {
    if ((index < 0) || (index > size)) throw Error();
    var walker = head;
    for (int i = 0; i < index; i++) {
      walker = walker?.next;
    }
    walker?.value = value;
    return;
  }

  int? getOnIndex(int index) {
    if ((index < 0) || (index > size)) throw Error();
    var walker = head;
    for (int i = 0; i < index; i++) {
      walker = walker?.next;
    }
    return walker?.value;
  }

  void addLast(int value) {
    final node = Node(value: value);
    Node? last = head;
    node.next = null;
    if (head == null) {
      node.previous = null;
      head = node;
      size++;
      return;
    }

    while (last?.next != null) {
      last = last?.next;
    }
    last?.next = node;
    node.previous = last;
    size++;
  }

  @override
  String toString() {
    var result = 'Your list: ';
    while (head?.next != null) {
      result += '${head?.value} ';
      head = head?.next;
    }
    result += '${head?.value} ';
    return result;
  }
}
