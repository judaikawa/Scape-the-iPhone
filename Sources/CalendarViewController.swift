import Foundation
import UIKit


public class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Labels
    var sundayLabel = UILabel()
    var mondayLabel = UILabel()
    var tuesdayLabel = UILabel()
    var wednesdayLabel = UILabel()
    var thursdayLabel = UILabel()
    var fridayLabel = UILabel()
    var saturdayLabel = UILabel()
    
    // Buttons
    var sundayButton = UIButton()
    var mondayButton = UIButton()
    var tuesdayButton = UIButton()
    var wednesdayButton = UIButton()
    var thursdayButton = UIButton()
    var fridayButton = UIButton()
    var saturdayButton = UIButton()
    
    // Current Date
    let date = Date()
    let formatter = DateFormatter()
    var weekDayString = ""
    let selectedDayLabel = UILabel()
    
    let circle = UIView()
    
    // Table View
    let cellTitleArray = ["Apps", "Fix Camera"]
    let cellDetailArray = ["Check all apps", "Must get out"]
    
    public override func loadView() {
        
        // TESTE
//        formatter.dateFormat = "MM-dd-yyyy"
//
//        date = formatter.date(from: "04-12-2018")!
        
        passedInCalendarApp = true
        
        // Main View
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = .white
        
        // Gray View
        let grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: 450, height: 170)
        grayView.backgroundColor = UIColor(red: 0.9725, green: 0.9725, blue: 0.9725, alpha: 1.0)
        view.addSubview(grayView)
        
        // Line to separate
        let lineGray = UIView()
        lineGray.frame = CGRect(x: 0, y: 170, width: 450, height: 1)
        lineGray.backgroundColor = .lightGray
        view.addSubview(lineGray)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 20, y: 20, width: 450, height: 30)
        titleLabel.font = UIFont(name: pixelArtFontName, size: 16)
        titleLabel.textAlignment = .left
        formatter.dateFormat = "MMMM"
        titleLabel.text = formatter.string(from: date)
        titleLabel.sizeToFit()
        titleLabel.textColor = .red
        view.addSubview(titleLabel)
        
        // Days of the week
        sundayLabel = createDayOfWeekLabel(text: "S", rect: CGRect(x: 15, y: 50, width: 60, height: 40), type: .weekend)
        view.addSubview(sundayLabel)
        
        mondayLabel = createDayOfWeekLabel(text: "M", rect: CGRect(x: 75, y: 50, width: 60, height: 40), type: .normal)
        view.addSubview(mondayLabel)
        
        tuesdayLabel = createDayOfWeekLabel(text: "T", rect: CGRect(x: 135, y: 50, width: 60, height: 40), type: .normal)
        view.addSubview(tuesdayLabel)
        
        wednesdayLabel = createDayOfWeekLabel(text: "W", rect: CGRect(x: 195, y: 50, width: 60, height: 40), type: .normal)
        view.addSubview(wednesdayLabel)
        
        thursdayLabel = createDayOfWeekLabel(text: "T", rect: CGRect(x: 255, y: 50, width: 60, height: 40), type: .normal)
        view.addSubview(thursdayLabel)
        
        fridayLabel = createDayOfWeekLabel(text: "F", rect: CGRect(x: 315, y: 50, width: 60, height: 40), type: .normal)
        view.addSubview(fridayLabel)
        
        saturdayLabel = createDayOfWeekLabel(text: "S", rect: CGRect(x: 375, y: 50, width: 60, height: 40), type: .weekend)
        view.addSubview(saturdayLabel)
        
        // Current day
        let weekDay = Calendar.current.component(.weekday, from: date)
        let _ = Calendar.current.component(.day, from: date)
        
        switch weekDay {
        case 1: // SUNDAY
            circle.frame = CGRect(x: 15, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, 2), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, 3), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, 4), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 5), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 6), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 2: // MONDAY
            circle.frame = CGRect(x: 75, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, 2), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, 3), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 4), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 5), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 3: // TUESDAY
            circle.frame = CGRect(x: 135, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -2), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, 2), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 3), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 4), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 4: // WEDNESDAY
            circle.frame = CGRect(x: 195, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -3), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, -2), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 2), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 3), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 5: // THURSDAY
            circle.frame = CGRect(x: 255, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -4), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, -3), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, -2), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 2), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 6: // FRIDAY
            circle.frame = CGRect(x: 315, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -5), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, -4), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, -3), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, -2), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 1), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        case 7: // SATURDAY
            circle.frame = CGRect(x: 375, y: 85, width: 55, height: 55)
            
            sundayButton = createDayOfWeekButton(text: getDayNumber(date, -6), rect: CGRect(x: 15, y: 95, width: 60, height: 40), type: .weekend, tag: 1)
            
            mondayButton = createDayOfWeekButton(text: getDayNumber(date, -5), rect: CGRect(x: 75, y: 95, width: 60, height: 40), type: .normal, tag: 2)
            
            tuesdayButton = createDayOfWeekButton(text: getDayNumber(date, -4), rect: CGRect(x: 135, y: 95, width: 60, height: 40), type: .normal, tag: 3)
            
            wednesdayButton = createDayOfWeekButton(text: getDayNumber(date, -3), rect: CGRect(x: 195, y: 95, width: 60, height: 40), type: .normal, tag: 4)
            
            thursdayButton = createDayOfWeekButton(text: getDayNumber(date, -2), rect: CGRect(x: 255, y: 95, width: 60, height: 40), type: .normal, tag: 5)
            
            fridayButton = createDayOfWeekButton(text: getDayNumber(date, -1), rect: CGRect(x: 315, y: 95, width: 60, height: 40), type: .normal, tag: 6)
            
            saturdayButton = createDayOfWeekButton(text: getDayNumber(date, 0), rect: CGRect(x: 375, y: 95, width: 60, height: 40), type: .weekend, tag: 7)
            
        default:
            print("Not Implemented. Invalid date.")
        }
        
        circle.backgroundColor = .red
        UIView.roundView(view: circle, cornerRad: circle.frame.size.width/2)
        view.addSubview(circle)
        
        // Buttons days of the week
        view.addSubview(sundayButton)
        view.addSubview(mondayButton)
        view.addSubview(tuesdayButton)
        view.addSubview(wednesdayButton)
        view.addSubview(thursdayButton)
        view.addSubview(fridayButton)
        view.addSubview(saturdayButton)
        
        // Selected day
        selectedDayLabel.frame = CGRect(x: 15, y: 140, width: 420, height: 40)
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        selectedDayLabel.text = formatter.string(from: date)
        selectedDayLabel.font = UIFont(name: pixelArtFontName, size: 10)
        selectedDayLabel.textAlignment = .center
        view.addSubview(selectedDayLabel)
        
        // TableView
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 170, width: 450, height: 230)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        view.addSubview(tableView)
        
        
        self.view = view
        
    }
    
    func getDayNumber(_ date: Date, _ daysToAdd: Int) -> String {
        
        if let dateAfterAdding = Calendar.current.date(byAdding: .day, value: daysToAdd, to: date) {
            let dayNumber = Calendar.current.component(.day, from: dateAfterAdding)
            
            return "\(dayNumber)"
            
        } else {
            print("Invalid date")
            return ""
        }
    }
    
    
    // TABLEVIEW
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "calendarCell")
        }
        cell?.backgroundColor = .clear
        cell?.textLabel?.text = cellTitleArray[indexPath.row]
        cell?.textLabel?.font = UIFont(name: pixelArtFontName, size: 12)
        cell?.detailTextLabel?.text = cellDetailArray[indexPath.row]
        cell?.detailTextLabel?.font = UIFont(name: pixelArtFontName, size: 8)
        cell?.detailTextLabel?.textColor = .gray
        return cell!
    }
    
    func createDayOfWeekLabel(text: String, rect: CGRect, type: DayOfWeek) -> UILabel {
        let dayLabel = UILabel()
        dayLabel.frame = rect
        dayLabel.text = text
        dayLabel.textAlignment = .center
        
        switch type {
        case .normal:
            dayLabel.textColor = .black
        case .weekend:
            dayLabel.textColor = .gray
        }
        
        dayLabel.font = UIFont(name: pixelArtFontName, size: 12)
        
        return dayLabel
    }
    
    func createDayOfWeekButton(text: String, rect: CGRect, type: DayOfWeek, tag: Int) -> UIButton {
        
        let dayButton = UIButton()
        dayButton.tag = tag
        dayButton.frame = rect
        dayButton.setTitle(text, for: .normal)
        dayButton.titleLabel?.textAlignment = .center
        dayButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 16)
        
        switch type {
        case .normal:
            dayButton.setTitleColor(.black, for: .normal)
        case .weekend:
            dayButton.setTitleColor(.gray, for: .normal)
        }
        
        if rect.minX == self.circle.frame.minX {
            dayButton.setTitleColor(.white, for: .normal)
        }
        
        dayButton.addTarget(self, action: #selector(dayButtonPressed), for: .touchUpInside)
        
        
        return dayButton
    }
    
    enum DayOfWeek {
        case normal
        case weekend
    }
    
    @objc func dayButtonPressed(_ sender: UIButton) {
        
        let buttonsArray = [sundayButton,mondayButton,tuesdayButton,wednesdayButton,thursdayButton,fridayButton,saturdayButton]
        
        for button in buttonsArray {
            if button == sundayButton || button == saturdayButton {
                button.setTitleColor(.gray, for: .normal)
            } else {
                button.setTitleColor(.black, for: .normal)
            }
        }
        
        formatter.dateFormat = "dd"
        
        if sender.titleLabel?.text == formatter.string(from: date) {
            circle.backgroundColor = .red
        } else {
            circle.backgroundColor = .black
        }
        
        circle.frame = CGRect(x: sender.frame.minX, y: 85, width: 55, height: 55)
        sender.setTitleColor(.white, for: .normal)
        
        var weekDaySelected = ""
        
        switch sender.tag {
        case 1:
            weekDaySelected = "Sunday"
        case 2:
            weekDaySelected = "Monday"
        case 3:
            weekDaySelected = "Tuesday"
        case 4:
            weekDaySelected = "Wednesday"
        case 5:
            weekDaySelected = "Thursday"
        case 6:
            weekDaySelected = "Friday"
        case 7:
            weekDaySelected = "Saturday"
        default:
            weekDaySelected = "Sunday"
        }
        
        formatter.dateFormat = "MMMM yyyy"
        
        selectedDayLabel.text = "\(weekDaySelected), \(sender.titleLabel!.text!) \(formatter.string(from: date))"

    }
    
}
