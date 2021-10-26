import Foundation
import PhotosUI
import UIKit

@objc public class EchoPlugin: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    /*let imagePicker = UIImagePickerController()
    var base64Image = String()*/
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    /*@objc public func askPermission(complitionHandler: @escaping(String) -> Void) {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) {(status) in
                let permission = self.showUI(status: status)
                complitionHandler(permission)
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func showUI(status: PHAuthorizationStatus) -> String {
        switch status {
        case .authorized:
            pickedImage()
            return "authorized"
        case .limited:
            return "limited"
        case .restricted:
            return "restricted"
        case .denied:
            return "denied"
        case .notDetermined:
            return "notDetermined"
        default:
            return "not show"
        }
    }
    
    
    func pickedImage() {
        DispatchQueue.main.async {
            self.imagePicker.allowsEditing = false
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            UIApplication.shared.windows.first?.rootViewController?.present(self.imagePicker, animated: true, completion: {
                print("complition is true")
        
            })
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            print(pickedImage)
            let imageData:NSData = pickedImage.pngData()! as NSData
            base64Image = imageData.base64EncodedString()
            self.imagePicker.dismiss(animated: true, completion: nil)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }*/
    
}
