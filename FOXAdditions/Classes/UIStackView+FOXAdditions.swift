
import UIKit

public extension UIStackView {
    
    func fox_removeAllArrangedSubviews() {
        
        for subview in arrangedSubviews.reversed() {
            
            removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
}
