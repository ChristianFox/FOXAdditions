
import UIKit
import KFXTheming

public typealias KFXBaseViewConfigCallback = (KFXBaseView) -> Void

public protocol KFXConfiguresBaseView {
    
    var backgroundColourAlpha:CGFloat { get }
    var backgroundImage:UIImage? { get }
    var showBackgroundImage:Bool { get }
    var showBackgroundImageOverlay:Bool { get }
    var showBackgroundImageEffects:Bool { get }
    var hideBackgroundImageIfReduceTransparencyEnabled:Bool { get }
    var backgroundImageOverlayAlpha:CGFloat { get }
}

public struct KFXBaseViewConfiguration : KFXConfiguresBaseView {

    public var backgroundColourAlpha:CGFloat = 1.0
    public var backgroundImage:UIImage?
    public var showBackgroundImage:Bool = false
    public var showBackgroundImageOverlay:Bool = false
    public var showBackgroundImageEffects:Bool = false
    public var hideBackgroundImageIfReduceTransparencyEnabled:Bool = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5

    public init() { }
}

open class KFXBaseView: UIView {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    public var backgroundImage:UIImage?
    public var backgroundColourAlpha:CGFloat = 1.0
    public var showBackgroundImage = false
    public var showBackgroundImageOverlay = false
    public var showBackgroundImageEffects = false
    public var hideBackgroundImageIfReduceTransparencyEnabled = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5
    public var postConfigureUICallback:KFXBaseViewConfigCallback?
    public var postConfigureSubviewsLayoutCallback:KFXBaseViewConfigCallback?
    public var postConfigureSubviewsFramesCallback:KFXBaseViewConfigCallback?
    public var postUpdateUIAfterThemeChangeCallback:KFXBaseViewConfigCallback?

    // # Private/Fileprivate
    private var backgroundImageView:UIImageView?
    private var backgroundImageOverlay:UIView?
    private var backgroundImageEffectView:UIVisualEffectView?

    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(configuration:KFXConfiguresBaseView = KFXBaseViewConfiguration()) {
        super.init(frame: .zero)

        backgroundImage = configuration.backgroundImage
        backgroundColourAlpha = configuration.backgroundColourAlpha
        showBackgroundImage = configuration.showBackgroundImage
        showBackgroundImageOverlay = configuration.showBackgroundImageOverlay
        showBackgroundImageEffects = configuration.showBackgroundImageEffects
        hideBackgroundImageIfReduceTransparencyEnabled = configuration.hideBackgroundImageIfReduceTransparencyEnabled
        backgroundImageOverlayAlpha = configuration.backgroundImageOverlayAlpha
        
        // # Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(base_didReceiveKFXThemeDidChangeNotification(_:)), name: Notification.Name(rawValue: KFXTheming.KFXThemeDidChangeNotification), object: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: KFXTheming.KFXThemeDidChangeNotification), object: nil)
    }
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open func configureUI(){
        // Base version of method, subclasses should all call super
        updateBackgroundImageIfNeeded()
    }
    
    open func configureSubviewsLayout(){
        // Base version of method, subclasses should all call super
        updateBackgroundImageLayoutIfNeeded()
    }
    
    open func configureSubviewsFrames() {
        // Base version of method, subclasses should all call super
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    open func updateUIAfterThemeChange() {
        // Base version of method, subclasses should all call super
        updateBackgroundImageIfNeeded()
        updateBackgroundImageLayoutIfNeeded()
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
        configureSubviewsFrames()
        postConfigureSubviewsFramesCallback?(self)
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Notifications
    //------------------------------------
    @objc private func base_didReceiveKFXThemeDidChangeNotification(_ note:Notification) {
        updateUIAfterThemeChange()
        postUpdateUIAfterThemeChangeCallback?(self)
    }

    //------------------------------------
    // MARK: Update
    //------------------------------------
    private func updateBackgroundImageIfNeeded() {
        
        // ## Create or update backgroundImageView
        if showBackgroundImage,
            let backgroundImage = backgroundImage {
            
            if let backgroundImageView = backgroundImageView {
                
                backgroundImageView.isHidden = false
                
                UIView.transition(with: backgroundImageView, duration: 0.25, options: .transitionCrossDissolve, animations: {
                    backgroundImageView.image = backgroundImage
                }, completion: nil)
                
            } else {
                
                backgroundImageView = UIImageView(image: backgroundImage)
                backgroundImageView?.contentMode = .scaleAspectFill
                backgroundImageView?.clipsToBounds = true
                backgroundImageView?.isHidden = false
                
            }

        } else {
            
            backgroundImageView?.isHidden = true
        }
        
        // ## Create and update backgroundImageOverlay
        if showBackgroundImageOverlay {
            
            if backgroundImageOverlay == nil {
                
                backgroundImageOverlay = UIView()
            }
            backgroundImageOverlay?.backgroundColor = theme.colours.background
            backgroundImageOverlay?.isHidden = false
        } else {
            backgroundImageOverlay?.isHidden = true
        }
        
        // ## Create EffectView (remove old if needed) and update backgroundImageOverlay.alpha
        if showBackgroundImageEffects && !UIAccessibility.isReduceTransparencyEnabled {
            
            if backgroundImageEffectView == nil {
                
                let blurEffect = UIBlurEffect(style: theme.background.blurEffectStyle)
                backgroundImageEffectView = UIVisualEffectView(effect: blurEffect)
                backgroundImageOverlay?.alpha = backgroundImageOverlayAlpha
                
            }
            backgroundImageEffectView?.isHidden = false
        } else {
            
            backgroundImageOverlay?.alpha = backgroundImageOverlayAlpha
            backgroundImageEffectView?.isHidden = true
        }
    }
    
    private func updateBackgroundImageLayoutIfNeeded() {
        
        if showBackgroundImage,
            backgroundImage != nil,
            let backgroundImageView = backgroundImageView {

            if backgroundImageView.superview == nil {
                
                insertSubview(backgroundImageView, at: 0)
                backgroundImageView.snp.makeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
            }

        }
        
        if showBackgroundImageOverlay {
            
            if let backgroundImageOverlay = backgroundImageOverlay,
                let backgroundImageView = backgroundImageView,
                backgroundImageOverlay.superview == nil {
                
                insertSubview(backgroundImageOverlay, aboveSubview: backgroundImageView)
                backgroundImageOverlay.snp.makeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
            }
        }
    
        if (showBackgroundImageEffects && !UIAccessibility.isReduceTransparencyEnabled),
            let backgroundImageEffectView = backgroundImageEffectView,
            backgroundImageEffectView.superview == nil {
            
            if let backgroundImageOverlay = backgroundImageOverlay,
                backgroundImageOverlay.superview != nil {
                
                insertSubview(backgroundImageEffectView, aboveSubview: backgroundImageOverlay)
                
            } else if let backgroundImageView = backgroundImageView {
                
                insertSubview(backgroundImageEffectView, aboveSubview: backgroundImageView)
                
            } else {
                
                insertSubview(backgroundImageEffectView, at: 0)
            }
            
            backgroundImageEffectView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }

}
