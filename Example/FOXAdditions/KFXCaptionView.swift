

import KFXBaseViews

class KFXCaptionView: KFXBaseView {

    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let edge:CGRectEdge
    private let sourceRect:CGRect
    private let sourceView:UIView
    private let cornerRadius:CGFloat
    private let triangleSize:CGSize
    private lazy var triangleView:KFXTriangleView = {
        let view = KFXTriangleView(pointingToEdge: edge)
        return view
    }()
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    init(pointingToEdge edge:CGRectEdge, sourceRect:CGRect, sourceView:UIView, cornerRadius:CGFloat, triangleSize:CGSize) {
        self.edge = edge
        self.cornerRadius = cornerRadius
        self.triangleSize = triangleSize
        self.sourceRect = sourceRect
        self.sourceView = sourceView
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    
    //=======================================
    // MARK: Inherited Methods
    //=======================================
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var roundedRect = rect
        switch self.edge {
        case .minXEdge:
            roundedRect.size.width -= triangleSize.width
            roundedRect.origin.x += triangleSize.width
        case .minYEdge:
            roundedRect.size.height -= triangleSize.height
            roundedRect.origin.y += triangleSize.height - 2.0
        case .maxXEdge:
            roundedRect.size.width -= triangleSize.width
//            roundedRect.origin.x += triangleSize.width
        case .maxYEdge:
            roundedRect.size.height -= triangleSize.height
//            roundedRect.origin.y += triangleSize.height - 2.0
        
        }
        
        let path = UIBezierPath(roundedRect:roundedRect, cornerRadius: self.cornerRadius)
        let layer : CAShapeLayer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.red.cgColor
        layer.lineWidth = 0.0
        layer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)

    }
    override func didMoveToSuperview() {
    
        super.didMoveToSuperview()
        
//        let converted = sourceView.superview?.convert(self.sourceRect, to: self.superview)
        addSubview(triangleView)
        triangleView.snp.makeConstraints { (make) in
            make.size.equalTo(self.triangleSize)
            
            switch self.edge {
            case .minXEdge:
                make.centerY.equalTo(sourceView)
                make.leading.equalTo(sourceView.snp.trailing)
            case .minYEdge:
                make.centerX.equalTo(sourceView)
                make.top.equalTo(sourceView.snp.bottom)
            case .maxXEdge:
                make.centerY.equalTo(sourceView)
                make.trailing.equalTo(sourceView.snp.leading)
            case .maxYEdge:
                make.centerX.equalTo(sourceView)
                make.bottom.equalTo(sourceView.snp.top)

            }

        }
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    internal override func configureUI(){
        super.configureUI()
    }
    
    internal override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        
        
        
    }
    

    
}

//=======================================
// MARK: Protocol Methods
//=======================================
