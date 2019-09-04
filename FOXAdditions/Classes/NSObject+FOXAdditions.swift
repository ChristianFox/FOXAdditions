
import Foundation

public extension NSObject {
    
    /**
     Returns the class name of the receiver
    */
    var fox_className: String {
        let className = String(describing: type(of: self))
        return className
    }
    
    /**
     Returns the class name of the receiver
     */
    class var fox_className: String {
        let className = String(describing: self)
        return className
    }

}
