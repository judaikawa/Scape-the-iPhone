import Foundation
import UIKit


enum Colors {
    case pink
    case yellow
    case blue
    case purple
    case green
    
    static func randomColor() -> UIColor {
        let colorsToGetRandomly = [Colors.pink, Colors.yellow, Colors.blue, Colors.purple, Colors.green]
        let index = Int(arc4random_uniform(UInt32(colorsToGetRandomly.count)))
        let color = colorsToGetRandomly[index]
        
        return getColor(color: color)
    }
    
    static func getColor(color: Colors) -> UIColor{
        switch color {
        case .pink:
            return UIColor(red: 0.7569, green: 0.4157, blue: 0.5059, alpha: 1.0)
        case .yellow:
            return UIColor(red: 0.9176, green: 0.7961, blue: 0.5176, alpha: 1.0)
        case .blue:
            return UIColor(red: 0.4784, green: 0.5843, blue: 0.8549, alpha: 1.0)
        case .purple:
            return UIColor(red: 0.7569, green: 0.4078, blue: 0.7333, alpha: 1.0)
        case .green:
            return UIColor(red: 0.4314, green: 0.6784, blue: 0.5137, alpha: 1.0)
        }
    }
}

public class RandomColor {
    
    public class func randomColor() -> UIColor{
        return Colors.randomColor()
    }
}

