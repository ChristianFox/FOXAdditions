

import UIKit

public extension UITableViewCell {
	
	/**
	Use the class name as a reuseIdentifier
	*/
    class var fox_reuseIdentifier:String{
        return self.fox_className
    }
}
