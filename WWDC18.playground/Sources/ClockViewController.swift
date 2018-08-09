import Foundation
import UIKit


public class ClockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StateChosenDelegate {
    
    var detailViewController: UIViewController?
    let tableView = UITableView()
    var stateArray = ["Sao Paulo", "San Jose"]
    weak var timer: Timer?
    var dateArray = ["", ""]
    var currentStateDateString = ["", ""]
    var isPointShown = true
    var identifierArray = ["America/Sao_Paulo","America/Los_Angeles"]
    let clockList = ListViewController()
    
    func stateChosenInList(stateIdentifier: String?, city: String?) {
        stateArray.append(city!)
        dateArray.append("")
        identifierArray.append(stateIdentifier!)
        currentStateDateString.append("")
        tableView.reloadData()
    }
    
    public override func loadView() {
        
        clockList.delegate = self
        
        passedInClockApp = true
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = .black
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 30, y: 30, width: 450, height: 40)
        titleLabel.font = UIFont(name: pixelArtFontName, size: 30)
        titleLabel.textAlignment = .left
        titleLabel.text = "World Clock"
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        // Add Button
        let addButton = UIButton()
        addButton.frame = CGRect(x: 400, y: 30, width: 20, height: 20)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(UIColor(red: 0.9804, green: 0.5882, blue: 0.0157, alpha: 1.0), for: .normal)
        addButton.addTarget(self, action: #selector(addTimeZone), for: .touchUpInside)
        addButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 20)
        view.addSubview(addButton)
        
        // TableView
        tableView.frame = CGRect(x: 10, y: 100, width: 440, height: 300)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
//        tableView.isScrollEnabled = false
        view.addSubview(tableView)
        
        
        // Date
        setupDate()
        
        // Update Time
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setupDate), userInfo: nil, repeats: true)
        
        self.view = view
        
    }
    
    deinit {
        timer?.invalidate()
    }
    
    @objc func addTimeZone() {

        presentApp(viewControler: clockList)
        
    }
    
    
    @objc private func setupDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        for i in 0..<stateArray.count {
            
            formatter.timeZone = TimeZone(identifier: identifierArray[i])
            currentStateDateString[i] = formatter.string(from: Date())
        }
        
        if isPointShown {
            for j in 0..<stateArray.count {
                dateArray[j] = currentStateDateString[j].replacingOccurrences(of: ":", with: " ")
            }
            isPointShown = !isPointShown
        } else {
            for j in 0..<stateArray.count {
                dateArray[j] = currentStateDateString[j].replacingOccurrences(of: " ", with: ":")
            }
            isPointShown = !isPointShown
        }

        
        tableView.reloadData()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ClockCell(style: .default, reuseIdentifier: "clockCell")
        
        cell.stateLabel.text = stateArray[indexPath.row]
        cell.timeLabel.text = dateArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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

class ClockCell: UITableViewCell {
    
    let stateLabel = UILabel()
    let timeLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // State Label
        stateLabel.frame = CGRect(x: 15, y: 7.5, width: 300, height: 45)
        stateLabel.font = UIFont(name: pixelArtFontName, size: 15)
        stateLabel.textColor = .white
        contentView.addSubview(stateLabel)
        
        // Time Label
        timeLabel.frame = CGRect(x: 310, y: 10, width: 200, height: 40)
        timeLabel.font = UIFont(name: pixelArtFontName, size: 20)
        timeLabel.textColor = .white
        contentView.addSubview(timeLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol StateChosenDelegate: class {
    func stateChosenInList(stateIdentifier: String?, city: String?)
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let listView = UIView()
    weak var delegate: StateChosenDelegate?
    
    override func loadView() {
        
        // List View
        listView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        listView.backgroundColor = .black

        // TableView
        let tableView = UITableView()
        tableView.frame = CGRect(x: 10, y: 50, width: 440, height: 300)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        listView.addSubview(tableView)
        
        // Back Button
        let backButton = UIButton()
        backButton.frame = CGRect(x: 5, y: 10, width: 100, height: 20)
        backButton.setTitle("Cancel", for: .normal)
        backButton.setTitleColor(UIColor(red: 0.9804, green: 0.5882, blue: 0.0157, alpha: 1.0), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 12)
        backButton.titleLabel?.textAlignment = .left
        listView.addSubview(backButton)
        
        self.view = listView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeZone.knownTimeZoneIdentifiers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "listCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "listCell")
        }
        
        let componentsArray = TimeZone.knownTimeZoneIdentifiers[indexPath.row].components(separatedBy: "/")
        var city = componentsArray[componentsArray.count-1]
        if city.contains("_") {
            city = city.replacingOccurrences(of: "_", with: " ")
        }
        let continent = componentsArray[0]

        cell!.textLabel?.text = "\(city), \(continent)"
        cell!.textLabel?.textColor = .white
        cell!.textLabel?.font = UIFont(name: pixelArtFontName, size: 10)
        cell!.backgroundColor = .clear

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let componentsArray = TimeZone.knownTimeZoneIdentifiers[indexPath.row].components(separatedBy: "/")
        var city = componentsArray[componentsArray.count-1]
        if city.contains("_") {
            city = city.replacingOccurrences(of: "_", with: " ")
        }
        
        self.view.removeFromSuperview()
        self.delegate?.stateChosenInList(stateIdentifier: TimeZone.knownTimeZoneIdentifiers[indexPath.row], city: city)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @objc func goBack() {
        self.view.removeFromSuperview()
    }
    
    
}



