import UIKit

protocol AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double
}
// 더하기
class AddOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}
// 빼기
class SubtractOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}
// 곱하기
class MultiplyOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}
//나누기
class DivideOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a / b
    }
}
// 나머지 연산
class ModuloOperation: AbstractOperation {
    func operation(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a.truncatingRemainder(dividingBy: b)
    }
}
// 연산 객체의  operation 메서드를 호출해서 계산한다.
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
// 더하기
let calc1 = Calculator(operation: AddOperation())
print("10 + 100 = \(calc1.calculate(10, 100))", terminator: "")
// 빼기
let calc2 = Calculator(operation: SubtractOperation())
print("10 - 100 = \(calc2.calculate(10, 100))", terminator: "")
// 곱하기
let calc3 = Calculator(operation: MultiplyOperation())
print("10 * 100 = \(calc3.calculate(10, 100))", terminator: "")
// 나누기
let calc4 = Calculator(operation: DivideOperation())
print("10 / 100 = \(calc4.calculate(10, 100))", terminator: "")
// 나머지 연산
let calc5 = Calculator(operation: ModuloOperation())
print("10 % 100 = \(calc5.calculate(10, 100))", terminator: "")

