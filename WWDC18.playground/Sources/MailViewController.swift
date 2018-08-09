import Foundation
import UIKit


class MailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let whiteView = UIView()
    let mailFrom = ["Apple Developer", "Apple"]
    let mailTitles = ["WWDC18. Don’t miss your chance to register", "Discover the new iPhone X"]
    let mailDetails = ["WWDC18. Don’t miss your chance to register.\nApple Worldwide Developers Conferece\nJune 4-8, San Jose, CA Registration closes on Thursday", "Discover the new iPhone X"]
    let messagesText = ["Hi! My name is Juliana, I'm 21 years old, I'm from Brazil and I am a undergraduate student of Statistics and a member of Apple Developer Academy, where I learned about Swift and developed my first app, MoviEye.", "I'm very excited for WWDC18! It's going to be awesome!"]
    let mailDate = ["Yesterday  >", "Monday  >"]
    let fromArray = ["Apple Developer", "Apple"]
    let toEmail = ["judaikawa@gmail.com"]
    let fromEmailLabel = UILabel()
    let emailTitleLabel = UILabel()
    
    public override func loadView() {
        
        passedInMailApp = true
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = .white
        
        // Gray View
        let grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: 450, height: 80)
        grayView.backgroundColor = UIColor(red: 0.9725, green: 0.9725, blue: 0.9725, alpha: 1.0)
        view.addSubview(grayView)
        
        // Line to separate
        let line = UIView()
        line.frame = CGRect(x: 0, y: 80, width: 450, height: 1)
        line.backgroundColor = .lightGray
        view.addSubview(line)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 30, y: 30, width: 450, height: 40)
        titleLabel.font = UIFont(name: pixelArtFontName, size: 30)
        titleLabel.textAlignment = .left
        titleLabel.text = "Inbox"
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
        
        let cell = MailCell(style: .default, reuseIdentifier: "mailCell")
        
        cell.cellTitle.text = mailFrom[indexPath.row]
        cell.cellDetail.text = mailDetails[indexPath.row]
        cell.cellDetail.sizeToFit()
        cell.cellDate.text = mailDate[indexPath.row]
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // White View for text
        whiteView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        whiteView.backgroundColor = .white
        view.addSubview(whiteView)
        
        // Gray View
        let grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: 450, height: 50)
        grayView.backgroundColor = UIColor(red: 0.9725, green: 0.9725, blue: 0.9725, alpha: 1.0)
        whiteView.addSubview(grayView)
        
        // Line to separate
        let lineGray = UIView()
        lineGray.frame = CGRect(x: 0, y: 50, width: 450, height: 1)
        lineGray.backgroundColor = .lightGray
        whiteView.addSubview(lineGray)
        
        // Back Button
        let backButton = UIButton()
        backButton.frame = CGRect(x: 5, y: 10, width: 100, height: 20)
        backButton.setTitle("< Inbox", for: .normal)
        backButton.setTitleColor(UIColor.blue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 12)
        backButton.titleLabel?.textAlignment = .left
        grayView.addSubview(backButton)
        
        // Email info
        let fromLabel = UILabel()
        fromLabel.frame = CGRect(x: 15, y: 60, width: 200, height: 20)
        fromLabel.text = "From:"
        fromLabel.font = UIFont(name: pixelArtFontName, size: 10)
        whiteView.addSubview(fromLabel)

        fromEmailLabel.frame = CGRect(x: 85, y: 60, width: 300, height: 20)
        fromEmailLabel.text = fromArray[indexPath.row]
        fromEmailLabel.font = UIFont(name: pixelArtFontName, size: 10)
        fromEmailLabel.textColor = .blue
        whiteView.addSubview(fromEmailLabel)
        
        let toLabel = UILabel()
        toLabel.frame = CGRect(x: 15, y: 90, width: 100, height: 20)
        toLabel.text = "To:"
        toLabel.font = UIFont(name: pixelArtFontName, size: 8)
        whiteView.addSubview(toLabel)
        
        let toEmailLabel = UILabel()
        toEmailLabel.frame = CGRect(x: 55, y: 90, width: 300, height: 20)
        toEmailLabel.text = toEmail[0]
        toEmailLabel.font = UIFont(name: pixelArtFontName, size: 8)
        toEmailLabel.textColor = .blue
        whiteView.addSubview(toEmailLabel)
        
        // Line to separate
        let line = UIView()
        line.frame = CGRect(x: 15, y: 130, width: 450, height: 1)
        line.backgroundColor = .gray
        whiteView.addSubview(line)
        
        // Title
        emailTitleLabel.frame = CGRect(x: 15, y: 150, width: 420, height: 40)
        emailTitleLabel.text = mailTitles[indexPath.row]
        emailTitleLabel.font = UIFont(name: pixelArtFontName, size: 12)
        emailTitleLabel.numberOfLines = 2
        emailTitleLabel.sizeToFit()
        whiteView.addSubview(emailTitleLabel)
        
        // Email image
        let emailImage = UIImageView()
        emailImage.frame = CGRect(x: 15, y: 200, width: 420, height: 200)
        emailImage.image = UIImage(named: "wwdc-email")
        emailImage.contentMode = .scaleToFill
        whiteView.addSubview(emailImage)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func goBack() {
        whiteView.removeFromSuperview()
        fromEmailLabel.text = ""
        emailTitleLabel.text = ""
    }

}


class MailCell: UITableViewCell {

    let cellTitle = UILabel()
    let cellDetail = UILabel()
    let cellDate = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Cell Title
        cellTitle.frame = CGRect(x: 10, y: 10, width: 400, height: 20)
        cellTitle.font = UIFont(name: pixelArtFontName, size: 10)
        contentView.addSubview(cellTitle)
        
        // Cell Detail
        cellDetail.frame = CGRect(x: 10, y: 30, width: 400, height: 30)
        cellDetail.font = UIFont(name: pixelArtFontName, size: 8)
        cellDetail.numberOfLines = 3
        cellDetail.textColor = .gray
        contentView.addSubview(cellDetail)
        
        // Date
        cellDate.frame = CGRect(x: 320, y: 5, width: 100, height: 30)
        cellDate.font = UIFont(name: pixelArtFontName, size: 8)
        cellDate.textColor = .gray
        cellDate.textAlignment = .right
        contentView.addSubview(cellDate)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




