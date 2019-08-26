
import KFXBaseViewControllers
import SnapKit

class ViewController: KFXBaseViewController {


    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    
    // # Private/Fileprivate
    
    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    
    //------------------------------------
    // MARK: Actions
    //------------------------------------
    @objc func buttonTapped(_ sender:UIButton) {
        
        let edge:CGRectEdge = .maxXEdge
        let captionView = KFXCaptionView(pointingToEdge: edge, sourceRect: sender.frame,sourceView: sender, cornerRadius: 5, triangleSize: CGSize(width: 40.0, height: 40.0))
        view.addSubview(captionView)
        captionView.snp.makeConstraints { (make) in
            
            switch edge {
            case .minXEdge:
                make.leading.equalTo(sender.snp.trailing)
                make.height.equalToSuperview().multipliedBy(0.6)
                make.width.equalTo(100)
                make.top.equalToSuperview().offset(40)
            case .minYEdge:
                make.top.equalTo(sender.snp.bottom)
                make.width.equalToSuperview().multipliedBy(0.6)
                make.height.equalTo(100)
            case .maxXEdge:
                make.trailing.equalTo(sender.snp.leading)
                make.height.equalToSuperview().multipliedBy(0.6)
                make.width.equalTo(100)
                make.top.equalToSuperview().offset(40)
            case .maxYEdge:
                make.bottom.equalTo(sender.snp.top)
                make.width.equalToSuperview().multipliedBy(0.6)
                make.height.equalTo(100)
                make.centerX.equalToSuperview()
            }
        }
        
        captionView.kfx_setShadow(withOffset: CGSize(width: 2.0, height: 2.0), radius: 4.0, opacity: 0.7)
    }
    
    //------------------------------------
    // MARK: View Lifecycle
    //------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let opt1:String? = nil
        let opt2:String = opt1.orDefault("some string")
        print("Option2 = \(opt2)")
        print("Option = \(opt1.orDefault("is nil"))")
        
        let aColour:UIColor? = nil
        print("colour = \(aColour.orOptionals([nil,nil,.green,nil], defaultValue:.blue))")
        
        let aString:String? = nil
        print("string = \(aString.orOptionals([nil,nil,nil], defaultValue: "This is the default"))")
    }
    
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    override func configureUI(){
        super.configureUI()
    }
    
    override func configureSubviewsLayout() {
        super.configureSubviewsLayout()
        
        let centre = UIView()
        centre.backgroundColor = .clear
        let up = KFXTriangleView(pointingToEdge: .minYEdge)
        let right = KFXTriangleView(pointingToEdge: .maxXEdge)
        let down = KFXTriangleView(pointingToEdge: .maxYEdge)
        let left = KFXTriangleView(pointingToEdge: .minXEdge)
        view.addSubview(centre)
        view.addSubview(up)
        view.addSubview(right)
        view.addSubview(down)
        view.addSubview(left)
        centre.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        let oppositeRectLength:CGFloat = 150
        up.snp.makeConstraints { (make) in
            make.bottom.equalTo(centre.snp.top)
            make.centerX.equalTo(centre)
            make.width.equalTo(centre)
            make.height.equalTo(oppositeRectLength)
        }
        right.snp.makeConstraints { (make) in
            make.leading.equalTo(centre.snp.trailing)
            make.centerY.equalTo(centre)
            make.height.equalTo(centre)
            make.width.equalTo(oppositeRectLength)
        }
        down.snp.makeConstraints { (make) in
            make.top.equalTo(centre.snp.bottom)
            make.centerX.equalTo(centre)
            make.width.equalTo(centre)
            make.height.equalTo(oppositeRectLength)
        }
        left.snp.makeConstraints { (make) in
            make.trailing.equalTo(centre.snp.leading)
            make.centerY.equalTo(centre)
            make.height.equalTo(centre)
            make.width.equalTo(oppositeRectLength)
        }

        let button = UIButton(type: .system)
        button.setTitle("CaptionView", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(50.0)
            make.top.equalToSuperview().offset(250.0)
        }

    }
    
    
}

//=======================================
// MARK: Protocol Methods
//=======================================

