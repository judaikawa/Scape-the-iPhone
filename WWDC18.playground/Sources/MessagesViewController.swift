import Foundation
import UIKit


public class MessagesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let messagesTitles = ["0123", "Mom"]
    let messagesDetails = ["You used 60MB of internet today.", "Ok."]
    let messagesText1 = ["You used 60MB of internet today."]
    let messagesText2 = ["Hi mom, can you pick me up at 8?", "Ok."]
    let messagesDate = ["Yesterday  >", "21/03/18  >"]
    let messagesTime = ["Yesterday, 20:41", "21/03/18, 17:56"]
    let whiteView = UIView()
    let dateSentLabel = UILabel()
    let chatBaloon = UIImageView()
    let chatText = UILabel()
    let greenChatBaloon = UIImageView()
    let greenChatText = UILabel()
    
    public override func loadView() {
        
        passedInMessagesApp = true
        
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
        titleLabel.text = "Messages"
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        // TableView
        let tableView = UITableView()
        tableView.frame = CGRect(x: 20, y: 100, width: 430, height: 300)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
//        tableView.register(MessagesCell.self, forCellReuseIdentifier: "messagesCell")
        
        self.view = view
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MessagesCell(style: .default, reuseIdentifier: "messagesCell")

        cell.cellTitle.text = messagesTitles[indexPath.row]
        cell.cellDetail.text = messagesDetails[indexPath.row]
        cell.cellDate.text = messagesDate[indexPath.row]
        cell.contactImage.image = UIImage(named: "pixel-contact")
        //        cell?.detailTextLabel?.text = messagesDetails[indexPath.row]
        //        cell?.detailTextLabel?.font = UIFont(name: pixelArtFontName, size: 8)
        //        cell?.detailTextLabel?.textColor = .gray
//        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
        return 60.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // White View for text
        whiteView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        whiteView.backgroundColor = .white
        view.addSubview(whiteView)
        
        // Gray View
        let grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: 450, height: 100)
        grayView.backgroundColor = UIColor(red: 0.9725, green: 0.9725, blue: 0.9725, alpha: 1.0)
        whiteView.addSubview(grayView)
        
        // Line to separate
        let line = UIView()
        line.frame = CGRect(x: 0, y: 100, width: 450, height: 1)
        line.backgroundColor = .lightGray
        whiteView.addSubview(line)
        
        // Contact Image
        let contactImageView = UIImageView()
        contactImageView.frame = CGRect(x: 225 - 25, y: 50 - 25, width: 50, height: 50)
        contactImageView.image = UIImage(named: "pixel-contact")
        contactImageView.contentMode = .scaleAspectFit
        grayView.addSubview(contactImageView)
        
        // Contact Name
        let contactName = UILabel()
        contactName.frame = CGRect(x: 0, y: 78, width: 450, height: 20)
        contactName.text = messagesTitles[indexPath.row]
        contactName.textAlignment = .center
        contactName.font = UIFont(name: pixelArtFontName, size: 6)
        grayView.addSubview(contactName)
        
        // Back Button
        let backButton = UIButton()
        backButton.frame = CGRect(x: 5, y: 10, width: 30, height: 50)
        backButton.setTitle("<", for: .normal)
        backButton.setTitleColor(UIColor.blue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 20)
        backButton.titleLabel?.textAlignment = .left
        grayView.addSubview(backButton)
        
        // Date Sent
        dateSentLabel.frame = CGRect(x: 10, y: 120, width: 430, height: 20)
        dateSentLabel.text = messagesTime[indexPath.row]
        dateSentLabel.textColor = .black
        dateSentLabel.textAlignment = .center
        dateSentLabel.font = UIFont(name: pixelArtFontName, size: 6)
        whiteView.addSubview(dateSentLabel)
        
        // Chat Baloon
        chatBaloon.isHidden = false
        chatBaloon.image = UIImage(named: "pixel-chat")
        whiteView.addSubview(chatBaloon)
        // Text in Baloon
        chatText.frame = CGRect(x: 50, y: 5, width: 250, height: 50)
        chatText.textColor = .black
        chatText.textAlignment = .left
        chatText.numberOfLines = 10
        
        chatText.font = UIFont(name: pixelArtFontName, size: 10)
        chatBaloon.addSubview(chatText)
        // Green Chat Baloon
        greenChatBaloon.isHidden = false
        greenChatBaloon.image = UIImage(named: "pixel-chat-green")
        whiteView.addSubview(greenChatBaloon)
        // Text in Green Baloon
        greenChatText.frame = CGRect(x: 50, y: 5, width: 250, height: 50)
        greenChatText.textColor = .white
        greenChatText.textAlignment = .left
        greenChatText.numberOfLines = 10
        
        greenChatText.font = UIFont(name: pixelArtFontName, size: 10)
        greenChatBaloon.addSubview(greenChatText)
        
        if indexPath.row == 0 {
            greenChatBaloon.isHidden = true
            chatBaloon.frame = CGRect(x: 10, y: 150, width: 300, height: 70)
            chatText.text = messagesText1[0]
        } else {
            greenChatBaloon.frame = CGRect(x: 140, y: 150, width: 300, height: 70)
            chatBaloon.frame = CGRect(x: 10, y: 230, width: 300, height: 70)
            greenChatText.text = messagesText2[0]
            chatText.text = messagesText2[1]
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func goBack() {
        whiteView.removeFromSuperview()
        dateSentLabel.text = ""
        chatBaloon.isHidden = true
        chatText.text = ""
        greenChatBaloon.isHidden = true
        greenChatText.text = ""
    }
    
}


class MessagesCell: UITableViewCell {
    
    let contactImage = UIImageView()
    let cellTitle = UILabel()
    let cellDetail = UILabel()
    let cellDate = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Contact Image
        contactImage.frame = CGRect(x: 8, y: 10, width: 40, height: 40)
        contactImage.contentMode = .scaleAspectFit
        //    UIImageView.roundImage(image: contactImage, cornerRad: )
        contentView.addSubview(contactImage)
        
        // Cell Title
        cellTitle.frame = CGRect(x: 56, y: 10, width: 400, height: 20)
        cellTitle.font = UIFont(name: pixelArtFontName, size: 10)
        contentView.addSubview(cellTitle)
        
        // Cell Detail
        cellDetail.frame = CGRect(x: 56, y: 24, width: 400, height: 30)
        cellDetail.font = UIFont(name: pixelArtFontName, size: 8)
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
