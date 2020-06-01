import Foundation
import AVFoundation

class CameraService {
    
    // MARK: - Properties
    
    static let shared = PhotoService()
    
    var currentImage: UIImage?
    
    func getPhotoFromCamera() {
        let cameraControll = CameraController.shared()
        cameraControll.getPhotoFromCamera()
    }
    
    func sendPhotoToPhotoService() {
        let photoService = PhotoService.shared()
        photoService.currentImage = self.currentImage
    }
    
}
