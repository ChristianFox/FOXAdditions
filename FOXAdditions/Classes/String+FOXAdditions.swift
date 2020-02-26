
import Foundation

extension String {
    
    static func fox_memoryAddress(of object:AnyObject) -> String {
        "\(Unmanaged<AnyObject>.passUnretained(object).toOpaque())"
    }
    
}
