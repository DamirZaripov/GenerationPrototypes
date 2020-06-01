import Foundation

class UIElementService {
    
    var elementsArray: [[Any]]
    
    func generateUIElement(elementInfo: [Any]) {
        let coreDataService = CoreDataService()
        let generateUIElementService = GenerateUIElementService.shared
        let presentScreenService = PresentScreenService.shared
        
        guard let type = elementInfo[0] as? String else {
            return
        }
        
        switch type {
        case "Button":
            let uiButton = generateUIElementService.generateButton(coreDataService.createButton(elementInfo))
            let uiButtonShow = presentScreenService.showButton(element: coreDataService.createButton(elementInfo), button: uiButton)
            
        case "Label":
            let uiLabel = generateUIElementService.generateLabel(coreDataService.createLabel(elementInfo))
            let uiLabelShow = presentScreenService.showlabel(element: coreDataService.createLabel(elementInfo), label: uiLabel)
            
        case "ImageView":
            let uiImageView = generateUIElementService.generateImageView(coreDataService.createImageView(elementInfo))
            let uiImageViewShow = presentScreenService.showImageView(element: coreDataService.createImageView(elementInfo), imageView: uiImageView)
            
        case "SegmentedControl":
            let uiSegementControl = generateUIElementService.generateSegmentedControl(coreDataService.createSegmentedControl(elementInfo))
            let uiSegementControlShow = presentScreenService.showSegmentedControl(element: coreDataService.createSegmentedControl(elementInfo), segmentControl: uiSegementControl)
            
        case "Slider":
            let uiSlider = generateUIElementService.generateSlider(coreDataService.createSlider(elementInfo))
            let uiSliderShow = presentScreenService.showSlider(element: coreDataService.createSloder(elementInfo), slider: uiSlider)
            
        case "TableView":
            let uiTableView = generateUIElementService.generateTableView(coreDataService.createTableView(elementInfo))
            let uiTableViewShow = presentScreenService.showTableView(element: coreDataService.createTableView(elementInfo), tableView: uiTableView)
            
        case "TextView":
            let uiTextView = generateUIElementService.generateTextView(coreDataService.createTextView(elementInfo))
            let uiTextViewShow = presentScreenService.showTextView(element: coreDataService.createTextView(elementInfo), textView: uiTextView)
            
        case "Switch":
            let uiSwitch = generateUIElementService.generateSwitch(coreDataService.createSwitch(elementInfo))
            let uiSwitchShow = presentScreenService.showSwith(element: coreDataService.createSwitch(elementInfo), switch: uiSwitch)
            
        case "TextField ":
            let uiTextField = generateUIElementService.generateTextField(coreDataService.createTextField (elementInfo))
            let uiTextFieldShow = presentScreenService.showTextField(element: coreDataService.createSwitch(elementInfo), textField: uiTextField)
            
        default:
            return
        }
    }
    
    func presentUIElements() {
        let presentService = PresentScreenService.shared
        
        elementsArray.forEach { elementInfo in
            let element = self.generateUIElement(elementInfo)
            
        }
    }
    
//    func editUIElements(sender: Any) {
//        let editService = EditElementService.shared
//
//        editService.editElement(element: sender)
//    }
    
//    func saveUIElements() {
//
//    }
//
//    func getUIElements() {
//
//    }
}
