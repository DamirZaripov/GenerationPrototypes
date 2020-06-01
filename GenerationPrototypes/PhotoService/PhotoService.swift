import Foundation

class PhotoService {
    
    // MARK: - Properties
    
    static let shared = PhotoService()
    
    var currentImage: UIImage?
    
    func getPhotoFromCameraModule() {
        let cameraService = CameraService()
        cameraService.getPhotoFromCamera()
        
        self.sendPhotoToCoreMLModule()
    }
    
    func getPhotoFromLibraryModule() {
        let cameraService = LibrarySerivce()
        librarySerivce.getPhotoFromLibrary()
        
        self.sendPhotoToCoreMLModule()
    }
    
    func sendPhotoToCoreMLModule() {
        let coreMLService = CoreMLService.shared()
        
        guard let image = self.currentImage else {
            return
        }
        
        coreMLService.decodeImage(image: self.image)
    }
}
