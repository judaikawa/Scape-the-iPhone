import Foundation
import UIKit


public class CalculatorViewController: UIViewController {
    
    let resultLabel = UILabel()
    var n1: Float?
    var n2: Float?
    var n3: Float?
    var result: Float?
    var operat: String?
    
    public override func loadView() {
        
        passedInCalculatorApp = true
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = .black
        
        // Result Label
        resultLabel.frame = CGRect(x: 20, y: 25, width: 400, height: 70)
        resultLabel.font = UIFont(name: pixelArtFontName, size: 40)
        resultLabel.textAlignment = .right
        resultLabel.text = "0"
        resultLabel.textColor = .white
        view.addSubview(resultLabel)
        
        // BUTTONS
        let button0 = createButton(text: "0", rect: CGRect(x: 35, y: 320, width: 140, height: 55), type: .number, color: .darkGray)
//        button0.contentHorizontalAlignment = .left
        view.addSubview(button0)
        
        let button1 = createButton(text: "1", rect: CGRect(x: 35, y: 246, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button1)
        
        let button2 = createButton(text: "2", rect: CGRect(x: 119, y: 246, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button2)
        
        let button3 = createButton(text: "3", rect: CGRect(x: 202, y: 246, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button3)
        
        let button4 = createButton(text: "4", rect: CGRect(x: 35, y: 172, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button4)
        
        let button5 = createButton(text: "5", rect: CGRect(x: 119, y: 172, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button5)
        
        let button6 = createButton(text: "6", rect: CGRect(x: 202, y: 172, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button6)
        
        let button7 = createButton(text: "7", rect: CGRect(x: 35, y: 98, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button7)
        
        let button8 = createButton(text: "8", rect: CGRect(x: 119, y: 98, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button8)
        
        let button9 = createButton(text: "9", rect: CGRect(x: 202, y: 98, width: 55, height: 55), type: .number, color: .darkGray)
        view.addSubview(button9)

        let buttonComma = createButton(text: ".", rect: CGRect(x: 202, y: 320, width: 55, height: 55), type: .operation, color: .darkGray)
        view.addSubview(buttonComma)
        
        let buttonPerc = createButton(text: "%", rect: CGRect(x: 285, y: 246, width: 55, height: 55), type: .operation, color: .lightGray)
        view.addSubview(buttonPerc)
        
        let buttonChangeSign = createButton(text: "±", rect: CGRect(x: 285, y: 172, width: 55, height: 55), type: .operation, color: .lightGray)
        buttonChangeSign.contentVerticalAlignment = .bottom
        view.addSubview(buttonChangeSign)

        let buttonEqual = createButton(text: "=", rect: CGRect(x: 285, y: 320, width: 55, height: 55), type: .operation, color: .orange)
        view.addSubview(buttonEqual)
        
        let buttonAC = createButton(text: "AC", rect: CGRect(x: 285, y: 98, width: 55, height: 55), type: .operation, color: .lightGray)
        view.addSubview(buttonAC)
        
        let buttonMinus = createButton(text: "-", rect: CGRect(x: 368, y: 320, width: 55, height: 55), type: .operation, color: .orange)
        view.addSubview(buttonMinus)
        
        let buttonPlus = createButton(text: "+", rect: CGRect(x: 368, y: 246, width: 55, height: 55), type: .operation, color: .orange)
        view.addSubview(buttonPlus)
        
        let buttonMult = createButton(text: "x", rect: CGRect(x: 368, y: 172, width: 55, height: 55), type: .operation, color: .orange)
        view.addSubview(buttonMult)
        
        let buttonDiv = createButton(text: "÷", rect: CGRect(x: 368, y: 98, width: 55, height: 55), type: .operation, color: .orange)
        buttonDiv.contentVerticalAlignment = .bottom
        view.addSubview(buttonDiv)
        
        self.view = view
        
    }
    
    func createButton(text: String, rect: CGRect, type: ButtonType, color: ButtonColor) -> UIButton {
        
        let button = UIButton()
        button.frame = rect
        
        switch color {
        case .lightGray:
            button.backgroundColor = .lightGray
        case .darkGray:
            button.backgroundColor = .gray
        case .orange:
            button.backgroundColor = UIColor(red: 0.9804, green: 0.5882, blue: 0.0157, alpha: 1.0)
        }
        
        switch type {
        case .number:
            button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        case .operation:
            button.addTarget(self, action: #selector(operationButtonPressed), for: .touchUpInside)
        }
        
        button.setTitle(text, for: .normal)
        if text == "÷" || text == "±" {
            button.titleLabel?.font = UIFont(name: pixelArtFontName, size: 40)
        } else {
            button.titleLabel?.font = UIFont(name: pixelArtFontName, size: 20)
        }
        
        UIButton.roundButton(button: button, cornerRad: 5)
        
        return button

    }
    
    enum ButtonType {
        case number
        case operation
    }
    
    enum ButtonColor {
        case lightGray
        case darkGray
        case orange
    }
    
    @objc func numberButtonPressed(_ sender: UIButton) {
        if resultLabel.text == "0" || resultLabel.text == "Error" {
            resultLabel.text = sender.titleLabel?.text
        } else {
            if n1 == nil && operat == nil {
                (resultLabel.text)! += (sender.titleLabel?.text)!
            } else {
                if n3 == nil {
                    resultLabel.text = sender.titleLabel?.text
                    n3 = Float(resultLabel.text!)
                } else {
                    (resultLabel.text)! += (sender.titleLabel?.text)!
                }
            }
        }
    }
    
    @objc func operationButtonPressed(_ sender: UIButton) {
        n3 = nil
        if sender.titleLabel?.text == "AC" {
            resultLabel.text = "0"
            n1 = nil
            n2 = nil
            operat = nil
            result = nil
        } else if sender.titleLabel?.text == "±" {
            result = Float(resultLabel.text!)! * -1
            if result!.truncatingRemainder(dividingBy: Float(Int(result!))) == 0.0 {
                resultLabel.text = String(Int(result!))
            } else {
                if result! == 0 {
                    resultLabel.text = String(result!).replacingOccurrences(of: ".0", with: "")
                } else {
                    resultLabel.text = String(result!)
                }
            }
        } else if sender.titleLabel?.text == "." {
            if resultLabel.text?.range(of: ".") == nil {
                n3 = 0
                (resultLabel.text)! += (sender.titleLabel?.text)!
            }
        } else if sender.titleLabel?.text == "=" {
            if n1 != nil && operat != nil {
                if n2 == nil {
                    n2 = Float(resultLabel.text!)
                } else {
                    if result != nil {
                        if Float(resultLabel.text!) == result {
                            n1 = Float(resultLabel.text!)
                        } else {
                            n2 = Float(resultLabel.text!)
                        }
                    } else {
                        n2 = Float(resultLabel.text!)
                    }
                }
                switch operat! {
                case "x":
                    result = n1!*n2!
                case "÷":
                    if n2 == 0 {
                        result = nil
                        n1 = nil
                        n2 = nil
                        operat = nil
                    } else {
                        result = n1!/n2!
                    }
                case "-":
                    result = n1!-n2!
                case "+":
                    result = n1!+n2!
                default:
                    print("Function not implemented")
                }
                
                if let validResult = result {
                    if validResult.truncatingRemainder(dividingBy: Float(Int(validResult))) == 0.0 {
                        resultLabel.text = String(Int(validResult))
                    } else if abs(validResult) == 0 {
                        resultLabel.text = String(Int(validResult))
                    } else {
                        resultLabel.text = String(validResult)
                    }
                    
                } else {
                    resultLabel.text = "Error"
                }
                
                
            }
            
        } else {
            if let validNumber = Float(resultLabel.text!) {
                n1 = validNumber
                operat = sender.titleLabel?.text
                if operat! == "%" {
                    resultLabel.text = String(n1!/100)
                }
            } else {
                n1 = nil
                n2 = nil
                operat = nil
            }
            
        }
        
    }
    
}
