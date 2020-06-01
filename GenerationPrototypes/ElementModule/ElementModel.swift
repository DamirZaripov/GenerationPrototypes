import Foundation

protocol ElementModel {
    
    var idElement: Int64? { get set }
    
    var idScreen: Int64? { get set }
    
    var xMin: Double? { get set }
    
    var idAction: Int64? { get set }
    
    var xMax: Double? { get set }
    
    var yMin: Double? { get set }
    
    var yMax: Double? { get set }
    
    var xScreen: Int64? { get set }
    
    var yYcreen: Double? { get set }
    
    var value: String? { get set }
}
