
import KFXBaseViews
import KFXTheming

public enum KFXTwoLabelsLayout {
    case leftTitleRightDetail
    case leftTitleLeftDetail
    case rightTitleLeftDetail
    case rightTitleRightDetail
}

public enum KFXTwoLabelsTextType {
    case info
    case content
    case sectionHeader
}

public class KFXTwoLabelsView : KFXBaseView {
    
    //------------------------------------
    // MARK: Properties
    //------------------------------------
    // # Public/Internal/Open
    public var textType:KFXTwoLabelsTextType = .info {
        didSet {
            updateLabels()
        }
    }
    public lazy var title:UILabel = {
        let label = UILabel()
        label.text = ".title"
        return label
    }()
    public lazy var detail:UILabel = {
        let label = UILabel()
        label.text = ".detail"
        return label
    }()
    public var labelsLayout:KFXTwoLabelsLayout = .leftTitleRightDetail

    // # Private/Fileprivate

    //=======================================
    // MARK: Public Methods
    //=======================================
    //------------------------------------
    // MARK: Initilisers
    //------------------------------------
    public init(withLayout labelsLayout:KFXTwoLabelsLayout = .leftTitleRightDetail, textType:KFXTwoLabelsTextType = .info) {
        self.textType = textType
        self.labelsLayout = labelsLayout
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //------------------------------------
    // MARK: Actions
    //------------------------------------
    public func setText(title:String?, detail:String?) {
        self.title.text = title
        self.detail.text = detail
    }

    //=======================================
    // MARK: Inherited Methods
    //=======================================
    //------------------------------------
    // MARK: Configure
    //------------------------------------
    open override func configureUI(){
        super.configureUI()
        updateLabels()
    }
    
    open override func configureSubviewsLayout(){
        super.configureSubviewsLayout()
        
        addSubview(title)
        addSubview(detail)
        
        switch labelsLayout {
        case .leftTitleRightDetail:
            
            title.snp.makeConstraints({ (make) in
                make.leading.equalToSuperview().offset(20)
                make.centerY.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
            })
            
            detail.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview().offset(-20)
                make.leading.greaterThanOrEqualTo(title.snp.trailing).offset(20.0)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            }
            detail.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            title.textAlignment = .left
            detail.textAlignment = .right
            
        case .leftTitleLeftDetail:
            
            title.snp.makeConstraints({ (make) in
                make.leading.equalToSuperview().offset(20)
                make.centerY.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            })
            
            detail.snp.makeConstraints { (make) in
                make.leading.equalTo(title.snp.trailing).offset(20)
                make.trailing.lessThanOrEqualToSuperview().offset(-20)
                make.centerY.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            
            title.textAlignment = .left
            detail.textAlignment = .left
            
        case .rightTitleLeftDetail:
            
            title.snp.makeConstraints({ (make) in
                make.trailing.equalToSuperview().offset(-20)
                make.centerY.equalToSuperview()
                make.leading.greaterThanOrEqualTo(detail.snp.trailing).offset(20)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            })
            
            detail.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(20)
                make.centerY.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            }
            
            title.textAlignment = .right
            detail.textAlignment = .left
        case .rightTitleRightDetail:
            
            title.snp.makeConstraints({ (make) in
                make.trailing.equalToSuperview().offset(-20)
                make.centerY.equalToSuperview()
                make.leading.equalTo(detail.snp.trailing).offset(20)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            })
            detail.snp.makeConstraints { (make) in
                make.leading.greaterThanOrEqualToSuperview().offset(20)
                make.centerY.equalToSuperview()
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                
            }
            title.textAlignment = .right
            detail.textAlignment = .right
        }
    }
    
    open override func updateUIAfterThemeChange() {
        super.updateUIAfterThemeChange()
        updateLabels()
    }
    
    //=======================================
    // MARK: Private Methods
    //=======================================
    private func updateLabels(){
        
        switch textType {
        case .info:
            title.font = theme.fonts.infoTitle
            title.textColor = theme.colours.infoTitleText
            detail.font = theme.fonts.infoDetail
            detail.textColor = theme.colours.infoDetailText
        case .content:
            title.font = theme.fonts.contentLight
            title.textColor = theme.colours.contentText
            detail.font = theme.fonts.contentEmphasised
            detail.textColor = theme.colours.contentText
        case .sectionHeader:
            title.font = theme.fonts.sectionHeader
            title.textColor = theme.colours.sectionHeaderText
            detail.font = theme.fonts.sectionHeader
            detail.textColor = theme.colours.sectionHeaderText
        }
    }
    
}
