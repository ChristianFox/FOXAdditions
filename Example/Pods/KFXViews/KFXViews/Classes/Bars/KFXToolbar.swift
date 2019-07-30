
import KFXBaseViews
import KFXCardView
import KFXTheming
import SnapKit

public typealias KFXToolbarButtonTapCallback = (_ button:KFXButton, _ toolbar:KFXToolbar) -> Void

public protocol KFXConfiguresToolbar {
    
    var useSafeAreaAtSides:Bool { get }
    var leftEdgeBarInset:CGFloat { get }
    var rightEdgeBarInset:CGFloat { get }
    var leftEdgeItemsInset:CGFloat { get }
    var rightEdgeItemsInset:CGFloat { get }
    var otherAxislength:CGFloat { get }
    var hideOutsideLine:Bool { get }
    var hideInsideLine:Bool { get }
    var insideLineColour:UIColor { get }
    var outsideLineColour:UIColor { get }
}

public struct KFXToolbarConfiguration : KFXConfiguresToolbar, KFXConfiguresBaseView {
    
    // ## Config Layout
    public var useSafeAreaAtSides:Bool = false
    public var leftEdgeBarInset:CGFloat = 0.0
    public var rightEdgeBarInset:CGFloat = 0.0
    public var leftEdgeItemsInset:CGFloat = 0.0
    public var rightEdgeItemsInset:CGFloat = 0.0
    public var otherAxislength:CGFloat = 50.0
    
    // ## Config Lines
    public var hideOutsideLine:Bool = false
    public var hideInsideLine:Bool = false
    public var insideLineColour:UIColor = .gray
    public var outsideLineColour:UIColor = .gray

    // ## Config BaseView
    public var backgroundColourAlpha:CGFloat = 1.0
    public var backgroundImage:UIImage?
    public var showBackgroundImage:Bool = false
    public var showBackgroundImageOverlay:Bool = false
    public var showBackgroundImageEffects:Bool = false
    public var hideBackgroundImageIfReduceTransparencyEnabled:Bool = true
    public var backgroundImageOverlayAlpha:CGFloat = 0.5

    public init(){ }
}

public enum KFXToolbarAnimationType {
    case crossDissolve
    case slide
}

open class KFXToolbar : KFXBaseView {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public var hideOutsideLine = false {
        didSet {
            outsideLineView.isHidden = hideOutsideLine
        }
    }
    public var hideInsideLine = false {
        didSet {
            insideLineView.isHidden = hideInsideLine
        }
    }
    public lazy var insideLineColour:UIColor = {
        return theme.colours.palette[4]
    }()
    public lazy var outsideLineColour:UIColor = {
        return theme.colours.palette[4]
    }()

    public var configuration:KFXToolbarConfiguration = KFXToolbarConfiguration()
    public var stackView:UIStackView {
        return _stackView
    }
    public var isOnScreen:Bool {
        return _isOnScreen
    }
    internal var buttonTapCallback:KFXToolbarButtonTapCallback?

    // # Private/Fileprivate
    private lazy var _stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    private lazy var outsideLineView:UIView = {
        let view = UIView()
        view.backgroundColor = outsideLineColour
        return view
    }()
    private lazy var insideLineView:UIView = {
        let view = UIView()
        view.backgroundColor = insideLineColour
        return view
    }()
    private var edge:CGRectEdge?
    private var _isOnScreen:Bool = false
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(configuration: KFXConfiguresToolbar? = KFXToolbarConfiguration()) {
        
        if let configuration = configuration as? KFXConfiguresBaseView {
            super.init(configuration: configuration)
            
        } else {
            super.init()
        }
        
        if let configuration = configuration {
            
            hideOutsideLine = configuration.hideOutsideLine
            hideInsideLine = configuration.hideInsideLine
            insideLineColour = configuration.insideLineColour
            outsideLineColour = configuration.outsideLineColour
            
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //------------------------------------
    // MARK: Animates
    //------------------------------------
    public func animate(onScreen:Bool, withType type:KFXToolbarAnimationType, duration:TimeInterval = 0.2) {
        
        switch type {
        case .crossDissolve:
            UIView.animate(withDuration: 1.0, animations: {
                self.alpha = onScreen ? 1.0 : 0.0
            }) { (finished) in
                self._isOnScreen = onScreen
            }
        case .slide:
            slide(onScreen: onScreen, duration: duration)
        }
    }

    //------------------------------------
    // MARK: Add To View
    //------------------------------------
    public func addToView(_ superview:UIView, atEdge edge:CGRectEdge, startOnScreen:Bool = true) {
        
        self.edge = edge
        superview.addSubview(self)
        addSubview(stackView)
        addSubview(outsideLineView)
        addSubview(insideLineView)
        
        makeConstraints()
    }

    //------------------------------------
    // MARK: Add View
    //------------------------------------
    public func addView(_ view:UIView) {

        stackView.addArrangedSubview(view)
    }
    
    //=======================================
    // MARK: Inherited
    //=======================================
    //------------------------------------
    // MARK: UIView
    //------------------------------------
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        guard edge != nil else {
            fatalError("Toolbar must be added to a view using addToView()")
        }
    }
    
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    override open func configureUI(){
        super.configureUI()
        backgroundColor = theme.colours.background.withAlphaComponent(backgroundColourAlpha)
        outsideLineView.isHidden = hideOutsideLine
        insideLineView.isHidden = hideInsideLine
    }
    
    override open func configureSubviewsLayout() {
        super.configureSubviewsLayout()
    }
    
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
        backgroundColor = theme.colours.background.withAlphaComponent(backgroundColourAlpha)
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    private func slide(onScreen:Bool, duration:TimeInterval) {
        
        guard let edge = self.edge, let superview = self.superview else {
            fatalError("KFXToolbar must have been added to a superview using addToView(_: atEdge:)")
        }
        
        superview.layoutIfNeeded()
        
        switch edge {
        case .minXEdge:
            self.snp.updateConstraints { (make) in
                if onScreen {
                    make.left.equalToSuperview() // Edge
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(self.configuration.otherAxislength)
                } else {
                    let safeInset = superview.safeAreaInsets.left*2.0
                    make.left.equalToSuperview().offset(-(self.configuration.otherAxislength+safeInset)) // Edge
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(-safeInset)
                }
            }
        case .minYEdge:
            self.snp.updateConstraints { (make) in
                if onScreen {
                    make.top.equalToSuperview() // Edge
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(self.configuration.otherAxislength)
                } else {
                    let safeInset = superview.safeAreaInsets.top*2.0
                    make.top.equalToSuperview().offset(-(self.configuration.otherAxislength+safeInset)) // Edge
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(-safeInset)
                }
            }
        case .maxXEdge:
            self.snp.updateConstraints { (make) in
                if onScreen {
                    make.right.equalToSuperview() // Edge
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-self.configuration.otherAxislength)
                } else {
                    let safeInset = superview.safeAreaInsets.right*2.0
                    make.right.equalToSuperview().offset(self.configuration.otherAxislength+safeInset) // Edge
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(safeInset)
                }
            }
        case .maxYEdge:
            self.snp.updateConstraints { (make) in
                if onScreen {
                    make.bottom.equalToSuperview() // Edge
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-self.configuration.otherAxislength)
                } else {
                    let safeInset = superview.safeAreaInsets.bottom*2.0
                    make.bottom.equalToSuperview().offset(self.configuration.otherAxislength+safeInset) // Edge
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(safeInset)
                }
            }
        }
        UIView.animate(withDuration: duration, animations: {
            
            superview.layoutIfNeeded()
            
        }) { (finished) in
            
            self._isOnScreen = onScreen
        }
    }
    
    
    private func makeConstraints() {
        
        guard let edge = self.edge, let superview = self.superview else {
            fatalError("KFXToolbar must have been added to a superview using addToView(_: atEdge:)")
        }
        
        switch edge {
        case .minXEdge:
            snp.makeConstraints { (make) in
                make.left.equalToSuperview() // Edge
                make.right.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(configuration.otherAxislength)
                if configuration.useSafeAreaAtSides {
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(configuration.leftEdgeBarInset)
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-configuration.rightEdgeBarInset)
                } else {
                    make.top.equalToSuperview().offset(configuration.leftEdgeBarInset)
                    make.bottom.equalToSuperview().offset(-configuration.rightEdgeBarInset)
                }
            }
            outsideLineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(1.0)
                make.left.equalTo(self.safeAreaLayoutGuide.snp.left)
            }
            insideLineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(1.0)
                make.right.equalToSuperview()
            }
            stackView.snp.makeConstraints { (make) in
                make.left.equalTo(outsideLineView.snp.right)
                make.right.equalTo(insideLineView.snp.left)
                if configuration.useSafeAreaAtSides {
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(configuration.leftEdgeItemsInset)
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-configuration.rightEdgeItemsInset)
                } else {
                    make.top.equalToSuperview().offset(configuration.leftEdgeItemsInset)
                    make.bottom.equalToSuperview().offset(-configuration.rightEdgeItemsInset)
                }
            }
        case .minYEdge:
            snp.makeConstraints { (make) in
                make.top.equalToSuperview() // Edge
                make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(configuration.otherAxislength)
                if configuration.useSafeAreaAtSides {
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(configuration.rightEdgeBarInset)
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-configuration.leftEdgeBarInset)
                } else {
                    make.left.equalToSuperview().offset(configuration.rightEdgeBarInset)
                    make.right.equalToSuperview().offset(-configuration.leftEdgeBarInset)
                }
            }
            outsideLineView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1.0)
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            }
            insideLineView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1.0)
                make.bottom.equalToSuperview()
            }
            stackView.snp.makeConstraints { (make) in
                make.bottom.equalTo(insideLineView.snp.top)
                make.top.equalTo(outsideLineView.snp.bottom)
                if configuration.useSafeAreaAtSides {
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(configuration.rightEdgeItemsInset)
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-configuration.leftEdgeItemsInset)
                } else {
                    make.left.equalToSuperview().offset(configuration.rightEdgeItemsInset)
                    make.right.equalToSuperview().offset(-configuration.leftEdgeItemsInset)
                }
            }
            
        case .maxXEdge:
            snp.makeConstraints { (make) in
                make.right.equalToSuperview() // Edge
                make.left.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-configuration.otherAxislength)
                if configuration.useSafeAreaAtSides {
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(configuration.rightEdgeBarInset)
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-configuration.leftEdgeBarInset)
                } else {
                    make.top.equalToSuperview().offset(configuration.rightEdgeBarInset)
                    make.bottom.equalToSuperview().offset(-configuration.leftEdgeBarInset)
                }
            }
            outsideLineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(1.0)
                make.right.equalTo(self.safeAreaLayoutGuide.snp.right)
            }
            insideLineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.width.equalTo(1.0)
                make.left.equalToSuperview()
            }
            stackView.snp.makeConstraints { (make) in
                make.left.equalTo(insideLineView.snp.right)
                make.right.equalTo(outsideLineView.snp.left)
                if configuration.useSafeAreaAtSides {
                    make.top.equalTo(superview.safeAreaLayoutGuide.snp.top).offset(configuration.rightEdgeItemsInset)
                    make.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-configuration.leftEdgeItemsInset)
                } else {
                    make.top.equalToSuperview().offset(configuration.rightEdgeItemsInset)
                    make.bottom.equalToSuperview().offset(-configuration.leftEdgeItemsInset)
                }
            }
        case .maxYEdge:
            snp.makeConstraints { (make) in
                make.bottom.equalToSuperview() // Edge
                make.top.equalTo(superview.safeAreaLayoutGuide.snp.bottom).offset(-configuration.otherAxislength)
                if configuration.useSafeAreaAtSides {
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(configuration.leftEdgeBarInset)
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-configuration.rightEdgeBarInset)
                } else {
                    make.left.equalToSuperview().offset(configuration.leftEdgeBarInset)
                    make.right.equalToSuperview().offset(configuration.rightEdgeBarInset)
                }
            }
            outsideLineView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1.0)
                make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
            }
            insideLineView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1.0)
                make.top.equalToSuperview()
            }
            stackView.snp.makeConstraints { (make) in
                make.bottom.equalTo(outsideLineView.snp.top)
                make.top.equalTo(insideLineView.snp.bottom)
                if configuration.useSafeAreaAtSides {
                    make.left.equalTo(superview.safeAreaLayoutGuide.snp.left).offset(configuration.leftEdgeItemsInset)
                    make.right.equalTo(superview.safeAreaLayoutGuide.snp.right).offset(-configuration.rightEdgeItemsInset)
                } else {
                    make.left.equalToSuperview().offset(configuration.leftEdgeItemsInset)
                    make.right.equalToSuperview().offset(-configuration.rightEdgeItemsInset)
                }
            }
        default:
            break
        }
        _isOnScreen = true
    }
    
}
