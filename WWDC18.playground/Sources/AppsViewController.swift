import Foundation
import UIKit

public class AppsViewController : UIViewController {
    
    public override func loadView() {
        
        // MAIN VIEW
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background-main")!).withAlphaComponent(0.7)
        
        // APPS
        let appsArray = ["pixel-mail", "pixel-calendar","pixel-photos", "pixel-notes","pixel-clock","pixel-camera","pixel-calculator","pixel-messages"]
        
        // Mail
        mailApp.frame = CGRect(x: 49, y: 30, width: 90, height: 90)
        mailApp.image = UIImage(named: appsArray[0])!
        view.addSubview(mailApp)
        UIImageView.roundImage(image: mailApp, cornerRad: 5)
        
        // Calendar
        calendarApp.frame = CGRect(x: 180, y: 30, width: 90, height: 90)
        calendarApp.image = UIImage(named: appsArray[1])!
        view.addSubview(calendarApp)
        UIImageView.roundImage(image: calendarApp, cornerRad: 5)
        
        // Photos
        photosApp.frame = CGRect(x: 311, y: 30, width: 90, height: 90)
        photosApp.image = UIImage(named: appsArray[2])!
        view.addSubview(photosApp)
        UIImageView.roundImage(image: photosApp, cornerRad: 5)
        
        // Notes
        notesApp.frame = CGRect(x: 49, y: 150, width: 90, height: 90)
        notesApp.image = UIImage(named: appsArray[3])!
        view.addSubview(notesApp)
        UIImageView.roundImage(image: notesApp, cornerRad: 5)
        
        // Clock
        clockApp.frame = CGRect(x: 180, y: 150, width: 90, height: 90)
        clockApp.image = UIImage(named: appsArray[4])!
        view.addSubview(clockApp)
        UIImageView.roundImage(image: clockApp, cornerRad: 5)
        
        // Camera
        cameraApp.frame = CGRect(x: 311, y: 150, width: 90, height: 90)
        cameraApp.image = UIImage(named: appsArray[5])!
        view.addSubview(cameraApp)
        UIImageView.roundImage(image: cameraApp, cornerRad: 5)
        
        // Calculator
        calculatorApp.frame = CGRect(x: 49, y: 270, width: 90, height: 90)
        calculatorApp.image = UIImage(named: appsArray[6])!
        view.addSubview(calculatorApp)
        UIImageView.roundImage(image: calculatorApp, cornerRad: 5)
        
        // Messages
        messagesApp.frame = CGRect(x: 180, y: 270, width: 90, height: 90)
        messagesApp.image = UIImage(named: appsArray[7])!
        view.addSubview(messagesApp)
        UIImageView.roundImage(image: messagesApp, cornerRad: 5)
        
        // CHARACTER
        character.frame = CGRect(x: currentXPosition, y: currentYPosition, width: characterSize, height: characterSize)
        character.image = UIImage(named: "walk-front1")
        character.contentMode = .scaleAspectFit
        view.addSubview(character)
        
        self.view = view
    }
    
    //CGRect(x: 49, y: 270, width: 90, height: 90)
    
}
