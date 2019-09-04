
import Foundation

public extension Bundle {
	
	/**
	Returns the Resources Bundle for the cocoapod with pod bundle identifier that has the resourcesName.
	
	To get an image
	
		// Get the bundle by passing in any class from the pod and the resources name
		let bundle = Bundle.fox_podResourceBundle(withPodBundleIdentifier: "org.cocoapod.PODNAME", resourcesName: "PodResourceName")
	
		// Get the image using UIImage.init(named: in: compatibleWith:)
		let image = UIImage(named: named, in: bundle, compatibleWith: nil)
	
	*/
	class func fox_podResourceBundle(withPodBundleIdentifier identifier:String, resourcesName:String) -> Bundle? {
		
		guard let podBundle = Bundle.init(identifier: identifier) else {
			return nil
		}
		guard let resourceBundleURL = podBundle.url(forResource: resourcesName, withExtension: "bundle") else {
			return nil
		}
		return Bundle.init(url: resourceBundleURL)
	}
	
	/**
	Returns the Resources Bundle for the cocoapod that aClass belongs to that has the resourcesName.
	
	To get an image
	
		// Get the bundle by passing in any class from the pod and the resources name
		let bundle = Bundle.fox_podResourceBundle(aClass: ClassInPod.self, resourcesName: "PodResourceName")
	
		// Get the image using UIImage.init(named: in: compatibleWith:)
		let image = UIImage(named: named, in: bundle, compatibleWith: nil)
	*/
	class func fox_podResourceBundle(aClass: AnyClass, resourcesName:String) -> Bundle? {
		
		let podBundle = Bundle.init(for: aClass)
		guard let resourceBundleURL = podBundle.url(forResource: resourcesName, withExtension: "bundle") else {
			return nil
		}
		return Bundle.init(url: resourceBundleURL)
	}
	
}
