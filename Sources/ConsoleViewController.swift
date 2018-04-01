import Foundation
import UIKit
import AVFoundation


public class ConsoleViewController: UIViewController {
    
    // Inicial Black View
    var blackView = UIView()
    var detailViewController: UIViewController?
    
    // Check What App Character is in
    var isInApp = false
    var inInAppVC = UIViewController()
    
    // Number of clicks on walk buttons
    var timesDownButtonPressed = 0
    var timesUpButtonPressed = 0
    var timesRightButtonPressed = 0
    var timesLeftButtonPressed = 0
    
    // Comments
    var commentsArray = ["","","Wh-What is happening?\nA-Am I in a phone?!?"]
//    , "How did I ended up in\nhere?!?"
    var currentCommentIndex = 0
    
    // Outlets
    let aButton = UIButton()
    let bButton = UIButton()
    let inicialTalkBaloon = UIImageView()
    let pressToStart = UILabel()
    
    // Start Menu
    let startButton = UIButton()
    var startGoToMenu = false
    let startMenuView = UIView()
    let startOptionMenuView = UIView()
    let textOptionLabel = UILabel()
    let triangleSelected = UIImageView()
    
    
    // Sound
    var startPlayer = AVAudioPlayer()
    var aButtonPlayer = AVAudioPlayer()
    var bButtonPlayer = AVAudioPlayer()
    var backgroundPlayer = AVAudioPlayer()
    var backgroundAppsPlayer = AVAudioPlayer()
    var begginingPlayer = AVAudioPlayer()
    var endPlayer = AVAudioPlayer()
    
    
    // End of game
    let starShine = UIImageView()
    
    public override func loadView() {
        
        // Start Sound
        do{
            startPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "start-button", ofType: "wav")!)!)
            startPlayer.volume = 1
            startPlayer.prepareToPlay()
        }
        catch{
        }
        
        // A Button Sound
        do{
            aButtonPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "button-press", ofType: "wav")!)!)
            aButtonPlayer.volume = 1
            aButtonPlayer.prepareToPlay()
        }
        catch{
        }
        
        // B Button Sound
        do{
            bButtonPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "bButton-press", ofType: "wav")!)!)
            bButtonPlayer.volume = 1
            bButtonPlayer.prepareToPlay()
        }
        catch{
        }
        
        // Intro music
        do{
            begginingPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "beggining", ofType: "mp3")!)!)
            begginingPlayer.volume = 1
            begginingPlayer.prepareToPlay()
            begginingPlayer.numberOfLoops = 10
        }
        catch{
        }
        
        // Background music
        do{
            backgroundPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "background-music", ofType: "mp3")!)!)
            backgroundPlayer.volume = 0.2
            backgroundPlayer.prepareToPlay()
            backgroundPlayer.numberOfLoops = 10
        }
        catch{
        }
        
        // Background apps music
        do{
            backgroundAppsPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "background-apps", ofType: "mp3")!)!)
            backgroundAppsPlayer.volume = 0.5
            backgroundAppsPlayer.prepareToPlay()
            backgroundAppsPlayer.numberOfLoops = 10
        }
        catch{
        }
        
        // End music
        do{
            endPlayer = try AVAudioPlayer(contentsOf: URL.init(string: Bundle.main.path(forResource: "end-music", ofType: "mp3")!)!)
            endPlayer.volume = 0.5
            endPlayer.prepareToPlay()
            endPlayer.numberOfLoops = 10
        }
        catch{
        }
        
        let playbackDelay = 4.5
        begginingPlayer.play(atTime: begginingPlayer.deviceCurrentTime + playbackDelay)
        
        triangleImage.isHidden = true
        
        // Registering downloaded Pixeled font
        if let fontURL = Bundle.main.url(forResource: "8-bit pusab", withExtension: "ttf") {
            pixelArtFontName = "8-bit pusab"
            CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
        } else {
            pixelArtFontName = "Verdana"
        }
        
        // MAIN VIEW
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 600)
        view.backgroundColor = .white
        
        // BOTTOM VIEW
        let bottomView = UIView()
        bottomView.frame = CGRect(x: 0, y: 400, width: 450, height: 200)
        bottomView.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        view.addSubview(bottomView)
        
        // CHARACTER COMMENTS
        let characterFaceImage = UIImageView()
        characterFaceImage.frame = CGRect(x: 30, y: 0, width: 80, height: 80)
        characterFaceImage.image = UIImage(named: "character-face")
        characterFaceImage.contentMode = .scaleAspectFit
        bottomView.addSubview(characterFaceImage)
        
        // Baloon Coment
        let baloonImage = UIImageView()
        baloonImage.frame = CGRect(x: 120, y: 5, width: 310, height: 70)
        baloonImage.image = UIImage(named: "baloon-character")
        baloonImage.contentMode = .scaleAspectFit
        bottomView.addSubview(baloonImage)
        
        // Text on Baloon
        characterText.font = UIFont(name: pixelArtFontName, size: 10)
        characterText.frame = CGRect(x: 20, y: 12, width: 250, height: 50)
        characterText.numberOfLines = 3
        characterText.textAlignment = .left
        changeTextTo(label: characterText, text: commentsArray[0], delay: delayTextAnimation)
        characterText.textColor = .black
        
        baloonImage.addSubview(characterText)
        
        // Triangle
        triangleImage.frame = CGRect(x: 280, y: 38, width: 15, height: 15)
        triangleImage.image = UIImage(named: "Triangle")
        triangleImage.contentMode = .scaleAspectFit
        
        let imagesNames = ["Triangle", "Triangle_white"]
        
        var images = [UIImage]()
        
        for i in 0..<imagesNames.count {
            images.append(UIImage(named: imagesNames[i])!)
        }
        
        // Animated image
        triangleImage.animationImages = images
        triangleImage.animationDuration = 2
        triangleImage.startAnimating()
        triangleImage.contentMode = .scaleAspectFit
        baloonImage.addSubview(triangleImage)
        
        
        // CONSOLE VIEW
        let consoleView = UIImageView()
        consoleView.frame = CGRect(x: 0, y: 70, width: 450, height: 140)
        consoleView.image = UIImage(named: "Console grid")!
        consoleView.contentMode = .scaleAspectFit
        bottomView.addSubview(consoleView)
        
        // BUTTONS
        
        // A BUTTON
        UIButton.setButtonConfiguration(button: aButton, xPosition: 310, yPosition: 520, width: 40, height: 40)
        UIButton.roundButton(button: aButton, cornerRad: aButton.frame.size.width/2)
        aButton.addTarget(self, action: #selector(aButtonPressed), for: .touchUpInside)
        aButton.isEnabled = false
        view.addSubview(aButton)
        
        let aLAbel = UILabel()
        aLAbel.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        aLAbel.text = "A"
        aLAbel.font = UIFont(name: pixelArtFontName, size: 20)
        aLAbel.textAlignment = .center
        aLAbel.textColor = .white
        aButton.addSubview(aLAbel)
        
        // B BUTTON
        UIButton.setButtonConfiguration(button: bButton, xPosition: 380, yPosition: 520, width: 40, height: 40)
        UIButton.roundButton(button: bButton, cornerRad: bButton.frame.size.width/2)
        bButton.addTarget(self, action: #selector(bButtonPressed), for: .touchUpInside)
        bButton.isEnabled = false
        view.addSubview(bButton)
        
        let bLAbel = UILabel()
        bLAbel.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        bLAbel.text = "B"
        bLAbel.font = UIFont(name: pixelArtFontName, size: 20)
        bLAbel.textAlignment = .center
        bLAbel.textColor = .white
        bButton.addSubview(bLAbel)
        
        // SELECT BUTTON
        let selectButton = UIButton()
        UIButton.setButtonConfiguration(button: selectButton, xPosition: 210, yPosition: 500, width: 60, height: 20)
        UIButton.roundButton(button: selectButton, cornerRad: 10.0)
        view.addSubview(selectButton)
        
        let selectLabel = UILabel()
        selectLabel.frame = CGRect(x: 207, y: 509, width: 70, height: 40)
        selectLabel.text = "SELECT"
        selectLabel.font = UIFont(name: pixelArtFontName, size: 8)
        selectLabel.textAlignment = .center
        selectLabel.textColor = .white
        view.addSubview(selectLabel)
        
        // START BUTTON
        startButton.isEnabled = false
        UIButton.setButtonConfiguration(button: startButton, xPosition: 210, yPosition: 550, width: 60, height: 20)
        UIButton.roundButton(button: startButton, cornerRad: 10.0)
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        view.addSubview(startButton)
        
        let startLabel = UILabel()
        startLabel.frame = CGRect(x: 207, y: 559, width: 70, height: 40)
        startLabel.text = "START"
        startLabel.font = UIFont(name: pixelArtFontName, size: 8)
        startLabel.textAlignment = .center
        startLabel.textColor = .white
        view.addSubview(startLabel)
        
        // UP BUTTON
        let upButton = UIButton()
        UIButton.setButtonConfiguration(button: upButton, xPosition: 100, yPosition: 490, width: 30, height: 45)
        upButton.addTarget(self, action: #selector(walkUp), for: .touchUpInside)
        // Long Press Gesture
        let longPressGestureUp = UILongPressGestureRecognizer(target: self, action: #selector(longPressUp))
        upButton.addGestureRecognizer(longPressGestureUp)
        
        view.addSubview(upButton)
        
        // DOWN BUTTON
        let downButton = UIButton()
        UIButton.setButtonConfiguration(button: downButton, xPosition: 100, yPosition: 545, width: 30, height: 45)
        downButton.addTarget(self, action: #selector(walkDown), for: .touchUpInside)
        
        // Long Press Gesture
        let longPressGestureDown = UILongPressGestureRecognizer(target: self, action: #selector(longPressDown))
        downButton.addGestureRecognizer(longPressGestureDown)
        
        view.addSubview(downButton)
        
        // RIGHT BUTTON
        let rightButton = UIButton()
        UIButton.setButtonConfiguration(button: rightButton, xPosition: 130, yPosition: 525, width: 35, height: 30)
        rightButton.addTarget(self, action: #selector(walkRight), for: .touchUpInside)
        
        // Long Press Gesture
        let longPressGestureRight = UILongPressGestureRecognizer(target: self, action: #selector(longPressRight))
        rightButton.addGestureRecognizer(longPressGestureRight)
        
        view.addSubview(rightButton)
        
        // LEFT BUTTON
        let leftButton = UIButton()
        UIButton.setButtonConfiguration(button: leftButton, xPosition: 65, yPosition: 525, width: 35, height: 30)
        leftButton.addTarget(self, action: #selector(walkLeft), for: .touchUpInside)
        
        // Long Press Gesture
        let longPressGestureLeft = UILongPressGestureRecognizer(target: self, action: #selector(longPressLeft))
        leftButton.addGestureRecognizer(longPressGestureLeft)
        
        view.addSubview(leftButton)
        
        view.addSubview(AppsViewController().view)
        
        // Black Fade View
        blackView.frame = CGRect(x: 0, y: 0, width: 450, height: 480)
        blackView.backgroundColor = .black
        view.addSubview(blackView)
        
        // Talk Baloon
        inicialTalkBaloon.frame = CGRect(x: 200, y: 250, width: 200, height: 100)
        inicialTalkBaloon.image = UIImage(named: "talk-baloon")
        inicialTalkBaloon.contentMode = .scaleAspectFit
        blackView.addSubview(inicialTalkBaloon)
        
        // Text on Baloon
        let textOnBaloon = UILabel()
        textOnBaloon.frame = CGRect(x: 9, y: 0, width: 200, height: 100)
        textOnBaloon.numberOfLines = 3
        changeTextTo(label: textOnBaloon, text: "Wh... Where..\nWhere am I?!?\n .     .     .", delay: delayFirstText)
        textOnBaloon.font = UIFont(name: "Rockwell", size: 16)
        textOnBaloon.textAlignment = .center
        textOnBaloon.textColor = .black
        inicialTalkBaloon.addSubview(textOnBaloon)
        
        // Press A to start
        pressToStart.frame = CGRect(x: 15, y: 400, width: 300, height: 100)
        pressToStart.text = "Press A to start"
        pressToStart.font = UIFont(name: pixelArtFontName, size: 12)
        pressToStart.textColor = .white
        pressToStart.alpha = 0
        blackView.addSubview(pressToStart)
        
        self.view = view
    }

    // Walk Buttons Actions
    @objc func walkUp() {
        
        if startGoToMenu {
            triangleSelected.frame = CGRect(x: 20, y: 50, width: 15, height: 15)
            
        } else {
            
            character.image = UIImage(named: "walk-back1")
            
            // Animate
            var nextImageName: String!
            if timesUpButtonPressed % 2 == 0 {
                nextImageName = "walk-back2"
            } else {
                nextImageName = "walk-back3"
            }
            character.animationImages = [UIImage(named: nextImageName)!,UIImage(named: "walk-back1")!]
            
            character.animationDuration = walkAnimationDuration
            character.animationRepeatCount = 1
            character.startAnimating()
            
            if currentYPosition >= 10 {
                let newYPosition = currentYPosition - differencePressWalk
                character.frame = CGRect(x: currentXPosition, y: newYPosition, width: characterSize, height: characterSize)
                currentYPosition = newYPosition
            }
            
            timesUpButtonPressed += 1
            
        }
        
    }
    
    @objc func walkDown() {
        
        if startGoToMenu {
            triangleSelected.frame = CGRect(x: 20, y: 110, width: 15, height: 15)
            
        } else {
            character.image = UIImage(named: "walk-front1")
            
            // Animate
            var nextImageName: String!
            if timesDownButtonPressed % 2 == 0 {
                nextImageName = "walk-front2"
            } else {
                nextImageName = "walk-front3"
            }
            character.animationImages = [UIImage(named: nextImageName)!,UIImage(named: "walk-front1")!]
            
            character.animationDuration = walkAnimationDuration
            character.animationRepeatCount = 1
            character.startAnimating()
            
            if currentYPosition <= 345 {
                let newYPosition = currentYPosition + differencePressWalk
                character.frame = CGRect(x: currentXPosition, y: newYPosition, width: characterSize, height: characterSize)
                currentYPosition = newYPosition
            }
            
            timesDownButtonPressed += 1
        }
        
        
    }
    
    @objc func walkRight() {
        character.image = UIImage(named: "walk-right1")
        
        // Animate
        var nextImageName: String!
        if timesRightButtonPressed % 2 == 0 {
            nextImageName = "walk-right2"
        } else {
            nextImageName = "walk-right3"
        }
        character.animationImages = [UIImage(named: nextImageName)!,UIImage(named: "walk-right1")!]
        
        character.animationDuration = walkAnimationDuration
        character.animationRepeatCount = 1
        character.startAnimating()
        if currentXPosition <= 400 {
            let newXPosition = currentXPosition + differencePressWalk
            character.frame = CGRect(x: newXPosition, y: currentYPosition, width: characterSize, height: characterSize)
            currentXPosition = newXPosition
        }
        
        timesRightButtonPressed += 1
    }
    
    @objc func walkLeft() {
        character.image = UIImage(named: "walk-left1")
        
        // Animate
        var nextImageName: String!
        if timesLeftButtonPressed % 2 == 0 {
            nextImageName = "walk-left2"
        } else {
            nextImageName = "walk-left3"
        }
        character.animationImages = [UIImage(named: nextImageName)!,UIImage(named: "walk-left1")!]
        
        character.animationDuration = walkAnimationDuration
        character.animationRepeatCount = 1
        character.startAnimating()
        if currentXPosition >= 11 {
            let newXPosition = currentXPosition - differencePressWalk
            character.frame = CGRect(x: newXPosition, y: currentYPosition, width: characterSize, height: characterSize)
            currentXPosition = newXPosition
        }
        
        timesLeftButtonPressed += 1
    }
    
    // Walk Long Press Actions
    @objc func longPressUp() {
        character.image = UIImage(named: "walk-back1")
        
        // Animate
        character.animationImages = [UIImage(named: "walk-back2")!,UIImage(named: "walk-back1")!,UIImage(named: "walk-back3")!,UIImage(named: "walk-back1")!]
        
        character.animationDuration = walkLongAnimationDuration
        character.animationRepeatCount = 10
        character.startAnimating()
        if currentYPosition >= 10 {
            let newYPosition = currentYPosition - differenceLongPressWalk
            character.frame = CGRect(x: currentXPosition, y: newYPosition, width: characterSize, height: characterSize)
            currentYPosition = newYPosition
        }
        
    }
    
    @objc func longPressDown() {
        character.image = UIImage(named: "walk-front1")
        
        // Animate
        character.animationImages = [UIImage(named: "walk-front2")!,UIImage(named: "walk-front1")!,UIImage(named: "walk-front3")!,UIImage(named: "walk-front1")!]
        
        character.animationDuration = walkLongAnimationDuration
        character.animationRepeatCount = 10
        character.startAnimating()
        if currentYPosition <= 345 {
            let newYPosition = currentYPosition + differenceLongPressWalk
            character.frame = CGRect(x: currentXPosition, y: newYPosition, width: characterSize, height: characterSize)
            currentYPosition = newYPosition
        }
        
    }
    
    @objc func longPressRight() {
        character.image = UIImage(named: "walk-right1")
        
        // Animate
        character.animationImages = [UIImage(named: "walk-right2")!,UIImage(named: "walk-right1")!,UIImage(named: "walk-right3")!,UIImage(named: "walk-right1")!]
        
        character.animationDuration = walkLongAnimationDuration
        character.animationRepeatCount = 10
        character.startAnimating()
        if currentXPosition <= 400 {
            let newXPosition = currentXPosition + differenceLongPressWalk
            character.frame = CGRect(x: newXPosition, y: currentYPosition, width: characterSize, height: characterSize)
            currentXPosition = newXPosition
        }
        
    }
    
    @objc func longPressLeft() {
        character.image = UIImage(named: "walk-left1")
        
        // Animate
        character.animationImages = [UIImage(named: "walk-left2")!,UIImage(named: "walk-left1")!,UIImage(named: "walk-left3")!,UIImage(named: "walk-left1")!]
        
        character.animationDuration = walkLongAnimationDuration
        character.animationRepeatCount = 10
        character.startAnimating()
        if currentXPosition >= 11 {
            let newXPosition = currentXPosition - differenceLongPressWalk
            character.frame = CGRect(x: newXPosition, y: currentYPosition, width: characterSize, height: characterSize)
            currentXPosition = newXPosition
        }
        
    }
    
    @objc func aButtonPressed() {
        
        if isInIntroView {
            begginingPlayer.stop()
            aButtonPlayer.play()
            inicialTalkBaloon.removeFromSuperview()
            pressToStart.removeFromSuperview()
            
            UIView.animate(withDuration: 2.0, animations: {
                self.blackView.backgroundColor = .white
            }, completion: { (finished) in
                
                if finished {
                    isInIntroView = false
                    self.backgroundPlayer.play()
                    self.changeTextTo(label: characterText, text: self.commentsArray[2], delay: delayTextAnimation)
                    self.currentCommentIndex += 1
                    UIView.animate(withDuration: 2.0, animations: {
                        self.blackView.backgroundColor = .clear
                    }, completion: { (finished) in
                        // Enable Start button only after intro
                        if finished {
                            self.startButton.isEnabled = true
                        }
                        
                    })
                }
                
            })
        }
        
        if startGoToMenu {
            
            // Option View
            startOptionMenuView.frame = CGRect(x: 0, y: 0, width: startMenuView.frame.size.width, height: startMenuView.frame.size.height)
            startOptionMenuView.backgroundColor = .black
            startMenuView.addSubview(startOptionMenuView)
            
            textOptionLabel.frame = CGRect(x: 30, y: 30, width: 170, height: 190)
            textOptionLabel.textColor = .white
            textOptionLabel.font = UIFont(name: pixelArtFontName, size: 10)
            textOptionLabel.numberOfLines = 10
            
            if triangleSelected.frame.minY == 50 {
                textOptionLabel.text = "Help the character find a way out of the phone, by walking around and going inside the apps (pressing A while on top of it)."
                textOptionLabel.sizeToFit()
            } else {
                textOptionLabel.text = "Developed and designed by\nJuliana Daikawa\n\nCharacter pixel art by GugaJokes\n\nMusic by HeatleyBros"
                textOptionLabel.sizeToFit()
                
                
                
            }
            
            startOptionMenuView.addSubview(textOptionLabel)
            
            
        } else {
            
//            aButton.isEnabled = false
//            bButton.isEnabled = false
            
            if currentCommentIndex+1 < commentsArray.count {
                self.changeTextTo(label: characterText, text: commentsArray[currentCommentIndex+1], delay: delayTextAnimation)
            } else {
                aButton.isEnabled = true
                if !self.isInApp {
                    self.goToApp()
                }
            }
            
            currentCommentIndex += 1
        }
    }
    
    @objc func bButtonPressed() {
        
        self.startButton.isEnabled = true
        
        let passedInApssArray = [passedInMailApp, passedInCalendarApp, passedInCalculatorApp, passedInNotesApp, passedInClockApp, passedInCameraApp, passedInPhotosApp, passedInMessagesApp]
        
        let numberOfAppsAccessed = passedInApssArray.filter({ (passed) -> Bool in
            passed == true
        }).count

        if numberOfAppsAccessed == 8 {
            passedInAllApps = true
        }
        
        if passedInAllApps {
            starShine.isHidden = false
            starShine.frame = CGRect(x: cameraApp.frame.minX+30, y: cameraApp.frame.minY+30, width: 50, height: 50)
            starShine.contentMode = .scaleAspectFit
            starShine.image = UIImage(named: "pixel-sparkle-1")
            
            let imagesNames = ["pixel-sparkle-1", "pixel-sparkle-2"]
            
            var images = [UIImage]()
            
            for i in 0..<imagesNames.count {
                images.append(UIImage(named: imagesNames[i])!)
            }
            
            // Animated image
            starShine.animationImages = images
            starShine.animationDuration = 1
            starShine.startAnimating()

            self.view.addSubview(starShine)
            
            self.commentsArray = ["Something is going on with\nthe camera app.", "I think we should check\nit out."]
            self.currentCommentIndex = 0
            self.changeTextTo(label: characterText, text: commentsArray[0], delay: delayTextAnimation)
            
        }
        
        if startGoToMenu {
            bButton.isEnabled = true
            startOptionMenuView.removeFromSuperview()
            self.textOptionLabel.text = ""
        } else {

            bButton.isEnabled = false
            
            // Check if character is inside an App
            if isInApp {
                bButtonPlayer.play()
                inInAppVC.view.removeFromSuperview()
                backgroundAppsPlayer.pause()
                isInApp = false
                if !passedInAllApps {
                    if passedInNotesApp {
                        self.commentsArray = ["I need to find a way out..."]
                    } else {
                        self.commentsArray = ["I wonder whose phone is this..."]
                    }
                    self.currentCommentIndex = 0
                    self.changeTextTo(label: characterText, text: commentsArray[0], delay: delayTextAnimation)
                    
                }
            }
            
            self.blackView.backgroundColor = .clear
            let playbackDelay = 0.8
            backgroundPlayer.play(atTime: backgroundPlayer.deviceCurrentTime + playbackDelay)
        }
    }

    
    @objc func startButtonPressed() {
        
        startPlayer.play()
        
        // Menu View
        startMenuView.frame = CGRect(x: 450/2 - 250/2, y: 400/2 - 200/2, width: 250, height: 200)
        startMenuView.backgroundColor = .black
        
        // Options
        let helpLabel = UILabel()
        helpLabel.frame = CGRect(x: 50, y: 50, width: 200, height: 20)
        helpLabel.text = "Help"
        helpLabel.font = UIFont(name: pixelArtFontName, size: 10)
        helpLabel.textColor = .white
        startMenuView.addSubview(helpLabel)
        
        let creditsLabel = UILabel()
        creditsLabel.frame = CGRect(x: 50, y: 110, width: 200, height: 20)
        creditsLabel.text = "Credits"
        creditsLabel.font = UIFont(name: pixelArtFontName, size: 10)
        creditsLabel.textColor = .white
        startMenuView.addSubview(creditsLabel)
        
        // Selected Options
        triangleSelected.frame = CGRect(x: 20, y: 50, width: 15, height: 15)
        triangleSelected.image = UIImage(named: "Triangle_white")!
        let imagesNames = ["Triangle_white", "Triangle"]
        
        var images = [UIImage]()
        
        for i in 0..<imagesNames.count {
            images.append(UIImage(named: imagesNames[i])!)
        }
        
        // Animated image
        triangleSelected.animationImages = images
        triangleSelected.animationDuration = 2
        triangleSelected.startAnimating()
        triangleSelected.contentMode = .scaleAspectFit
        startMenuView.addSubview(triangleSelected)
        
        startGoToMenu = !startGoToMenu
        
        if startGoToMenu {
            backgroundPlayer.pause()
            self.blackView.addSubview(startMenuView)
        } else {
            backgroundPlayer.play()
            self.startOptionMenuView.removeFromSuperview()
            self.startMenuView.removeFromSuperview()
            self.textOptionLabel.text = ""
            
        }
        
    }
    
    func changeTextTo(label: UILabel, text: String, delay: Double) {
        label.text = ""

        self.aButton.isEnabled = false
        self.bButton.isEnabled = false
        
        triangleImage.isHidden = true
        
        UILabel.animateText(label: label, newText: text, characterDelay: delay) { finished in
            if finished {
                self.aButton.isEnabled = !self.isInApp
                self.bButton.isEnabled = !isInIntroView
                if self.currentCommentIndex != self.commentsArray.count-1 {
                    triangleImage.isHidden = false
                }
                UILabel.animate(withDuration: 1.5) {
                    self.pressToStart.alpha = 1
                }
            }
        }
    }

    func goToApp() {
        
        if let selectedApp = checkSelectedApp() {
            aButtonPlayer.play()
            backgroundPlayer.pause()
            self.isInApp = true
            self.inInAppVC = selectedApp
            self.startButton.isEnabled = false
            
            // End of game
            if passedInAllApps && self.inInAppVC is CameraViewController {
                self.bButton.isEnabled = false
                self.blackView.frame = CGRect(x: 0, y: 0, width: 450, height: 600)
                UIView.animate(withDuration: 2.0, animations: {
                    self.starShine.isHidden = true
                    self.blackView.backgroundColor = .white
                }, completion: { (finished) in
                    if finished {
                        self.presentApp(viewControler: EndGameViewController())
                        self.endPlayer.play()
                        let endLabel = UILabel()
                        endLabel.frame = CGRect(x: 20, y: 100, width: 400, height: 200)
                        endLabel.textColor = .black
                        endLabel.font = UIFont(name: pixelArtFontName, size: 15)
                        endLabel.numberOfLines = 3
                        endLabel.text = "Congratulations!\nYou got off the phone!"
                        endLabel.textAlignment = .center
                        self.view.addSubview(endLabel)
                        
                        let partyImage = UIImageView()
                        partyImage.frame = CGRect(x: 225 - 25, y: 230, width: 50, height: 50)
                        partyImage.image = UIImage(named: "party-emoji")
                        partyImage.contentMode = .scaleAspectFit
                        self.view.addSubview(partyImage)
                        
                        let thanksLabel = UILabel()
                        thanksLabel.frame = CGRect(x: 20, y: 200, width: 400, height: 200)
                        thanksLabel.textColor = .black
                        thanksLabel.font = UIFont(name: pixelArtFontName, size: 15)
                        thanksLabel.numberOfLines = 2
                        thanksLabel.text = "Thank you for playing!"
                        thanksLabel.textAlignment = .center
                        self.view.addSubview(thanksLabel)
                        
                        let thanksImage = UIImageView()
                        thanksImage.frame = CGRect(x: 225 - 25, y: 310, width: 50, height: 50)
                        thanksImage.image = UIImage(named: "emoji-hands")
                        thanksImage.contentMode = .scaleAspectFit
                        self.view.addSubview(thanksImage)
                        
                        
                        
                    }})
            } else {
                self.aButton.isEnabled = false
                //        Present the Calculator View with black fade in
                UIView.animate(withDuration: 2.0, animations: {
                    self.blackView.backgroundColor = .black
                }, completion: { (finished) in
                    if finished {
                        self.backgroundAppsPlayer.play()
                        self.presentApp(viewControler: selectedApp)
                        self.blackView.backgroundColor = .clear
//                        self.aButton.isEnabled = true
                        if self.inInAppVC is CalculatorViewController {
                            self.commentsArray = ["Ugh, I hate math...\nBut go ahead if you want to"]
                        } else if self.inInAppVC is NotesViewController {
                            self.commentsArray = ["We can get to know who\nthis phone belongs to!"]
                        } else if self.inInAppVC is ClockViewController {
                            self.commentsArray = ["Woah it's getting late!\nI need to go home..."]
                        } else if self.inInAppVC is CameraViewController {
                            self.commentsArray = ["Woah, this is weird...\nSeems like this camera is broken..."]
                        } else if self.inInAppVC is MailViewController {
                            self.commentsArray = ["This WWDC must be really cool!"]
                        } else if self.inInAppVC is PhotosViewController {
                            if numberOfPictures > 0 {
                                self.commentsArray = ["We are filling the library\nwith glitch pictures..."]
                            } else {
                                self.commentsArray = ["She looks like a cool girl!"]
                            }
                        } else if self.inInAppVC is MessagesViewController {
                            self.commentsArray = ["Not much to see here..."]
                        } else if self.inInAppVC is CalendarViewController {
                            self.commentsArray = ["How weird... Is this a hint?!"]
                        }
                        // Present the comments
                        self.currentCommentIndex = 0
                        self.changeTextTo(label: characterText, text: self.commentsArray[0], delay: delayTextAnimation)
                    }
                })
            }
            
            
        } else {
            aButton.isEnabled = true
        }

    }
    
    func checkSelectedApp() -> UIViewController? {
        
        if character.frame.origin.x >= (notesApp.frame.minX-30) &&
                  character.frame.origin.x <= (notesApp.frame.maxX-10) &&
                  character.frame.origin.y >= (notesApp.frame.minY-character.frame.size.height) &&
                  character.frame.origin.y <= (notesApp.frame.maxY-character.frame.size.height+10) {
            return NotesViewController()
            
        } else if character.frame.origin.x >= (calculatorApp.frame.minX-30) &&
                  character.frame.origin.x <= (calculatorApp.frame.maxX-10) &&
                  character.frame.origin.y >= (calculatorApp.frame.minY-character.frame.size.height) &&
                  character.frame.origin.y <= (calculatorApp.frame.maxY-character.frame.size.height+10) {
            return CalculatorViewController()
            
        } else if character.frame.origin.x >= (messagesApp.frame.minX-30) &&
            character.frame.origin.x <= (messagesApp.frame.maxX-10) &&
            character.frame.origin.y >= (messagesApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (messagesApp.frame.maxY-character.frame.size.height+10) {
            return MessagesViewController()
            
        } else if character.frame.origin.x >= (cameraApp.frame.minX-30) &&
            character.frame.origin.x <= (cameraApp.frame.maxX-10) &&
            character.frame.origin.y >= (cameraApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (cameraApp.frame.maxY-character.frame.size.height+10) {
            return CameraViewController()
            
        } else if character.frame.origin.x >= (photosApp.frame.minX-30) &&
            character.frame.origin.x <= (photosApp.frame.maxX-10) &&
            character.frame.origin.y >= (photosApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (photosApp.frame.maxY-character.frame.size.height+10) {
            return PhotosViewController()
            
        } else if character.frame.origin.x >= (clockApp.frame.minX-30) &&
            character.frame.origin.x <= (clockApp.frame.maxX-10) &&
            character.frame.origin.y >= (clockApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (clockApp.frame.maxY-character.frame.size.height+10) {
            return ClockViewController()
            
        } else if character.frame.origin.x >= (mailApp.frame.minX-30) &&
            character.frame.origin.x <= (mailApp.frame.maxX-10) &&
            character.frame.origin.y >= (mailApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (mailApp.frame.maxY-character.frame.size.height+10) {
            return MailViewController()
            
        } else if character.frame.origin.x >= (calendarApp.frame.minX-30) &&
            character.frame.origin.x <= (calendarApp.frame.maxX-10) &&
            character.frame.origin.y >= (calendarApp.frame.minY-character.frame.size.height) &&
            character.frame.origin.y <= (calendarApp.frame.maxY-character.frame.size.height+10) {
            return CalendarViewController()
            
        } else {
            return nil
        }
        
    }
    
    func presentApp(viewControler : UIViewController) {
        clearCurrentDetails()
        loadDetails(viewControler: viewControler)
    }
    
    func clearCurrentDetails() {
        
        if let currentDetails = detailViewController {
            currentDetails.willMove(toParentViewController: nil)
            currentDetails.view.removeFromSuperview()
            currentDetails.removeFromParentViewController()
        }
    }
    
    func loadDetails(viewControler : UIViewController) {
        detailViewController = viewControler
        addChildViewController(detailViewController!)
        view.addSubview((detailViewController?.view)!)
        detailViewController?.didMove(toParentViewController: self)
    }
    
}

