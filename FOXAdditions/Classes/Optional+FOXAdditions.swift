
import Foundation

public extension Optional {
    
    /**
     A nil-coalescing alternative for Swift from https://samhuri.net
	
	Returns self if is .some or defaultValue if .none
    */
    func orDefault(_ defaultValue: Wrapped) -> Wrapped {
        switch self {
            case .none:
                return defaultValue
            case let .some(value):
                return value
        }
    }
    
    /**
     A nil-coalescing alternative for Swift which can return an optional
    
    Returns self if is .some or backupValue if .none
    */
    func orBackup(_ backupValue: Wrapped?) -> Wrapped? {
        switch self {
            case .none:
                return backupValue
            case let .some(value):
                return value
        }
    }


	/**
	A nil-coalescing alternative for Swift.
	
	Returns self if is .some or the first non-nil value from optionals or defaultValue as a last resort
	*/
    func orOptionals(_ optionals:[Wrapped?]? = nil, defaultValue: Wrapped) -> Wrapped {
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
