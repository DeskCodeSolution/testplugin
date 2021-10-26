import Foundation
import Capacitor
import PhotosUI

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EchoPluginPlugin)
public class EchoPluginPlugin: CAPPlugin {
    private let implementation = EchoPlugin()
    let imagePicker = UIImagePickerController()
    var callPermission: CAPPluginCall?
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func askPermission(_ call: CAPPluginCall) {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) {(status) in
                self.showUI(status: status)
                self.callPermission = call
            }
        } else {
            PHPhotoLibrary.requestAuthorization({ (status) in
                self.showUI(status: status)
                self.callPermission = call
            })
        }
    }
        
    func showUI(status: PHAuthorizationStatus) {
        switch status {
        case .authorized:
            pickedImage()
            return
        case .limited:
            return
        case .restricted:
            return
        case .denied:
            return
        case .notDetermined:
            return
        default:
            return
        }
    }
    
    
    func pickedImage() {
        DispatchQueue.main.async {
            self.imagePicker.allowsEditing = false
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.bridge?.viewController?.present(self.imagePicker, animated: true, completion: nil)
        }
    }
}

//MARK:- Extension
extension EchoPluginPlugin: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            print(pickedImage)
            let imageData:NSData = pickedImage.pngData()! as NSData
            let base64Image = imageData.base64EncodedString()
            self.imagePicker.dismiss(animated: true) {
                self.callPermission?.resolve([
                    "base64Image": base64Image
                ])
            }
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
