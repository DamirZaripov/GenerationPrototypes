import Foundation

class LibrarySerivce {
    
    // MARK: - Properties
    
    var image: UIImage?
    
    static let shared = LibrarySerivce()
    
    func getPhotoFromLibrary() {
        let options = PHFetchOptions()
        let userAlbums = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: PHAssetCollectionSubtype.any, options: options)

        let userPhotos = PHAsset.fetchKeyAssets(in: userAlbums.firstObject!, options: nil)
        let imageManager = PHCachingImageManager()

        userPhotos?.enumerateObjects({ (object: AnyObject!, count: Int, stop: UnsafeMutablePointer) in
            if object is PHAsset {
                let obj:PHAsset = object as! PHAsset

                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)

                let options = PHImageRequestOptions()
                options.deliveryMode = .fastFormat
                options.isSynchronous = true

                imageManager.requestImage(for: obj, targetSize: CGSize(width: obj.pixelWidth, height: obj.pixelHeight), contentMode: .aspectFill, options: options, resultHandler: { img, info in

                    self.images.append(img!)
                })
            }
        })
        
        let imagePicker = ImagePicker()
        
        imagePicker.didSelect = { image in
            self.image = image
        }
        
        self.sendPhotoToPhotoService
    }
    
    func sendPhotoToPhotoService() {
        let photoService = PhotoService.shared()
        photoService.currentImage = self.image
    }
}
