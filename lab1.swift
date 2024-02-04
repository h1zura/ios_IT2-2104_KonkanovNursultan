//EX 1 CALCULATOR 

// import Foundation

// func add(_ a: Double, _ b: Double) -> Double {
//     return a + b
// }

// func subtract(_ a: Double, _ b: Double) -> Double {
//     return a - b
// }

// func multiply(_ a: Double, _ b: Double) -> Double {
//     return a * b
// }

// func divide(_ a: Double, _ b: Double) -> Double? {
//     guard b != 0 else {
//         print("Ошибка: Нельзя делить на ноль!")
//         return nil
//     }
//     return a / b
// }

// func power(_ base: Double, _ exponent: Double) -> Double {
//     return pow(base, exponent)
// }

// func getUserInput() -> Double? {
//     print("Введите число:")
//     if let input = readLine(), let number = Double(input) {
//         return number
//     } else {
//         print("Ошибка: Введите правильный оператор!")
//         return nil
//     }
// }

// func getOperator() -> String? {
//     print("Введите оператор (+, -, *, /, ^):")
//     if let `operator` = readLine(), ["+", "-", "*", "/", "^"].contains(`operator`) {
//         return `operator`
//     } else {
//         print("Ошибка: Введите правильный оператор!")
//         return nil
//     }
// }

// if let firstNumber = getUserInput(),
//    let operation = getOperator(),
//    let secondNumber = getUserInput() {
    
//     var result: Double?
    
//     switch operation {
//     case "+":
//         result = add(firstNumber, secondNumber)
//     case "-":
//         result = subtract(firstNumber, secondNumber)
//     case "*":
//         result = multiply(firstNumber, secondNumber)
//     case "/":
//         result = divide(firstNumber, secondNumber)
//     case "^":
//         result = power(firstNumber, secondNumber)
//     default:
//         print("Ошибка: Неизвестная операция")
//     }
    
//     if let result = result {
//         print("Результат: \(result)")
//     }
// }


//EX 2 PROCESSING STRING DATA

import Foundation

func combineStrings() {
    print("Введите первую строку:")
    if let firstLine = readLine() {
        print("Введите вторую строку:")
        if let secondLine = readLine() {
            let combinedString = firstLine + secondLine
            print("Результат объединения: \(combinedString)")
        } else {
            print("Ошибка: Некорректная вторая строка!")
        }
    } else {
        print("Ошибка: Некорректная первая строка")
    }
}

func flipString() {
    print("Введите строку для переворота:")
    if let inputString = readLine() {
        let reversedString = String(inputString.reversed())
        print("Результат переворота: \(reversedString)")
    } else {
        print("Ошибка: Введите корректную строку!")
    }
}

func countCharacters() {
    print("Введите строку для подсчета символов:")
    if let inputString = readLine() {
        let characterCount = inputString.filter { !$0.isWhitespace }.count
        print("Количество символов (без пробелов): \(characterCount)")
    } else {
        print("Ошибка: Введите корректную строку!")
    }
}

func searchSubstring() {
    print("Введите строку:")
    if let mainString = readLine() {
        print("Введите подстроку для поиска:")
        if let substring = readLine() {
            if let range = mainString.range(of: substring) {
                let index = mainString.distance(from: mainString.startIndex, to: range.lowerBound) + 1
                print("Первое вхождение подстроки \"\(substring)\" на позиции: \(index)")
            } else {
                print("Подстрока не найдена!")
            }
        } else {
            print("Ошибка: Введите корректную подстроку!")
        }
    } else {
        print("Ошибка: Введите корректную строку!")
    }
}

combineStrings()
flipString()
countCharacters()
searchSubstring()
