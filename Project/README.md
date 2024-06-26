![Image alt](https://github.com/Pave1iOS/SeeFood/blob/main/image.png)

[![Typing SVG](https://readme-typing-svg.herokuapp.com?color=%2336BCF7&lines=Coloborations)](https://git.io/typing-svg)
<h5><a href="https://github.com/Pave1iOS" target="_blank">Pavel | PaveliOS </a></h5>
<h5><a href="https://github.com/PavelEmshanov" target="_blank">Pavel | PavelEmshanov </a></h5>
<h5><a href="https://github.com/LiliyaAndreeva" target="_blank">Lilya | LiliyaAndreeva </a></h5>



<h1 align="center">Описание проекта</h1>

## Overview

Задания:
- Task -- Задание, для ведения списка дел;
- RegularTask -- Обычное задание для ведения списка дел;
- ImportantTask -- Важное задание с приоритетом для ведения списка дел.

Менеджеры списка заданий:
- ITaskManager -- Протокол предоставляющий управление списком заданий;
- TaskManager -- Менеджер списка заданий;
- OrderedTaskManager - Менеджер списка заданий, отсортированных по приоритету.

### Описание пакета
Класс `TaskManager`, хранит список заданий и предоставляет функции для управления ими на основе протокола ITaskManager:

- `func allTasks() -> [Task]` -- получение списка всех заданий;
- `func completedTasks() -> [Task]` -- получение списка выполненных заданий;
- `func uncompletedTasks() -> [Task]` -- получение списка невыполненных заданий;
- `func addTask(task: Task)` -- добавление задания в список;
- `func removeTask(task: Task)` -- удаление задания из списка.

`TaskManager` оперирует заданиями -- `Task`, который имеет статус готово (completed) и название (title).

`ImportantTask` поддерживают приоритеты с возможными значениями: `low`, `medium`, `high`. 
А также дату выполнения задания (deadline) в зависимости от ее приоритета. 
Если приоритет установлен в `high`, то дата выполнения устанавливается на следующий день от даты создания задания, 
если в `medium`, то на последующий день, а если в `low`, то на третий день после текущей 
(использован Calendar.current.date).

### UML-схема 

```plantuml
@startuml

package TaskManagerModule {

	class Task {
		title
		completed
	}

	enum TaskPriority {
		case low
		case medium
		case high
	}

	class ImportantTask {
		deadLine
		date
		taskPriority
	}

	protocol ITaskManager {
		allTasks() -> [Task]
		completedTasks() -> [Task]
		uncompletedTasks() -> [Task]
		addTask(task: Task)
		addTasks(tasks: [Task])
		removeTask(task: Task)
	}

	class TaskManager {
		taskList = [Task]()
	}

	class OrderedTaskManager

	class RegularTask
}

TaskManager ..|> ITaskManager 
OrderedTaskManager ..|> ITaskManager 
OrderedTaskManager -L-> TaskManager

RegularTask -R-|> Task
ImportantTask -L-|> Task
ImportantTask -R-> TaskPriority
TaskManager -U-> Task

@enduml
```



## Getting Started

- Установите **Homebrew** - менеджер пакетов для macOS
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

- Установите **SwiftLint** - утилита для обеспечения соблюдения стиля и соглашений Swift
brew install swiftlint

- Установите **Tuist** - инструмент для генерации проектов XCode
brew install tuist/tuist/tuist@3

- Клонируйте проект к себе на компьютер
- В консоли запустите команду -> tuist generate
