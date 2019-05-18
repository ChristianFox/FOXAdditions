
import Foundation

public extension NSObject {
    
    var fox_className: String {
        let className = String(describing: type(of: self))
//        print("ClassName: \(className)")
        return className
    }
    
    class var fox_className: String {
        let className = String(describing: self)
//        print("ClassName: \(className)")
        return className
    }

}
