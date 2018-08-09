import Foundation
import UIKit

public class CameraViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let array = ["TIME-LAPSE", "SLO-MO", "VIDEO", "PHOTO", "SQUARE", "PANO"]
    var rotationAngle: CGFloat!
    var width: CGFloat = 120
    var height: CGFloat = 40
    let pickerView = UIPickerView()
    let cameraShotView = UIView()
    let lastPictureTaken = UIImageView()
    
    public override func loadView() {
        
        passedInCameraApp = true
        
        // View
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 450, height: 400)
        view.backgroundColor = .black
        
        // Switch Camera Button
        let switchCameraButton = UIButton()
        switchCameraButton.frame = CGRect(x: 450 - 50, y: 340, width: 40, height: 40)
        switchCameraButton.setImage(UIImage(named: "pixel-switchcamera"), for: .normal)
        view.addSubview(switchCameraButton)
        
        // Last Pictur View
        lastPictureTaken.frame = CGRect(x: 10, y: 340, width: 40, height: 40)
        lastPictureTaken.image = UIImage(named: "Glitch1-bw")
        lastPictureTaken.contentMode = .scaleToFill
        lastPictureTaken.alpha = 0
        view.addSubview(lastPictureTaken)
        
        // Picker View Rotation
        rotationAngle = -90 * (.pi/180)
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        // Picker View
        pickerView.frame = CGRect(x: 0, y: 300, width: 450, height: height)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(3, inComponent: 0, animated: false)
        view.addSubview(pickerView)
        
        // Camera View
        let cameraView = UIImageView()
        cameraView.frame = CGRect(x: 0, y: 60, width: 450, height: 240)
        cameraView.alpha = 0.7
        cameraView.backgroundColor = UIColor(patternImage: UIImage(named: "Glitch1-bw")!)
        view.addSubview(cameraView)
        
        cameraView.animationImages = [UIImage(named: "Glitch2-bw")!,UIImage(named: "Glitch3-bw")!,UIImage(named: "Glitch1-bw")!]
        cameraView.animationDuration = 4
        cameraView.startAnimating()
        
        // Camera Shot
        cameraShotView.frame = CGRect(x: 0, y: 0, width: 450, height: 240)
        cameraShotView.alpha = 0
        cameraShotView.backgroundColor = .black
        cameraView.addSubview(cameraShotView)
        
        // Camera Button
        let cameraButton = UIImageView()
        cameraButton.frame = CGRect(x: 225 - 20, y: 340, width: 40, height: 40)
        cameraButton.image = UIImage(named: "pixel-camera-button")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cameraButtonPressed))
        cameraButton.isUserInteractionEnabled = true
        cameraButton.addGestureRecognizer(tapGesture)
        view.addSubview(cameraButton)
        
        self.view = view
        
    }
    
    @objc func cameraButtonPressed() {
        
        numberOfPictures += 1
        UIView.animate(withDuration: 0.3, animations: {
            self.cameraShotView.alpha = 1
            self.lastPictureTaken.alpha = 0
        }, completion: { (finished) in

            if finished {
                self.cameraShotView.alpha = 0
                self.lastPictureTaken.alpha = 1
            }

        })
        
        
    }
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
//    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return array[row]
//    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: height, width: width, height: 20)
        label.textAlignment = .center
        label.font = UIFont(name: pixelArtFontName, size: 10)
        label.text = array[row]
        if pickerView.selectedRow(inComponent: 0) == row {
            label.textColor = UIColor(red: 0.9804, green: 0.5882, blue: 0.0157, alpha: 1.0)
        } else {
            label.textColor = .white
        }
        view.addSubview(label)
        
        // View Rotation
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        return view
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
    
}



