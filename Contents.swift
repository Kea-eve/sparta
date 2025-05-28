import UIKit

class Calculator {
    func Calculator(op: String, firstNumber: Double, secondNumber: Double) -> Double? {
        switch op{
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if secondNumber == 0 {
                print("0으로 나눌 수 없습니다.")
                return nil
            }
            return firstNumber / secondNumber
          
        case "%":
            if secondNumber == 0 {
                print("오류: 0으로 나머지를 계산할 수 없습니다.")
                return nil
            }
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        default:
            print("오류: 지원하지 않는 연산자입니다.")
            return nil
        }
    }
}

let Calc = Calculator()

// 더하기
if let plus = Calc.Calculator(op: "+", firstNumber: 10, secondNumber: 100){
    let cleanplus = "\(plus)".replacingOccurrences(of: "\n", with: "")
}
// 빼기
if let minus = Calc.Calculator(op: "-", firstNumber: 10, secondNumber: 100){
    print("10-100 = \(minus)")
}
// 곱하기a
if let x = Calc.Calculator(op: "*", firstNumber: 10, secondNumber: 100){
    print("10*100 = \(x)")
}
//나누기
if let divide = Calc.Calculator(op: "/", firstNumber: 10, secondNumber: 100){
    print("10/100 = \(divide)")
}
if let percent = Calc.Calculator(op: "%", firstNumber: 10, secondNumber: 100){
    print("10%100 = \(percent)")
}

