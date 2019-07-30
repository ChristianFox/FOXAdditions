
import UIKit
import KFXAbstracts
import KFXTheming
import KFXUtilities
import KFXTextEditorVC
import NVActivityIndicatorView
import MZFormSheetPresentationController
import SnapKit

public typealias KFXBaseViewControllerConfigCallback = (KFXBaseViewController) -> Void

public protocol KFXConfiguresBaseVC {
    
    var activityIndicatorType:NVActivityIndicatorType { get }
    var backgroundImage:UIImage? { get }
    var backgroundColourAlpha:CGFloat { get }
    var showBackgroundImage:Bool { get }
    var showBackgroundImageOverlay:Bool { get }
    var showBackgroundImageEffects:Bool { get }
    var hideBackgroundImageIfReduceTransparencyEnabled:Bool { get }
    var backgroundImageOverlayAlpha:CGFloat { get }
    
}

public class KFXBaseVCConfiguration : KFXConfiguresBaseVC  {
    
    public var activityIndicatorType:NVActivityIndicatorType = .orbit
    public var backgroundImage:UIImage?
    public var backgroundColourAlpha:CGFloat = 1.0
    public var showBackgroundImage = false
    public var showBackgroundImageOverlay = false
    public var showBackgroundImageEffects = false
    public var hideBackgroundImageIfReduceTransparencyEnabled = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5
    
    public init() { }
}

open class KFXBaseViewController: KFXViewController, NVActivityIndicatorViewable {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    open var theme:KFXTheme {
        return KFXTheming.shared.currentTheme
    }
    
    // config: keep all as public var or make private let?
    
    public var activityIndicatorType:NVActivityIndicatorType = .orbit
    public var backgroundImage:UIImage? {
        didSet {
            backgroundImageView?.image = backgroundImage
        }
    }
    public var backgroundColourAlpha:CGFloat = 1.0
    public var showBackgroundImage = false
    public var showBackgroundImageOverlay = false
    public var showBackgroundImageEffects = false
    public var hideBackgroundImageIfReduceTransparencyEnabled = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5
    public var postConfigureUICallback:KFXBaseViewControllerConfigCallback?
    public var postConfigureSubviewsLayoutCallback:KFXBaseViewControllerConfigCallback?
    public var postConfigureSubviewsFramesCallback:KFXBaseViewControllerConfigCallback?
    public var postUpdateUIAfterThemeChangeCallback:KFXBaseViewControllerConfigCallback?

    // # Private/Fileprivate
    private var activityIndicatorView:NVActivityIndicatorView?
    private var backgroundImageView:UIImageView?
    private var backgroundImageOverlay:UIView?
    private var backgroundImageEffectView:UIVisualEffectView?
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(configuration:KFXConfiguresBaseVC? = nil) {
        
        super.init(nibName: nil, bundle: nil)
        self.configureWithConfiguration(configuration: configuration)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.configureWithConfiguration(configuration: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureWithConfiguration(configuration: nil)
    }
    
    private func configureWithConfiguration(configuration:KFXConfiguresBaseVC? = nil) {
        
        func configure(_ configuration:KFXConfiguresBaseVC) {
            
            activityIndicatorType = configuration.activityIndicatorType
            backgroundImage = configuration.backgroundImage
            backgroundColourAlpha = configuration.backgroundColourAlpha
            showBackgroundImage = configuration.showBackgroundImage
            showBackgroundImageOverlay = configuration.showBackgroundImageOverlay
            showBackgroundImageEffects = configuration.showBackgroundImageEffects
            hideBackgroundImageIfReduceTransparencyEnabled = configuration.hideBackgroundImageIfReduceTransparencyEnabled
            backgroundImageOverlayAlpha = configuration.backgroundImageOverlayAlpha
        }
        
        if let configuration = configuration {
            configure(configuration)
        } else {
            configure(KFXBaseVCConfiguration())
        }
    }
    
    //------------------------------------
    // MARK: Deinit
    //------------------------------------
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //------------------------------------
    // MARK: Activity Indicator
    //------------------------------------
    open func showActivityIndicator(message:String?, indicatorType:NVActivityIndicatorType? = nil, fullScreen:Bool = false, hideUI:Bool = false, size:CGSize = CGSize(width: 80.0, height: 80.0), padding:CGFloat = 20.0, backgroundColour:UIColor? = nil, foregroundColour:UIColor? = nil, borderColour:UIColor = .clear) {
        
        if fullScreen {
            
            var bgColour:UIColor?
            if hideUI {
                bgColour = backgroundColour ?? theme.colours.alertBackground
            }else{
                bgColour = nil
            }
            
            startAnimating(size, message: message, messageFont: theme.fonts.alertTitle, type: indicatorType ?? self.activityIndicatorType, color: theme.colours.branding, padding: padding, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: bgColour, textColor: foregroundColour ?? theme.colours.branding, fadeInAnimation: nil)

        }else{
            
            if self.activityIndicatorView != nil {
                self.activityIndicatorView?.stopAnimating()
                self.activityIndicatorView?.removeFromSuperview()
                self.activityIndicatorView = nil
            }
            let frame = kfx_CGRectMakeWithCentreAndSize(view.center, size)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                                type: indicatorType ?? self.activityIndicatorType)
            activityIndicatorView.color = foregroundColour ?? theme.colours.branding
            activityIndicatorView.backgroundColor = backgroundColour ?? theme.colours.alertBackground
            activityIndicatorView.padding = padding
            activityIndicatorView.kfx_addBorder(withRadius: 5.0, width: 1.0, colour: borderColour)
            self.activityIndicatorView = activityIndicatorView
            view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()

        }
    }
    
    open func hideActivityIndicator() {
        
        // Stop if fullScreen
        stopAnimating()
        
        // Stop if not fullScreen
        self.activityIndicatorView?.stopAnimating()
        self.activityIndicatorView?.removeFromSuperview()
        self.activityIndicatorView = nil
    }


    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        postConfigureUICallback?(self)
        configureSubviewsLayout()
        postConfigureSubviewsLayoutCallback?(self)

        // # Notifications
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKFXThemeDidChangeNotification(_:)), name: Notification.Name(rawValue: KFXTheming.KFXThemeDidChangeNotification), object: nil)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSubviewFrames()
        postConfigureSubviewsFramesCallback?(self)
    }
    
    open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (context) in

        }) { (context) in
            //            print("rotation completed")
            self.updateBackgroundImageIfNeeded()
        }
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open func configureUI(){
        // Base version of method, subclasses should all call super

        view.backgroundColor = theme.colours.background.withAlphaComponent(backgroundColourAlpha)
        updateBackgroundImageIfNeeded()
    }
    

    open func configureSubviewsLayout() {
        // Base version of method, subclasses should all call super
        
        updateBackgroundImageLayoutIfNeeded()
    }
    
    open func configureSubviewFrames() {
        // Base version of method, subclasses should all call super
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    open func updateUIAfterThemeChange() {
        // Base version of method, subclasses should all call super
        
        view.backgroundColor = theme.colours.background
        updateBackgroundImageIfNeeded()
        updateBackgroundImageLayoutIfNeeded()
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Notifications
    //------------------------------------
    @objc private func didReceiveKFXThemeDidChangeNotification(_ note:Notification) {
        updateUIAfterThemeChange()
        postUpdateUIAfterThemeChangeCallback?(self)
    }
    
    private func updateBackgroundImageIfNeeded() {
        
        // ## Create or update backgroundImageView
        if showBackgroundImage,
            let image = backgroundImage ?? KFXTheming.shared.backgroundImage {
            
            if let backgroundImageView = backgroundImageView {
                
                backgroundImageView.isHidden = false
                
                UIView.transition(with: backgroundImageView, duration: 0.25, options: .transitionCrossDissolve, animations: {
                    backgroundImageView.image = image
                }, completion: nil)
                
            } else {
                
                backgroundImageView = UIImageView(image: image)
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
                backgroundImageOverlay?.alpha = theme.background.imageOverlayAlpha
                
            }
            backgroundImageEffectView?.isHidden = false
            
        } else {
            
            backgroundImageOverlay?.alpha = 0.95
            backgroundImageEffectView?.isHidden = true
        }
        
    }
    
    private func updateBackgroundImageLayoutIfNeeded() {
        
        if showBackgroundImage,
            (backgroundImage ?? KFXTheming.shared.backgroundImage) != nil,
            let backgroundImageView = backgroundImageView {
                
                if backgroundImageView.superview == nil {
                    
                    view.insertSubview(backgroundImageView, at: 0)
                    backgroundImageView.snp.makeConstraints { (make) in
                        make.edges.equalToSuperview()
                    }
                }
        }
        
        if showBackgroundImageOverlay,
            let backgroundImageOverlay = backgroundImageOverlay,
            let backgroundImageView = backgroundImageView,
            backgroundImageOverlay.superview == nil {
            
            view.insertSubview(backgroundImageOverlay, aboveSubview: backgroundImageView)
            backgroundImageOverlay.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }

        if (showBackgroundImageEffects && !UIAccessibility.isReduceTransparencyEnabled),
            let backgroundImageEffectView = backgroundImageEffectView,
            backgroundImageEffectView.superview == nil {

            if let backgroundImageOverlay = backgroundImageOverlay,
                backgroundImageOverlay.superview != nil {
                
                view.insertSubview(backgroundImageEffectView, aboveSubview: backgroundImageOverlay)
                
            } else if let backgroundImageView = backgroundImageView {
                
                view.insertSubview(backgroundImageEffectView, aboveSubview: backgroundImageView)
                
            } else {
                
                view.insertSubview(backgroundImageEffectView, at: 0)
            }

            backgroundImageEffectView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }

}
