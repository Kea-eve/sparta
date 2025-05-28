import UIKit

protocol AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double
}

class AddOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a / b
    }
}

class ModuloOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a.truncatingRemainder(dividingBy: b)
    }
}

class Calculator {
    private var operation: AbstractOperation?
    
    init() {}
    
    init(operation: AbstractOperation) {
        self.operation = operation
    }
    
    func setOperation(_ operation: AbstractOperation) {
        self.operation = operation
    }
    
    func calculate(_ a: Double, _ b: Double) -> Double {
        guard let operation = operation else {
            print("연산이 설정되지 않았습니다.")
            return 0
        }
        return operation.operation(a, b)
    }
}

let calc1 = Calculator(operation: AddOperation())
print("10 + 100 = \(calc1.calculate(10, 100))", terminator: "")

let calc2 = Calculator(operation: SubtractOperation())
print("10 - 100 = \(calc2.calculate(10, 100))", terminator: "")

let calc3 = Calculator(operation: MultiplyOperation())
print("10 * 100 = \(calc3.calculate(10, 100))", terminator: "")

let calc4 = Calculator(operation: DivideOperation())
print("10 / 100 = \(calc4.calculate(10, 100))", terminator: "")

let calc5 = Calculator(operation: ModuloOperation())
print("10 % 100 = \(calc5.calculate(10, 100))", terminator: "")

