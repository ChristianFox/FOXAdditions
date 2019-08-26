
import Foundation

public extension Optional {
    
    /*
     A nil-coalescing alternative for Swift from https://samhuri.net
    */
    public func orDefault(_ defaultValue: Wrapped) -> Wrapped {
        switch self {
            case .none:
                return defaultValue
            case let .some(value):
                return value
        }
    }

    public func orOptionals(_ optionals:[Wrapped?]? = nil, defaultValue: Wrapped) -> Wrapped {
        switch self {
        case .none:
            if let optionals = optionals {
                for item in optionals {
                    if let item = item {
                        return item
                    }
                }
            }
            return defaultValue
        case let .some(value):
            return value
        }
    }

}
