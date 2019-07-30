
import UIKit
import SnapKit

open class KFXBarflyItem: UIBarButtonItem {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public let button:KFXButton
    
    // # Private/Fileprivate

    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(button:KFXButton) {
        self.button = button
        super.init()
        self.customView = button
    }
    
    public convenience init(buttonStyle:KFXButtonStyle = .system, title:String? = nil, image:UIImage? = nil, identifier:String? = nil, target:AnyObject, selector:Selector) {
        let button = KFXButton(buttonStyle: buttonStyle, title: title, image: image)
        button.identifier = identifier
        button.addTarget(target, action: selector, for: .touchUpInside)
        self.init(button: button)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
