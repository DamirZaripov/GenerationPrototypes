import UIKit

class GenerateUIElementService {
    
    let generateUIElementService = GenerateUIElementService()
    
    func generateButton(from element: ElementModel) -> UIButton? {
        guard let button = element as? Button else {
            return nil
        }
        
        let uiButton = UIButton()
        
        if let title = button.value {
            uiButton.setTitle(title, for: .normal)
        } else {
            uiButton.setTitle("Button", for: .normal)
        }
        
        uiButton.setTitleColor(UIColor.blue, for: .normal)
        
        return uiButton
    }
    
    func generateLabel(from element: ElementModel) -> UILabel? {
         guard let label = element as? Button else {
             return nil
         }
         
         let uiLabel = UILabel()
         
         if let title = label.value {
            uiLabel.text = title
         } else {
            uiLabel.text = "Label"
         }
        
         return uiLabel
     }
    
    func generateSegmentedControl(from element: ElementModel) -> UISegmentedControl? {
        guard let segmentControl = element as? SegmentedControl else {
            return nil
        }
        
        let uiSegmentControl = UISegmentedControl()
        
        return uiSegmentControl
    }
    
    func generateTableView(from element: ElementModel) -> UITableView? {
        guard let tableView = element as? TableView else {
            return nil
        }
        
        let uiTableView = UITableView()
        
        return uiTableView
    }
    
    func generateSwitch(from element: element) -> UISwitch? {
        guard let switchCheck = ElementModel as? Switch else {
            return nil
        }
        
        let uiSwitch = UISwitch()
        
        if let value = switchCheck.value {
             uiSwitch.on = value
        } else {
             uiSwitch.on = false
        }
        
        return uiSwitch
    }
    
    func generateImageView(from element: element) -> UIImageView? {
        guard let imageView = ElementModel as? ImageView else {
            return nil
        }
        
        let imageName = "imagePlaceholder.png"
        let image = UIImage(named: imageName)
        let imageViewUI = UIImageView(image: image!)
        
        return imageViewUI
    }
    
    func generateTextView(from element: ElementModel) -> UITextView? {
        guard let textView = element as? TextView else {
            return nil
        }
        
        let textViewUI = UITextView()
        
        if let title = textView.value {
            textViewUI.text = title
        } else {
            textViewUI.text = "TextView"
        }
        
        return textViewUI
    }
    
    func generateTextField(from element: ElementModel) -> UITextField? {
        guard let textField = element as? TextField else {
            return nil
        }
        
        let textFieldUI = UITextField()
        
        if let title = textField.value {
            textFieldUI.text = title
        } else {
            textFieldUI.text = "TextField"
        }
        
        return textFieldUI
    }
    
    func generateSlider(from element: ElementModel) -> UISlider? {
         guard let slider = element as? Slider else {
             return nil
         }
         
         let uiSlider = UISlider()
         
         if let value = slider.value {
             uiSlider.value = value
         } else {
            uiSlider.value = 0
         }
         
         return uiSlider
     }
 }
