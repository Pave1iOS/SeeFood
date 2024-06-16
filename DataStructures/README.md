# DataStructures

Пакет содержит кастомные методы сортировки SinglyLinkedList & Queue.

Сортировки:

- DoubleLinkedList -- Линейный двунаправленный список;
- Queue -- Очередь.

## Описание пакета

### Структура `DoubleLinkedList`, содержит методы для сортировки и управления список с асимптотикой O(1):

- `mutating func push(_ value: T)` -- добавление в начало списка значения;
- `mutating func append(_ value: T)` -- добавление в конец списка значения;
- `mutating func insert(_ value: T, after index: Int)` -- вставка в середину списка значения;
- `mutating func pop() -> T?` -- извлечение значения из начала списка;
- `mutating func removeLast() -> T?` -- извлечение значения c конца списка;
- `mutating func remove(after index: Int) -> T?` -- извлечение значения из середины списка.

Инициализатор для списка:

```
init(value: T? = nil) {
	if let value = value {
		let newNode = Node(value)
		head = newNode
		tail = newNode
		count = 1
	}
}
```

Так же содержит класс `Node` для корректировки списка и выставления значений:

- `var value: T` -- Значение, которое хранит узел;
- `var previous: Node<T>?` -- Ссылка на предыдущий узел, если он есть;
- `var next: Node<T>?` -- Ссылка на следующий узел, если он есть.

Как выглядит схема постороения элементов в списке: 
[previouseNode] <-> [currentNode] <-> [nextNode]

Инициализатор для выставления значений:

```
init(_ value: T, previous: Node<T>? = nil, next: Node<T>? = nil) {
	self.value = value
	self.next = next
	self.previous = previous
}
```

Структура `DoubleLinkedList` использует приватные методы для управления списком:

- `func node(at index: Int) -> Node<T>?` -- возвращает узел списка по индексу (асимптотика O(n));
- `func value(at index: Int) -> T?` -- возвращает значение по указанному индексу (асимптотика O(1)).

### Структура `Queue`, содержит методы для сортировки и управления очередью O(n):

- `mutating func enqueue(_ element: T)` -- добавляет элемент в конец очереди;
- `mutating func dequeue() -> T?` -- удаляет и возвращает первый элемент очереди.

Так же содержит переменные для получения состояния очереди

- `var isEmpty: Bool` -- возвращает логическое значение, указывающее, пуста ли очередь;
- `var count: Int` -- возвращает количество элементов в очереди;
- `var peek: T?` -- возвращает первый элемент очереди.