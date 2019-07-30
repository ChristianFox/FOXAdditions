
import KFXBaseViews
import FOXAdditions

class KFXTriangleView: KFXBaseView {
    
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private let edge:CGRectEdge
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    init(pointingToEdge edge:CGRectEdge) {
        self.edge = edge
        super.init()
        self.backgroundColor = .clear
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
        
        var controlX:CGFloat = 0.0
        var controlY:CGFloat = 0.0
        var baseCentreX:CGFloat = 0.0
        var baseCentreY:CGFloat = 0.0
        var size:CGSize = .zero
        switch self.edge {
        case .minXEdge:
            controlX = rect.size.width * 2.0
            controlY = rect.size.height / 2.0
            baseCentreX = rect.size.width
            baseCentreY = rect.size.height / 2.0
            size = CGSize(width: rect.width, height: rect.height / 2.0)
        case .maxXEdge:
            controlX = rect.size.width * -2.0
            controlY = rect.size.height / 2.0
            baseCentreX = 0.0
            baseCentreY = rect.size.height / 2.0
            size = CGSize(width: rect.width, height: rect.height / 2.0)
        case .minYEdge:
            controlX = rect.size.width / 2.0
            controlY = rect.size.height * 2.0
            baseCentreX = rect.size.width / 2.0
            baseCentreY = rect.size.height
            size = CGSize(width: rect.width / 2.0, height: rect.height)
        case .maxYEdge:
            controlX = rect.size.width / 2.0
            controlY = rect.size.height * -2.0
            baseCentreX = rect.size.width / 2.0
            baseCentreY = 0.0
            size = CGSize(width: rect.width / 2.0, height: rect.height)
        }
        let controlPoint:CGPoint = CGPoint(x: controlX, y: controlY)
        let centreBase = CGPoint(x: baseCentreX, y: baseCentreY)
        print("controlPoint:\(controlPoint); centreBase:\(centreBase); bounds:\(bounds); rect:\(rect); size:\(size)")
        let path = UIBezierPath.fox_triangle(withCentreBasePoint: centreBase, controlPoint: controlPoint, size: size)
        let layer : CAShapeLayer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.red.cgColor
        layer.lineWidth = 0.0
        layer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
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

