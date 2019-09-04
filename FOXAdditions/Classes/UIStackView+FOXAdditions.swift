
import UIKit

public extension UIStackView {
	
	/**
	Remove all arrangedSubviews.
	
	Loops through the arrangedSubviews and removes each from arrangedSubviews array and removeFromSuperview
	*/
    func fox_removeAllArrangedSubviews() {
        
        for subview in arrangedSubviews.reversed() {
            
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
