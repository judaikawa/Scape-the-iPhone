import Foundation
import UIKit


public class EndAnimation: UIView {
    
    override public init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(frame: CGRect, color: UIColor) {
        super .init(frame: frame)
        
        self.backgroundColor = color
        
        fallAnimation()
    }
    
    
    
    func fallAnimation(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 60
        animation.isAdditive = true
        animation.isRemovedOnCompletion = true
        
        let mult = Int(arc4random_uniform(5))
        let amplitude = CGFloat(arc4random_uniform(10))
        // From y = 0 to y = 299, generate the x values using sine.
        animation.values = (0..<300).map({ (y: Int) -> NSValue in
            let yPos = CGFloat(y*(mult+1))
//            yPos += abs(sin(yPos))
            let xPos = sin(yPos)
            
            let point = CGPoint(x: xPos * (amplitude+1), y: yPos)  // The 10 is to give it some amplitude.
            return NSValue(cgPoint: point)
        })
        
        self.layer.add(animation, forKey: "basic")
        
    }

}
