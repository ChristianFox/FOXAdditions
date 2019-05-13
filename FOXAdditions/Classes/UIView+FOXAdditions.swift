

import UIKit

public extension UIView {
    
    class func fox_nib() -> UINib{
        
        let nib = UINib(nibName: self.fox_className, bundle: Bundle(for: self))
        return nib
    }

    class func fox_nib(inBundle bundle:Bundle) -> UINib{
        
        let nib = UINib(nibName: self.fox_className, bundle: bundle)
        return nib
    }

    func fox_takeSnapshot() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
