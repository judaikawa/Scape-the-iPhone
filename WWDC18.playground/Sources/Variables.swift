import Foundation
import UIKit

public var pixelArtFontName = "8-bit pusab"
public let triangleImage = UIImageView()
public var numberOfPictures = 0

// CHARACTER
public let character = UIImageView()
public let characterSize = 55
public let walkAnimationDuration = 0.2
public let walkLongAnimationDuration = 0.8
public let differenceLongPressWalk = 5
public let differencePressWalk = 10
public var currentXPosition = 351
public var currentYPosition = 300
public let characterText = UILabel()
public let delayTextAnimation = 0.07
public let delayFirstText = 0.09

// APPS
public let mailApp = UIImageView()
public let calendarApp = UIImageView()
public let calculatorApp = UIImageView()
public let notesApp = UIImageView()
public let clockApp = UIImageView()
public let cameraApp = UIImageView()
public let photosApp = UIImageView()
public let messagesApp = UIImageView()

public var passedInMailApp = false
public var passedInCalendarApp = false
public var passedInCalculatorApp = false
public var passedInNotesApp = false
public var passedInClockApp = false
public var passedInCameraApp = false
public var passedInPhotosApp = false
public var passedInMessagesApp = false
public var passedInAllApps = false


// VIEW CONTROLLER
public let masterViewController = ConsoleViewController()
public var isInIntroView = true

