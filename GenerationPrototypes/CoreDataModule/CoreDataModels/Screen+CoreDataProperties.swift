import Foundation
import CoreData


extension Screen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Screen> {
        return NSFetchRequest<Screen>(entityName: "Screen")
    }

    @NSManaged public var id_screen: Int64
    @NSManaged public var id_project: Int64

}
