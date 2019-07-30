
import UIKit
import SnapKit

/*
 Not ready for use yet. Close to it, needs:
 - Handle rounded corners
 - Add some properties: size, offset etc
 
 */
internal class KFXShadowView: UIView {
    
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    private var cornerRadius:CGFloat?
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //------------------------------------
    // MARK: Actions
    //------------------------------------
    public func addToSuperView(_ theSuperview:UIView, providingShadowForView targetView:UIView) {
    
        theSuperview.insertSubview(self, belowSubview: targetView)
        self.snp.makeConstraints { (make) in
            make.top.leading.equalTo(targetView)
            make.bottom.equalTo(targetView)//.offset(1.0)
            make.trailing.equalTo(targetView)//.offset(1.0)
        }
        if targetView.layer.cornerRadius > 0.0 {
//            self.kfx_addBorder(withRadius: targetView.layer.cornerRadius, width: targetView.layer.borderWidth, colour: .clear)
            cornerRadius = targetView.layer.cornerRadius
        }
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    override open func draw(_ rect: CGRect) {

        let shadowSize:CGSize = CGSize(width: 3.0, height: 3.0)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.minX + shadowSize.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - shadowSize.width, y: rect.maxY))

        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - shadowSize.height),
                      controlPoint1: CGPoint(x: rect.maxX - (shadowSize.width * 3), y: rect.maxY),
                      controlPoint2: CGPoint(x: rect.maxX, y: rect.maxY - (shadowSize.height * 3)))
//        path.addArc(withCenter: CGPoint(x: rect.maxX, y: <#T##CGFloat#>), radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
//        [path addArcWithCenter:leftCircleCenter
//            radius:smallRadius
//            startAngle:straightLeftAngle
//            endAngle:straightUpAngle
//            clockwise:YES];

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + shadowSize.height))
        path.addLine(to: CGPoint(x: rect.maxX + shadowSize.width, y: rect.minY + shadowSize.height))
        
        path.addLine(to: CGPoint(x: rect.maxX + shadowSize.width, y: rect.maxY - shadowSize.height))
        path.addCurve(to: CGPoint(x: rect.maxX - shadowSize.width, y: rect.maxY + shadowSize.height),
                      controlPoint1: CGPoint(x: rect.maxX + shadowSize.width, y: rect.maxY - (shadowSize.height * 3)),
                      controlPoint2: CGPoint(x: rect.maxX - (shadowSize.width * 3), y: rect.maxY))

        
//        path.addLine(to: CGPoint(x: rect.maxX + shadowSize.width, y: rect.maxY + shadowSize.height))
        
        
        path.addLine(to: CGPoint(x: rect.minX + shadowSize.width, y: rect.maxY + shadowSize.height))
        path.close()
        path.lineJoinStyle = .round
        path.lineCapStyle = .round
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 1
        layer.fillColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(layer)
    }

    /*
 override open func draw(_ rect: CGRect) {
 
 let shadowSize:CGSize = CGSize(width: 3.0, height: 3.0)
 let path = UIBezierPath()
 path.move(to: CGPoint(x: rect.minX + shadowSize.width, y: rect.maxY))
 path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
 path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + shadowSize.height))
 path.addLine(to: CGPoint(x: rect.maxX + shadowSize.width, y: rect.minY + shadowSize.height))
 path.addLine(to: CGPoint(x: rect.maxX + shadowSize.width, y: rect.maxY + shadowSize.height))
 path.addLine(to: CGPoint(x: rect.minX + shadowSize.width, y: rect.maxY + shadowSize.height))
 path.close()
 path.lineJoinStyle = .round
 path.lineCapStyle = .round
 
 let layer = CAShapeLayer()
 layer.path = path.cgPath
 layer.lineWidth = 1
 layer.fillColor = UIColor.lightGray.cgColor
 self.layer.addSublayer(layer)
 }

 */

}
