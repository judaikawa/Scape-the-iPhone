import Foundation
import UIKit


public class PhotosViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cameraVC = CameraViewController()
    
    var collectionView = UICollectionView(frame: CGRect(x: 1, y: 100, width: 448, height: 300), collectionViewLayout: UICollectionViewFlowLayout())
    
    public override func loadView() {

        passedInPhotosApp = true
        
        // VIEW
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
        titleLabel.text = "Camera Roll"
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
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
        
        view.addSubview(collectionView)
        
        self.view = view
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

