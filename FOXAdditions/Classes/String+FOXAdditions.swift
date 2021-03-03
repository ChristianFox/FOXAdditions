
import Foundation

extension String {
    
    static func fox_memoryAddress(of object:AnyObject) -> String {
        "\(Unmanaged<AnyObject>.passUnretained(object).toOpaque())"
    }
    
}

//extension String.StringInterpolation {
//    
//    mutating func appendInterpolation<T>(describing value: Optional<T>) where T : CustomStringConvertible {
//        
//        appendLiteral(String(describing: value))
//    }
//    
//    mutating func appendInterpolation(wrapped value:Int?) {
//        
//        if let value = value {
//            appendLiteral("\(value)")
//        } else {
//            appendLiteral("nil")
//        }
//    }
//}
