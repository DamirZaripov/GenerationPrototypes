import Foundation
import NSFetchRequest

class CoreDataService {
    
    // MARK: - Properties
    
    static let shared = CoreDataService()
    
    // Initialization
    
    func getAllProjects() -> [Project] {
        var allProjects: [Project] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entity: Project)
        
        do {
            if let result = try moc.fetchAll(request) as? [Project] {
                self.allProjects.append(result)
            }
        } catch { }
        
        return allProjects
    }
    
    func getProjectScreens() -> [Screen] {
        var projectScreens: [Screen] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entity: Screen)
              
              do {
                  if let result = try moc.fetchAll(request) as? [Screen] {
                      self.projectScreens.append(result)
                  }
              } catch { }
        
        return projectScreens
    }
    
    func getScreenElements() -> [Element] {
        var screenElements: [Screen] = []
         
        let request = NSFetchRequest<NSFetchRequestResult>(entity: Element)
        
        do {
            if let result = try moc.fetchAll(request) as? [Element] {
                self.screenElements.append(result)
            }
        } catch { }
        
        
        return screenElements
    }
    
    func getActionElements() -> [Action] {
        var actionElements: [Action] = []
         
        let request = NSFetchRequest<NSFetchRequestResult>(entity: Action)
        
        do {
            if let result = try moc.fetchAll(request) as? [Action] {
                self.actionElements.append(result)
            }
        } catch { }
        
        
        return actionElements
    }
    
    func saveProject(id: Int64) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let projectCD = NSEntityDescription.entity(forEntityName: "Project", in: managedContext)
        
        projectCD.setValue(id, forKey: "project_id")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func saveScreen(idScreen: Int64, idProject: Int64) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let screenCD = NSEntityDescription.entity(forEntityName: "Screen", in: managedContext)
        
        screenCD.setValue(idScreen, forKey: "id_screen")
        screenCD.setValue(idProject, forKey: "id_prject")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func saveAction(idAction: Int64, idElement: Int64, idScreen: Int64) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let actionCD = NSEntityDescription.entity(forEntityName: "Action", in: managedContext)
    
        actionCD.setValue(idScreen, forKey: "id_screen")
        actionCD.setValue(idProject, forKey: "id_prject")
        actionCD.setValue(idAction, forKey: "id_action")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func saveElement(idElement: Int64, idScreen: Int64, idAction: Int64, xMin: Double, xMax: Dobule, yMin: Double, yMax: Dobule, xScreen: Dobule, yScreen: Dobule, value: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let elementCD = NSEntityDescription.entity(forEntityName: "Element", in: managedContext)
        
        elementCD.setValue(value, forKey: "value")
        elementCD.setValue(yScreen, forKey: "y_screen")
        elementCD.setValue(xScreen, forKey: "x_screen")
        elementCD.setValue(yMax, forKey: "y_max")
        elementCD.setValue(yMin, forKey: "y_min")
        elementCD.setValue(xMax, forKey: "x_max")
        elementCD.setValue(xMin, forKey: "x_min")
        elementCD.setValue(idAction, forKey: "id_action")
        elementCD.setValue(idScreen, forKey: "id_screen")
        elementCD.setValue(idElement, forKey: "id_element")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
