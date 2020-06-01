import UIKit

class CameraViewController: UIViewController {
    let cameraController = CameraController()

    @IBOutlet fileprivate var captureButton: UIButton!

    @IBOutlet fileprivate var capturePreviewView: UIView!
    
    @IBOutlet fileprivate var photoModeButton: UIButton!
    @IBOutlet fileprivate var toggleCameraButton: UIButton!
    @IBOutlet fileprivate var toggleFlashButton: UIButton!

    override var prefersStatusBarHidden: Bool { return true }
}

extension CameraViewController {
    override func viewDidLoad() {
        func configureCameraController() {
            cameraController.prepare {(error) in
                if let error = error {
                    print(error)
                }

                try? self.cameraController.displayPreview(on: self.capturePreviewView)
            }
        }

        func styleCaptureButton() {
            captureButton.layer.borderColor = UIColor.black.cgColor
            captureButton.layer.borderWidth = 2

            captureButton.layer.cornerRadius = min(captureButton.frame.width, captureButton.frame.height) / 2
        }

        styleCaptureButton()
        configureCameraController()
    }
    
}
