
import UIKit

open class KFXBarflySection: UIBarButtonItem {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public var stackView:UIStackView {
        return _stackView
    }
    // # Private/Fileprivate
    private lazy var _stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(subviews:[UIView], spacing:CGFloat = 4) {
        super.init()
        for aView in subviews {
            stackView.addArrangedSubview(aView)
        }
        stackView.spacing = spacing
        customView = stackView
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------
    // MARK:
    //------------------------------------
    
}
