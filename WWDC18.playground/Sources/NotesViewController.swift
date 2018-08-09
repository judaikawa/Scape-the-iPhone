import Foundation
import UIKit


public class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let notesTitles = ["About Me", "WWDC18"]
    let notesDetails = ["Wednesday        Hi! My name is Juliana, I'm 21 years old...", "15/03/18        I'm very excited for WWDC18! It's..."]
    let notesText = ["Hi! My name is Juliana, I'm 21 years old, I'm from Brazil and I am a undergraduate student of Statistics and a member of Apple Developer Academy, where I learned about Swift programming and started to develop my own apps.", "I'm very excited for WWDC18! It's going to be awesome!"]
    let whiteView = UIView()
    let textView = UILabel()
    
    public override func loadView() {
        
        passedInNotesApp = true
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "notes-background")!)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 30, y: 30, width: 420, height: 40)
        titleLabel.font = UIFont(name: pixelArtFontName, size: 30)
        titleLabel.textAlignment = .left
        titleLabel.text = "Notes"
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        // TableView
        let tableView = UITableView()
        tableView.frame = CGRect(x: 20, y: 100, width: 430, height: 300)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        self.view = view
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "notesCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "notesCell")
        }
        cell?.backgroundColor = .clear
        cell?.textLabel?.text = notesTitles[indexPath.row]
        cell?.textLabel?.font = UIFont(name: pixelArtFontName, size: 12)
        cell?.detailTextLabel?.text = notesDetails[indexPath.row]
        cell?.detailTextLabel?.font = UIFont(name: pixelArtFontName, size: 8)
        cell?.detailTextLabel?.textColor = .gray
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // White View for text
        whiteView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        whiteView.backgroundColor = UIColor(patternImage: UIImage(named: "notes-background")!)
        view.addSubview(whiteView)
        
        // Back Button
        let backButton = UIButton()
        backButton.frame = CGRect(x: 5, y: 10, width: 100, height: 20)
        backButton.setTitle("< Notes", for: .normal)
        backButton.setTitleColor(UIColor(red: 0.8745, green: 0.6471, blue: 0.2, alpha: 1.0), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 12)
        backButton.titleLabel?.textAlignment = .left
        whiteView.addSubview(backButton)
        
        // Text
        textView.frame = CGRect(x: 20, y: 40, width: 400, height: 100)
        textView.text = notesText[indexPath.row]
        textView.numberOfLines = 10
        textView.sizeToFit()
        textView.textColor = .black
        textView.textAlignment = .left

        textView.font = UIFont(name: pixelArtFontName, size: 10)
        whiteView.addSubview(textView)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func goBack() {
        whiteView.removeFromSuperview()
        textView.text = ""
    }
    
}


