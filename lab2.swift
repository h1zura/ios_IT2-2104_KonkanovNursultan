//IT2-2104 Konkanov Nursultan
//EX 1 Bank account management

// import Foundation

// class BankAccount {
//     let accountNumber: String
//     let accountOwner: String
//     private var balance: Double
    
//     init(accountNumber: String, accountOwner: String, startingBalance: Double) {
//         self.accountNumber = accountNumber
//         self.accountOwner = accountOwner
//         self.balance = startingBalance
//     }
    
//     func deposit(amount: Double) {
//         guard amount > 0 else {
//             print("Ошибка: Сумма пополнения должна быть положительной!")
//             return
//         }
//         balance += amount
//         print("Сумма \(amount) успешно внесена на счет \(accountNumber)!. Новый баланс: \(balance)")
//     }
    
//     func withdraw(amount: Double) {
//         guard amount > 0 else {
//             print("Ошибка: Сумма для снятия должна быть положительной!")
//             return
//         }
//         guard balance >= amount else {
//             print("Ошибка: На счете недостаточно средств для снятия!")
//             return
//         }
//         balance -= amount
//         print("Сумма \(amount) успешно снята со счета \(accountNumber)!. Новый баланс: \(balance)")
//     }
    
//     func getBalance() -> Double {
//         return balance
//     }
    
//     func displayAccountInfo() {
//         print("Информация о счете:")
//         print("Номер счета: \(accountNumber)")
//         print("Владелец счета: \(accountOwner)")
//         print("Текущий баланс: \(balance)")
//     }
// }

// func inputString(prompt: String) -> String {
//     print(prompt)
//     guard let input = readLine(), !input.isEmpty else {
//         fatalError("Ошибка: Некорректный ввод!")
//     }
//     return input
// }

// func inputDouble(prompt: String) -> Double {
//     print(prompt)
//     guard let input = readLine(), let number = Double(input), number >= 0 else {
//         fatalError("Ошибка: Некорректный ввод!")
//     }
//     return number
// }

// let accountNumber = inputString(prompt: "Введите номер счета:")
// let accountOwner = inputString(prompt: "Введите имя владельца счета:")
// let startingBalance = inputDouble(prompt: "Введите начальный баланс:")

// let account = BankAccount(accountNumber: accountNumber, accountOwner: accountOwner, startingBalance: startingBalance)

// while true {
//     print("Выберите пункт:")
//     print("1. Показать информацию о счете")
//     print("2. Внести средства")
//     print("3. Снять средства")
//     print("4. Завершить работу")

//     guard let choice = readLine(), let action = Int(choice) else {
//         print("Ошибка: Введите корректный пункт действия!")
//         continue
//     }

//     switch action {
//     case 1:
//         account.displayAccountInfo()
//     case 2:
//         let amount = inputDouble(prompt: "Введите сумму для пополнения:")
//         account.deposit(amount: amount)
//     case 3:
//         let amount = inputDouble(prompt: "Введите сумму для снятия:")
//         account.withdraw(amount: amount)
//     case 4:
//         print("Работа завершена. До свидания!")
//         exit(0)
//     default:
//         print("Ошибка: Введите корректный пункт действия!")
//     }
// }

//EX 2 Book library management 

class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayBookInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book] = []
    
    func addBook(book: Book) {
        books.append(book)
        print("Книга добавлена в библиотеку!")
    }
    
    func removeBook(title: String) {
        if let index = books.firstIndex(where: { $0.title == title }) {
            books.remove(at: index)
            print("Книга удалена из библиотеки!")
        } else {
            print("Книга с таким названием не найдена в библиотеке!")
        }
    }
    
    func displayLibraryInfo() {
        if books.isEmpty {
            print("Библиотека пуста!")
        } else {
            print("Информация о книгах в библиотеке:")
            for book in books {
                book.displayBookInfo()
                print("-------------")
            }
        }
    }
}

func inputString(prompt: String) -> String {
    print(prompt)
    guard let input = readLine(), !input.isEmpty else {
        fatalError("Ошибка: Некорректный ввод!")
    }
    return input
}

func inputInt(prompt: String) -> Int {
    while true {
        print(prompt)
        guard let input = readLine(), let number = Int(input), number >= 0 else {
            print("Ошибка: Введите целое положительное число!")
            continue
        }
        return number
    }
}

let library = Library()

while true {
    print("Выберите пункт:")
    print("1. Добавить книгу")
    print("2. Удалить книгу")
    print("3. Показать информацию о книгах в библиотеке")
    print("4. Завершить работу")

    guard let choice = readLine(), let action = Int(choice) else {
        print("Ошибка: Введите корректный пункт действия!")
        continue
    }

    switch action {
    case 1:
        let title = inputString(prompt: "Введите название книги:")
        let author = inputString(prompt: "Введите автора книги:")
        let year = inputInt(prompt: "Введите год выпуска книги:")
        let pageCount = inputInt(prompt: "Введите количество страниц в книге:")
        let newBook = Book(title: title, author: author, year: year, pageCount: pageCount)
        library.addBook(book: newBook)
    case 2:
        let title = inputString(prompt: "Введите название книги для удаления:")
        library.removeBook(title: title)
    case 3:
        library.displayLibraryInfo()
    case 4:
        print("Работа завершена!")
        break
    default:
        print("Ошибка: Введите корректный пункт действия!")
    }
}

