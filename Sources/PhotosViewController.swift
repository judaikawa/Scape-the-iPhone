import Foundation
import UIKit


public class PhotosViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cameraVC = CameraViewController()
    
    var collectionView = UICollectionView(frame: CGRect(x: 1, y: 100, width: 448, height: 300), collectionViewLayout: UICollectionViewFlowLayout())
    
    let mainView = UIView()
    let picView = UIView()
    
    public override func loadView() {

        passedInPhotosApp = true
        
        // VIEW
        mainView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        mainView.backgroundColor = .white
        
        // Gray View
        let grayView = UIView()
        grayView.frame = CGRect(x: 0, y: 0, width: 450, height: 80)
        grayView.backgroundColor = UIColor(red: 0.9725, green: 0.9725, blue: 0.9725, alpha: 1.0)
        mainView.addSubview(grayView)
        
        // Line to separate
        let line = UIView()
        line.frame = CGRect(x: 0, y: 80, width: 450, height: 1)
        line.backgroundColor = .lightGray
        mainView.addSubview(line)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 30, y: 30, width: 450, height: 40)
        titleLabel.font = UIFont(name: pixelArtFontName, size: 30)
        titleLabel.textAlignment = .left
        titleLabel.text = "Camera Roll"
        titleLabel.textColor = .black
        mainView.addSubview(titleLabel)
        
        // COLLECTION VIEW
        let collectionFrame = CGRect(x: 1, y: 100, width: 448, height: 300)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.itemSize = CGSize(width: 104.5, height: 104.5)
        
        collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: "photosCell")
        
        mainView.addSubview(collectionView)
        
        self.view = mainView
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return numberOfPictures+1

    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! PhotosCell
        
        cell.backgroundColor = UIColor(red: 0.5569, green: 0.8353, blue: 0.9294, alpha: 1.0)

        if indexPath.row < 1 {
            cell.image.image = UIImage(named: "ju-pixel")!
        } else {
            cell.image.image = UIImage(named: "Glitch1-bw")!
        }

        return cell

    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        picView.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        picView.backgroundColor = .white
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 5, y: 10, width: 30, height: 50)
        backButton.setTitle("< ", for: .normal)
        backButton.setTitleColor(UIColor.blue, for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.titleLabel?.font = UIFont(name: pixelArtFontName, size: 20)
        backButton.titleLabel?.textAlignment = .left
        picView.addSubview(backButton)
        
        let picImage = UIImageView()
        picImage.frame = CGRect(x: 0, y: 50, width: 450, height: 300)
        
        if indexPath.row == 0 {
            picImage.backgroundColor = UIColor(red: 0.5569, green: 0.8353, blue: 0.9294, alpha: 1.0)
            picImage.image = UIImage(named: "ju-pixel")!
        } else {
            picImage.image = UIImage(named: "Glitch1-bw")!
        }
        
        picView.addSubview(picImage)
        mainView.addSubview(picView)
        
        
    }
    
    @objc func goBack() {
        
        picView.removeFromSuperview()
    
    }
}

class PhotosCell: UICollectionViewCell {
    
    let image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image.frame = CGRect(x: 0, y: 0, width: 104.5, height: 104.5)
        image.contentMode = .scaleToFill
        contentView.addSubview(image)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

