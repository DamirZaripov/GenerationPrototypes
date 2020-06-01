import Foundation
import CoreData


extension Element {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Element> {
        return NSFetchRequest<Element>(entityName: "Element")
    }

    @NSManaged public var id_element: Int64
    @NSManaged public var id_screen: Int64
    @NSManaged public var x_min: Double
    @NSManaged public var id_action: Int64
    @NSManaged public var x_max: Double
    @NSManaged public var y_min: Double
    @NSManaged public var y_max: Double
    @NSManaged public var x_screen: Int64
    @NSManaged public var y_screen: Double
    @NSManaged public var value: String?

}
