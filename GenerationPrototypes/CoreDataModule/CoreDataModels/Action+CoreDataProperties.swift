import Foundation
import CoreData


extension Action {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Action> {
        return NSFetchRequest<Action>(entityName: "Action")
    }

    @NSManaged public var id_action: Int64
    @NSManaged public var id_element: Int64
    @NSManaged public var id_screen: Int64

}
