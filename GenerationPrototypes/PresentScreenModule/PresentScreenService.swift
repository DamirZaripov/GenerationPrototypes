import Foundation

class PresentScreenService {
    
    let presentScreenService = PresentScreenService()
    
    func showButton(from element: ElementModel, button: UIButton) -> UIButton? {
        guard let elementModel = element as? Button else {
            return nil
        }
        
        var height = element.xMax - element.xMin
        var weight = element.yMin - element.yMax
        
        height = height * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        weight = weight * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        
        button.setTitle(element.value, .normal)
        
        button.frame = CGRectMake(element.xMax * GlobalVariables.coefficient, element.yMax * GlobalVariables.coefficient, height, weight)
        
        return button
    }
     
    func showLabel(from element: ElementModel, label: UILabel) -> UILabel? {
        guard let elementModel = element as? Label else {
            return nil
        }
        
        var height = element.xMax - element.xMin
        var weight = element.yMin - element.yMax
        
        height = height * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        weight = weight * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        
        label.text = element.value as! String
        
        label.frame = CGRectMake(element.xMax * GlobalVariables.coefficient, element.yMax * GlobalVariables.coefficient, height, weight)
        
        return label
     }
    
    func showSwitch(from element: ElementModel, switchUI: UISwitch) -> UILabel? {
        guard let elementModel = element as? Switch else {
            return nil
        }
        
        var height = element.xMax - element.xMin
        var weight = element.yMin - element.yMax
        
        height = height * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        weight = weight * UserDefaults.standard.object(forKey: GlobalVariables.coefficient)
        
        switchUI.on = element.value as! Bool
        
        switchUI.frame = CGRectMake(element.xMax * GlobalVariables.coefficient, element.yMax * GlobalVariables.coefficient, height, weight)
        
        return label
    }
}
