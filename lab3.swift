// EX 1 LAB3 KONKANOV NURSULTAN
struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
}

class Journal {
    var students: [Student] = []
    
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(newStudent)
        print("\(firstName) \(lastName) Succesfully added to the journal!")
    }
    
    func removeStudent(firstName: String, lastName: String) {
        if let index = students.firstIndex(where: { $0.firstName == firstName && $0.lastName == lastName }) {
            students.remove(at: index)
            print("\(firstName) \(lastName) Succesfully removed from the journal!")
        } else {
            print("\(firstName) \(lastName) Not found in the journal!")
        }
    }
    
    func displayJournalInfo() {
        if students.isEmpty {
            print("Journal empty")
        } else {
            print("Information about students in the journal:")
            for student in students {
                print("Name: \(student.firstName), Surname: \(student.lastName), Average score: \(student.averageGrade)")
            }
        }
    }
    
    func listStudentsByDescendingGPA() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        print("Students average score in descending order:")
        for student in sortedStudents {
            print("Name: \(student.firstName), Surname: \(student.lastName), Average score: \(student.averageGrade)")
        }
    }
    
    func averageGradeOfAllStudents() -> Double {
        guard !students.isEmpty else {
            return 0
        }
        let total = students.reduce(0.0) { $0 + $1.averageGrade }
        return total / Double(students.count)
    }
    
    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

let journal = Journal()

while true {
    print("What do you want to do in the Journal:")
    print("1. Add student")
    print("2. Remove student")
    print("3. Show information about students")
    print("4. Students average score in descending order")
    print("5. Average score of all students")
    print("6. Student with the highest average score")
    print("7. Exit journal")

    guard let choice = readLine(), let action = Int(choice) else {
        print("Error: Please enter a valid number!")
        continue
    }

    switch action {
    case 1:
        let firstName = inputString(prompt: "Enter student's first name:")
        let lastName = inputString(prompt: "Enter student's last name:")
        let averageGrade = inputDouble(prompt: "Enter student's average grade:")
        journal.addStudent(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
    case 2:
        let firstName = inputString(prompt: "Enter student's first name for removal:")
        let lastName = inputString(prompt: "Enter student's last name for removal:")
        journal.removeStudent(firstName: firstName, lastName: lastName)
    case 3:
        journal.displayJournalInfo()
    case 4:
        journal.listStudentsByDescendingGPA()
    case 5:
        let averageGrade = journal.averageGradeOfAllStudents()
        print("Average grade of all students in the journal: \(averageGrade)")
    case 6:
        if let student = journal.studentWithHighestGPA() {
            print("Student with the highest average score:")
            print("Name: \(student.firstName), Surname: \(student.lastName), Average score: \(student.averageGrade)")
        } else {
            print("Journal is empty.")
        }
    case 7:
        print("Journal session ended.")
        break
    default:
        print("Error: Please enter a valid action number.")
    }
}

func inputString(prompt: String) -> String {
    print(prompt)
    guard let input = readLine(), !input.isEmpty else {
        fatalError("Error: Invalid input!")
    }
    return input
}

func inputDouble(prompt: String) -> Double {
    while true {
        print(prompt)
        guard let input = readLine(), let number = Double(input), number >= 0 else {
            print("Error: Please enter a positive number!")
            continue
        }
        return number
    }
}

//EX 2

struct Task {
    let title: String
    let description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
        print("\(title) added to the to-do list!")
    }
    
    func removeTask(title: String) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks.remove(at: index)
            print("\(title) removed from the to-do list!")
        } else {
            print("\(title) not found in the to-do list!")
        }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
            print("Status of \(title) changed to \(isCompleted ? "completed" : "not completed")!")
        } else {
            print("\(title) not found in the to-do list!")
        }
    }
    
    func displayToDoList() {
        if tasks.isEmpty {
            print("To-do list is empty!")
        } else {
            print("Tasks in the to-do list:")
            for task in tasks {
                print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
            }
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        if completedTasks.isEmpty {
            print("Can't find completed tasks!")
        } else {
            print("Completed tasks:")
            for task in completedTasks {
                print("Title: \(task.title), Description: \(task.description)")
            }
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { !$0.isCompleted }
        if outstandingTasks.isEmpty {
            print("Can't find outstanding tasks!")
        } else {
            print("Outstanding tasks:")
            for task in outstandingTasks {
                print("Title: \(task.title), Description: \(task.description)")
            }
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll(where: { $0.isCompleted })
        print("Completed tasks cleared from the to-do list!")
    }
}

let toDoList = ToDoList()

while true {
    print("What do you want to do?")
    print("1. Add a new task")
    print("2. Remove a task")
    print("3. Change task status")
    print("4. Display all tasks")
    print("5. Display completed tasks")
    print("6. Display outstanding tasks")
    print("7. Clear completed tasks")
    print("8. Exit")

    guard let choice = readLine(), let action = Int(choice) else {
        print("Error: Please enter a valid number!")
        continue
    }

    switch action {
    case 1:
        let title = inputString(prompt: "Enter task title:")
        let description = inputString(prompt: "Enter task description:")
        toDoList.addTask(title: title, description: description)
    case 2:
        let title = inputString(prompt: "Enter task title for removal:")
        toDoList.removeTask(title: title)
    case 3:
        let title = inputString(prompt: "Enter task title to change status:")
        let isCompleted = inputBool(prompt: "Enter true if completed, false if not:")
        toDoList.changeTaskStatus(title: title, isCompleted: isCompleted)
    case 4:
        toDoList.displayToDoList()
    case 5:
        toDoList.displayCompletedTasks()
    case 6:
        toDoList.displayOutstandingTasks()
    case 7:
        toDoList.clearCompletedTasks()
    case 8:
        print("Exiting...")
        break
    default:
        print("Error: Please enter a valid number!")
    }
}

func inputString(prompt: String) -> String {
    print(prompt)
    guard let input = readLine(), !input.isEmpty else {
        fatalError("Error: Invalid input!")
    }
    return input
}

func inputBool(prompt: String) -> Bool {
    while true {
        print(prompt)
        guard let input = readLine(), let boolValue = Bool(input) else {
            print("Error: Please enter true or false!")
            continue
        }
        return boolValue
    }
}
