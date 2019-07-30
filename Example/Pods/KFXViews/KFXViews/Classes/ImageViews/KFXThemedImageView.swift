
import UIKit
import KFXTheming

open class KFXThemedImageView: UIImageView {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    open var style:KFXButtonStyle = .system {
        didSet{
            updateColours()
        }
    }
    open override var image: UIImage? {
        didSet {
            if image?.renderingMode != .alwaysTemplate {
                templateImage = image?.withRenderingMode(.alwaysTemplate)
            }
        }
    }
    
    // # Private/Fileprivate
    private var templateImage: UIImage?
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------

    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open func updateUIAfterThemeChange() {
        // Base version of method, subclasses should all call super
        updateColours()
    }

    //------------------------------------
    // MARK: Update
    //------------------------------------
    open func updateColours() {
        
        if templateImage != nil && templateImage != image {
            image = templateImage
        }

        let colour = style == .system ? theme.colours.systemButtonText : theme.colours.userButtonText
        UIView.animate(withDuration: 0.2) {
            self.tintColor = colour
        }
    }
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        // # Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKFXThemeDidChangeNotification(_:)), name: Notification.Name(rawValue: KFXTheming.KFXThemeDidChangeNotification), object: nil)
        
        updateColours()
    }

    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Notifications
    //------------------------------------
    @objc private func didReceiveKFXThemeDidChangeNotification(_ note:Notification) {
        updateUIAfterThemeChange()
    }

}
