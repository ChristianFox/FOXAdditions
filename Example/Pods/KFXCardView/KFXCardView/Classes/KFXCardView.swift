
import UIKit
import KFXAdditions
import SnapKit

public typealias KFXCardViewConfigCallback = (KFXCardView) -> Void
public typealias KFXCardViewSingleTapHandler = (UITapGestureRecognizer) -> Void
public typealias KFXCardViewLongPressHandler = (UILongPressGestureRecognizer) -> Void

public enum KFXCardViewState {
    case invisible
    case visible
    case highlighted
}

public class KFXCardView: UIView {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public var currentViewState:KFXCardViewState = .visible
    /// The ViewState to return to when not being touched. Will use this after a longPress has ended
    public var restingViewState:KFXCardViewState = .visible
    public var borderRadius:CGFloat = 5.0
    public var borderWidth:CGFloat = 1.0
    public var dectectTouches = true
    public var highlightsOnTouch = true
    public var highlightOnTapDuration = 0.25
    public var showBackgroundImageEffects = false
    public var roundCorners = true {
        didSet {
            updateBorder(state: currentViewState)
        }
    }
    public var postConfigureUICallback:KFXCardViewConfigCallback?
    public var singleTapHandler:KFXCardViewSingleTapHandler?
    public var longPressHandler:KFXCardViewLongPressHandler?
    
    // # Private/Fileprivate
    private lazy var backgroundColours : [KFXCardViewState:UIColor] = {
        return [KFXCardViewState.invisible:UIColor.clear,
                KFXCardViewState.visible:UIColor.darkGray,
                KFXCardViewState.highlighted:UIColor.white
        ]
    }()
    private lazy var borderColours : [KFXCardViewState:UIColor] = {
        return [KFXCardViewState.invisible:UIColor.clear,
                KFXCardViewState.visible:UIColor.clear,
                KFXCardViewState.highlighted:UIColor.lightGray
        ]
    }()
    //    private var isFlashing = false
    private var isChangingViewState = false
    private var backgroundImageEffectView:UIVisualEffectView?
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    public func setBackgroundColour(_ colour:UIColor, forState state:KFXCardViewState) {
        backgroundColours[state] = colour
        if state == currentViewState {
            setViewState(state, animated: true, duration: 0.1, completion: nil)
        }
    }
    
    public func setBorderColour(_ colour:UIColor, forState state:KFXCardViewState) {
        borderColours[state] = colour
        if state == currentViewState {
            setViewState(state, animated: true, duration: 0.1, completion: nil)
        }
    }
    
    public func setViewState(_ newState:KFXCardViewState, animated:Bool = false, duration:TimeInterval = 0.2, completion:(() -> Void)?) {
        
        isChangingViewState = true
        let newBGColour = backgroundColours[newState]
        
        if !animated {
            backgroundColor = newBGColour
            updateBorder(state: newState)
            currentViewState = newState
            isChangingViewState = false
            completion?()
            
        }else{
            
            UIView.animate(withDuration: duration, animations: {
                self.backgroundColor = newBGColour
                self.updateBorder(state: newState)
                
            }) { (finished) in
                self.currentViewState = newState
                self.isChangingViewState = false
                completion?()
            }
        }
    }
    
    public func flashWithViewState(_ newState:KFXCardViewState, duration:TimeInterval,completion:(() -> Void)?) {
        
        if isChangingViewState {
            completion?()
            return
        }
        isChangingViewState = true
        let originalState = currentViewState
        setViewState(newState, animated: true, duration: duration) { [weak self] in
            guard let self = self else {
                completion?()
                return
            }
            self.setViewState(originalState, animated: true, duration: duration) {
                self.isChangingViewState = false
                completion?()
            }
        }
    }
    
    //=======================================
    // MARK: Inhertied Methods
    //=======================================
    override public func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configureUI()
        postConfigureUICallback?(self)
        addGesturesIfNeeded()
    }
    
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        if highlightsOnTouch && currentViewState == .visible {
//            setViewState(.highlighted, animated: true, duration: highlightOnTouchDuration, completion: nil)
//        }
//    }
//
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        if highlightsOnTouch && (currentViewState == .highlighted || isChangingViewState) {
//            setViewState(.visible, animated: true, duration: highlightOnTouchDuration, completion: nil)
//        }
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//        if highlightsOnTouch && (currentViewState == .highlighted || isChangingViewState) {
//            setViewState(.visible, animated: true, duration: highlightOnTouchDuration, completion: nil)
//        }
//    }
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    private func configureUI(){
        updateBorder(state: currentViewState)
        
        if showBackgroundImageEffects && !UIAccessibility.isReduceTransparencyEnabled {
            
            let blurEffect = UIBlurEffect(style: .regular)
            backgroundImageEffectView = UIVisualEffectView(effect: blurEffect)
            
            if showBackgroundImageEffects && !UIAccessibility.isReduceTransparencyEnabled,
                let backgroundImageEffectView = backgroundImageEffectView {
                
                insertSubview(backgroundImageEffectView, at: 0)
                backgroundImageEffectView.snp.makeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
            }
        }
    }
    
    //------------------------------------
    // MARK: Update
    //------------------------------------
    private func updateBorder(state:KFXCardViewState) {
        
        if self.roundCorners {
            let borderColour = borderColours[state]
            kfx_addBorder(withRadius: borderRadius, width: borderWidth, colour: borderColour)
        } else {
            kfx_addBorder(withRadius: 0.0, width: 0.0, colour: nil)
        }
    }
    
    private func addGesturesIfNeeded() {
        
        guard dectectTouches else {
            return
        }
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didDetectLongPress(_:)))
        longPress.cancelsTouchesInView = false
        addGestureRecognizer(longPress)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(didDetectSingleTap(_:)))
        singleTap.numberOfTapsRequired = 1
        addGestureRecognizer(singleTap)

    }
    
    @objc private func didDetectLongPress(_ sender:UILongPressGestureRecognizer) {
        
        if highlightsOnTouch {
            switch sender.state {
            case .began:
                setViewState(.highlighted, completion: nil)
            case .cancelled, .ended, .failed:
                setViewState(restingViewState, completion: nil)
            default:
                break
            }
        }
        longPressHandler?(sender)
    }
    
    @objc private func didDetectSingleTap(_ sender:UITapGestureRecognizer) {

        if highlightsOnTouch {
            flashWithViewState(.highlighted, duration: highlightOnTapDuration, completion: nil)
        }
        singleTapHandler?(sender)
    }

}
