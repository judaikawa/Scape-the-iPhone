import Foundation
import UIKit

// Walk buttons
extension UIButton {
    public static func setButtonConfiguration(button: UIButton, xPosition: Int, yPosition: Int, width: Int, height: Int) {
        button.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
}

// Make Corner of images round
extension UIImageView {
    public static func roundImage(image: UIImageView, cornerRad: CGFloat) {
        DispatchQueue.main.async {
            image.layer.masksToBounds = false
            image.layer.cornerRadius = cornerRad
            image.clipsToBounds = true
        }
    }
}

// Make Corner of button round
extension UIButton {
    public static func roundButton(button: UIButton, cornerRad: CGFloat) {
        DispatchQueue.main.async {
            button.layer.masksToBounds = false
            button.layer.cornerRadius = cornerRad
            button.clipsToBounds = true
        }
    }
}


extension UIView {
    public static func roundView(view: UIView, cornerRad: CGFloat) {
        DispatchQueue.main.async {
            view.layer.masksToBounds = false
            view.layer.cornerRadius = cornerRad
            view.clipsToBounds = true
        }
    }
}

//extension Date {
//    func dayOfWeek() -> String? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE"
//        return dateFormatter.string(from: self).capitalized
//        // or use capitalized(with: locale) if you want
//    }
//}

// Animate text letter by letter
extension UILabel {
    
    public static func animateText(label: UILabel, newText: String, characterDelay: TimeInterval, completion: @escaping (_ finish: Bool) -> Void) {
        
        var finish = false
        
        DispatchQueue.main.async {
            
            label.text = ""
            
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    label.text?.append(character)
                    if index == newText.count-1 {
                        finish = true
                        completion(finish)
                    }
                }
            }
        }
    }
    
}

