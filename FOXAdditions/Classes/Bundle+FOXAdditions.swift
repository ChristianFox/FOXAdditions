
import Foundation

public extension Bundle {
    
    class func fox_podResourceBundle(withPodBundleIdentifier identifier:String, resourcesName:String) -> Bundle? {
        
        guard let podBundle = Bundle.init(identifier: identifier) else {
            return nil
        }
        guard let resourceBundleURL = podBundle.url(forResource: resourcesName, withExtension: "bundle") else {
            return nil
        }
        return Bundle.init(url: resourceBundleURL)
    }

    class func fox_podResourceBundle(aClass: AnyClass, resourcesName:String) -> Bundle? {
        
        let podBundle = Bundle.init(for: aClass)
        guard let resourceBundleURL = podBundle.url(forResource: resourcesName, withExtension: "bundle") else {
            return nil
        }
        return Bundle.init(url: resourceBundleURL)
    }

}
