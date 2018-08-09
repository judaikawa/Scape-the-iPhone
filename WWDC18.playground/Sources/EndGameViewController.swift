import Foundation
import UIKit


public class EndGameViewController: UIViewController {
    
    var timer: Timer?
    
    public override func loadView() {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 600)
        view.backgroundColor = .white

        self.view = view
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(createRandom), userInfo: nil, repeats: true)

    }
    
    
    @objc func createRandom() {
        
        let X = arc4random_uniform(UInt32(self.view.frame.maxX))
        let alpha = CGFloat(Float(arc4random()) / Float(UInt32.max))
        let size = arc4random_uniform(20)
        
        self.view.addSubview(EndAnimation(frame: CGRect(x: CGFloat(X), y: -CGFloat(size), width: CGFloat(size), height: CGFloat(size)), color: RandomColor.randomColor().withAlphaComponent(alpha)))
        
        
    }
    
}
