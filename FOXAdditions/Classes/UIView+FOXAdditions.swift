

import UIKit

public extension UIView {
	
	/**
	Returns the UINib for this class using the className as the nibName and looking in the bundle for the class
	*/
    class func fox_nib() -> UINib {
        
        let nib = UINib(nibName: self.fox_className, bundle: Bundle(for: self))
        return nib
    }

	/**
	Returns the UINib for this class using the className as the nibName and looking in the given bundle
	*/
    class func fox_nib(inBundle bundle:Bundle) -> UINib {
        
        let nib = UINib(nibName: self.fox_className, bundle: bundle)
        return nib
    }

	/**
	Takes a snapshot of the view and returns it as a UIImage
	*/
    func fox_takeSnapshot() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
