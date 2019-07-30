
import UIKit
import KFXTheming

public enum KFXButtonStyle {
    case system
    case user
}

public typealias KFXButtonConfigCallback = (KFXButton) -> Void


open class KFXButton: UIButton {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var identifier:String?
    open var buttonStyle:KFXButtonStyle = .system {
        didSet{
            updateColours()
        }
    }
    public var manageTinting = true {
        didSet {
            adjustsImageWhenHighlighted = !manageTinting
            updateColours()
        }
    }
    public var isSelectable = false {
        didSet {
            updateColours()
        }
    }
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    open override var isSelected: Bool {
        didSet {
            updateColours()
        }
    }
    open override var isHighlighted: Bool {
        didSet {
            updateColours()
        }
    }
    public var isActive:Bool {
        return (isSelectable && isSelected) || isHighlighted
    }
    public var postConfigureUICallback:KFXButtonConfigCallback?
    public var postConfigureSubviewsLayoutCallback:KFXButtonConfigCallback?
    public var postUpdateUIAfterThemeChangeCallback:KFXButtonConfigCallback?

    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(buttonStyle:KFXButtonStyle = .system, title:String? = nil, image:UIImage? = nil) {
        super.init(frame: .zero)
        self.buttonStyle = buttonStyle
        self.setImage(image, for: .normal)
        self.setTitle(title, for: .normal)
        updateColours()
        adjustsImageWhenHighlighted = !manageTinting
        
        addTarget(self, action: #selector(didTouchUpInside(_:)), for: .touchUpInside)

        // # Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKFXThemeDidChangeNotification(_:)), name: Notification.Name(rawValue: KFXTheming.KFXThemeDidChangeNotification), object: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open func configureUI() {
        // Base version of method, subclasses should all call super
    }
    
    open func configureSubviewsLayout() {
        // Base version of method, subclasses should all call super
    }
    
    open func updateUIAfterThemeChange() {
        // Base version of method, subclasses should all call super
        updateColours()
    }

    //------------------------------------
    // MARK: Update
    //------------------------------------
    open func updateColours() {
        
        let colour = (buttonStyle == .system && !isActive) || (buttonStyle == .user && isActive) ? theme.colours.systemButtonText : theme.colours.userButtonText
        tintColor = colour
        setTitleColor(colour, for: .normal)
    }
    

    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureUI()
        postConfigureUICallback?(self)
        configureSubviewsLayout()
        postConfigureSubviewsLayoutCallback?(self)
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    @objc func didTouchUpInside(_ sender:KFXButton) {
//        print(#function)
        if isSelectable {
            isSelected = !isSelected
        }
    }
    
    //------------------------------------
    // MARK: Notifications
    //------------------------------------
    @objc private func didReceiveKFXThemeDidChangeNotification(_ note:Notification) {
        updateUIAfterThemeChange()
        postUpdateUIAfterThemeChangeCallback?(self)
    }


}
